package shop.DAO;

import java.sql.SQLException;
import java.util.UUID;

import shop.DTO.PersistentLogins;
import shop.DTO.Users;

public class UserDAO extends JDBConnection {

	/**
	 * 회원 가입
	 * @param user
	 * @return
	 */
	public int join(Users user) {
		int result = 0;		// 결과 : 적용된 데이터 건수
		
		String sql = " INSERT INTO users (id,password,name,gender,birth,mail,join_date,reg_date,upd_date) "
				   + " VALUES(?, ?, ?, ?, ?, ?, sysdate, sysdate, sysdate) ";
		
		try {
			psmt = con.prepareStatement(sql);			// 쿼리 실행 객체 생성
			psmt.setString( 1, user.getId() );		
			psmt.setString( 2, user.getPassword() );		
			psmt.setString( 3, user.getName() );		
			psmt.setString( 4, user.getGender() );		
			psmt.setString( 5, user.getBirth() );		
			psmt.setString( 6, user.getMail() );		
			result = psmt.executeUpdate();		// SQL 실행 요청, 적용된 데이터 개수를 받아온다.
												// 게시글 1개 적용 성공 시, result : 1
												// 				실패 시, result : 0
			// executeUpdate()
			// : SQL (INSERT, UPDATE, DELETE)을 실행하고 적용된 데이터 개수를 int 타입으로 반환
		} catch (SQLException e) {
			System.err.println("회원 등록 시, 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 로그인
	 * @param user
	 * @return
	 */
	public Users login(Users user) {

		// SQL 작성
		String sql = " SELECT * "
				   + " FROM users "
				   + " WHERE id = ? and password = ? ";
		try {
			// 쿼리(SQL) 실행 객체 생성 - PreparedStatement (psmt)
			psmt = con.prepareStatement(sql);
			
			// psmt.setXXX( 순서번호, 매핑할 값 );
			psmt.setString( 1, user.getId() );		
			psmt.setString( 2, user.getPassword() );		
			
			// 쿼리(SQL) 실행 -> 결과  - ResultSet (rs)
			rs = psmt.executeQuery();
			
			// 조회 결과를 1건 가져오기
			if( rs.next() ) {		// next() : 실행 결과의 다음 데이터로 이동
				// 결과 데이터 가져오기
				// rs.getXXX("컬럼명") --> 해당 컬럼의 데이터를 가져온다
				// * "컬럼명"의 값을 특정 타입으로 변환
				user.setId(rs.getString("id") );
				user.setPassword(rs.getString("password") );
				user.setName(rs.getString("name") );
				user.setGender(rs.getString("gender") );
				user.setMail(rs.getString("mail") );
				user.setJoinDate(rs.getDate("join_date") );
				user.setRegDate(rs.getDate("reg_date") );
				user.setUpdDate(rs.getDate("upd_date") );
				return user;
			}
			return null;
		} catch(SQLException e) {
			System.err.println("로그인 시, 예외 발생");
			e.printStackTrace();
		}
			
		return null;
	}
	
	
	/**
	 * 토큰생성
	 * @param userId
	 * @return
	 */
	public String insertToken(String userId) {
		int result = 0;
		String sql = " INSERT INTO persistent_logins (p_no, user_id, token)"
					+ " VALUES ( SEQ_PER_LOGIN.nextval, ?, ?) ";
		
		// 토큰 발행
		String token = UUID.randomUUID().toString();
		
		try {
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, userId);
			psmt.setString(2, token);
			
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("자동 로그인 정보 등록 중, 에러 발생!");
			e.printStackTrace();
		}
		System.out.println("자동 로그인 정보" + result + "개 등록되었습니다.");
		return token;
	}
	
	
	/**
	 * 토큰 조회 
	 * - userId 로 조회
	 * @param userId
	 * @return
	 */
	public PersistentLogins selectToken(String userId) {
		String sql =  " SELECT * "
					+ " FROM persistent_logins "
					+ " WHERE user_id = ? ";
		
		PersistentLogins persistentLogins = null;
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, userId);
			
			rs = psmt.executeQuery();
			if( rs.next() ) {
				persistentLogins = new PersistentLogins();
				persistentLogins.setpNo(rs.getInt("p_no"));
				persistentLogins.setUserId(rs.getString("user_id"));
				persistentLogins.setToken(rs.getString("token"));
				persistentLogins.setRegDate(rs.getDate("reg_date"));
				persistentLogins.setUpdDate(rs.getDate("upd_date"));
			}
			rs.close();
		}catch (SQLException e){
			System.err.println("자동 로그인 정보 조회 중, 에러 발생!");
			e.printStackTrace();
		}
		return persistentLogins;
	}
	
	/**
	 * 토큰 수정
	 * - 기존 토큰 존재 시, 갱신
	 * @param userId
	 * @return
	 */
	public String updateToken(String userId) {
		int result = 0;
		String sql = " UPDATE persistent_logins "
					+ " SET token = ? "
					+ " 	,upd_date = sysdate "
					+ " WHERE user_id = ? ";
		
		// 토큰 발행
		String token = UUID.randomUUID().toString();
		
		try {
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, token);
			psmt.setString(2, userId);
			
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("자동 로그인 정보 수정 중, 에러 발생!");
			e.printStackTrace();
		}
		System.out.println("자동 로그인 정보" + result + "개 수정되었습니다.");
		return token;
	}
	
	
	/**
	 * 토큰 조회 
	 * - token 으로 조회
	 * @param token
	 * @return
	 */
	public PersistentLogins selectTokenByToken(String token) {
		String sql =  " SELECT * "
					+ " FROM persistent_logins "
					+ " WHERE token = ? ";
		
		PersistentLogins persistentLogins = null;
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, token);
			
			rs = psmt.executeQuery();
			if( rs.next() ) {
				persistentLogins = new PersistentLogins();
				persistentLogins.setpNo(rs.getInt("p_no"));
				persistentLogins.setUserId(rs.getString("user_id"));
				persistentLogins.setToken(rs.getString("token"));
				persistentLogins.setRegDate(rs.getDate("reg_date"));
				persistentLogins.setUpdDate(rs.getDate("upd_date"));
			}
			rs.close();
		}catch (SQLException e){
			System.err.println("자동 로그인 정보 조회 중, 에러 발생!");
			e.printStackTrace();
		}
		return persistentLogins;
	}
	
	
	/**
	 * 토큰 삭제
	 * - 로그아웃 시, 자동 로그인 해제
	 * @param userId
	 * @return
	 */
	public int deleteToken(String userId) {
		int result = 0;
		String sql = " DELETE FROM persistent_logins WHERE user_id = ? " ;
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, userId);
		} catch (SQLException e) {
			System.err.println("자동 로그인 정보 삭제 중, 에러 발생!");
			e.printStackTrace();
		}
		System.out.println("자동 로그인 정보" + result + " 개의 데이터가 삭제되었습니다.");
		return result;
	}
	
}






