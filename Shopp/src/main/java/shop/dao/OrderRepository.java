package shop.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import shop.dto.Order;
import shop.dto.Product;

public class OrderRepository extends JDBConnection {
	
	/**
	 * 주문등록
	 * @param order
	 * @return
	 */
	public int insert(Order order) {
		int result = 0;
		String sql = " INSERT INTO order ( ship_name, zip_code, country, address, date, order_pw, user_id, total_price, phone) "
				   + " VALUES( ?, ?, ?, ?, ?, ?, ?, ?, ? ) ";
		
		try {
			psmt = con.prepareStatement(sql);			
			psmt.setString( 1, order.getShipName() );		
			psmt.setString( 2, order.getZipCode() );		
			psmt.setString( 3, order.getCountry() );	
			psmt.setString( 4, order.getAddress() );	
			psmt.setString( 5, order.getDate() );	
			psmt.setString( 6, order.getOrderPw() );	
			psmt.setString( 7, order.getUserId() );	
			psmt.setInt( 8, order.getTotalPrice() );	 
			psmt.setString( 9, order.getPhone() );	
			
			result = psmt.executeUpdate();		// SQL 실행 요청, 적용된 데이터 개수를 받아온다.
												// 게시글 1개 적용 성공 시, result : 1
												// 				실패 시, result : 0
			// executeUpdate()
			// : SQL (INSERT, UPDATE, DELETE)을 실행하고 적용된 데이터 개수를 int 타입으로 반환
		} catch (SQLException e) {
			System.err.println("주문 등록 시, 예외 발생");
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 최근 등록한 orderNo 
	 * @return
	 */
	public int lastOrderNo() {
		
		Order order = new Order();
		
		String sql = " SELECT order_no FROM 'order' ORDER BY 'order_no' DESC LIMIT 1 ";
		
		try {
			// 쿼리(SQL) 실행 객체 생성 - PreparedStatement (psmt)
			psmt = con.prepareStatement(sql);
			
			// 쿼리(SQL) 실행 -> 결과  - ResultSet (rs)
			rs = psmt.executeQuery();
			
			// 조회 결과를 1건 가져오기
			if( rs.next() ) {		// next() : 실행 결과의 다음 데이터로 이동
				// 결과 데이터 가져오기
				// rs.getXXX("컬럼명") --> 해당 컬럼의 데이터를 가져온다
				// * "컬럼명"의 값을 특정 타입으로 변환
				order.setOrderNo( rs.getInt("order_no") );
			}
		} catch(SQLException e) {
			System.err.println("게시글 조회 시, 예외 발생");
			e.printStackTrace();
		}
		// 마지막 주문 정보 1건 의 주문 번호 반환
		return order.getOrderNo();
	}

	
	/**
	 * 주문 내역 조회 - 회원
	 * @param userId
	 * @return
	 */
	public List<Product> list(String userId) {
		List<Product> result = new ArrayList<Product>();
		
		return result;
	}
	
	/**
	 * 주문 내역 조회 - 비회원
	 * @param phone
	 * @param orderPw
	 * @return
	 */
	public Order orderSelectNm (String phone, String orderPw) {
		
		Order nonMember = new Order();
		nonMember.setPhone(phone);
		nonMember.setOrderPw(orderPw);
		
		// SQL 작성
		String sql = " SELECT * "
				   + " FROM order "
				   + " WHERE phone = ? and order_pw = ? ";
		try {
			// 쿼리(SQL) 실행 객체 생성 - PreparedStatement (psmt)
			psmt = con.prepareStatement(sql);
			
			// psmt.setXXX( 순서번호, 매핑할 값 );
			psmt.setString( 1, nonMember.getPhone() );		
			psmt.setString( 2, nonMember.getOrderPw() );		
			
			// 쿼리(SQL) 실행 -> 결과  - ResultSet (rs)
			rs = psmt.executeQuery();
			
			// 조회 결과를 1건 가져오기
			if( rs.next() ) {		// next() : 실행 결과의 다음 데이터로 이동
				// 결과 데이터 가져오기
				// rs.getXXX("컬럼명") --> 해당 컬럼의 데이터를 가져온다
				// * "컬럼명"의 값을 특정 타입으로 변환
				nonMember.setOrderNo(rs.getInt("order_no") );
				nonMember.setShipName(rs.getString("ship_name") );
				nonMember.setZipCode(rs.getString("zip_code") );
				nonMember.setCountry(rs.getString("country") );
				nonMember.setAddress(rs.getString("address"));
				nonMember.setDate(rs.getString("date") );
				nonMember.setOrderPw(rs.getString("order_pw") );
				nonMember.setUserId(rs.getString("user_id") );
				nonMember.setTotalPrice(rs.getInt("total_price") );
				nonMember.setPhone(rs.getString("phone") );
				
				return nonMember;
			}
			return null;
		} catch(SQLException e) {
			System.err.println("비회원주문 내역 조회시, 예외 발생");
			e.printStackTrace();
		}
		return null;
	}
	
}






























