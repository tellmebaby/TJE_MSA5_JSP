package shop.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import shop.dto.Order;
import shop.dto.Product;
import shop.dto.Ship;

public class OrderRepository extends JDBConnection {
	
	/**
	 * 주문등록
	 * @param order
	 * @return
	 */
	public int insert(Order order) {
		int result = 0;
				
		String sql = " INSERT INTO joeun.order ( ship_name, zip_code, country, address, date";
			if (order.getOrderPw() != null && !order.getOrderPw().isEmpty() ) {  
				sql += " ,order_pw "
					+ " , total_price , phone) "
					+ " VALUES (?,?,?,?,?,?,?,?) ";	
			}else {
				sql += ",user_id "	
					+ " , total_price , phone) "
					+ " VALUES (?,?,?,?,?,?,?) ";	
			}
					
		
		try {
			psmt = con.prepareStatement(sql);	
			int count = 1;
			psmt.setString( count++, order.getShipName() );		
			psmt.setString( count++, order.getZipCode() );		
			psmt.setString( count++, order.getCountry() );	
			psmt.setString( count++, order.getAddress() );	
			psmt.setString( count++, order.getDate() );	
			if (order.getOrderPw() != null && !order.getOrderPw().isEmpty() ) {
				psmt.setString( count++, order.getOrderPw() );
			}else {
				psmt.setString( count++, order.getUserId() );
			}
			psmt.setInt( count++, order.getTotalPrice() );	
			psmt.setString( count, order.getPhone() );	
			
			result = psmt.executeUpdate();		// SQL 실행 요청, 적용된 데이터 개수를 받아온다.
												// 성공 시, result : 1
												// 실패 시, result : 0
			// executeUpdate()
			// : SQL (INSERT, UPDATE, DELETE)을 실행하고 적용된 데이터 개수를 int 타입으로 반환
		} catch (SQLException e) {
			System.err.println("주문 등록 시, 예외 발생");
			e.printStackTrace();
		}
		return result;
	}

	
	public int insertPro (Ship ship) {
		int result = 0;
				
		String sql = " INSERT INTO joeun.order ( ship_name "
					+ " , date "
					+ " , country "
					+ " , zip_code "
					+ " , address "
					+ " , phone "
					+ " , quantity ) "
					+ "  VALUES ( ?, ?, ?, ?, ?, ?, ?, ?) ";	
			
					
		
		try {
			psmt = con.prepareStatement(sql);	
			
			psmt.setString( 1, ship.getShipName() );		
			psmt.setString( 2, ship.getDate() );		
			psmt.setString( 3, ship.getCountry() );	
			psmt.setString( 4, ship.getZipCode() );	
			psmt.setString( 5, ship.getAddress() );	
			psmt.setString( 6, ship.getPhone() );	
			psmt.setInt( 7, ship.getQuantity() );	
			
			result = psmt.executeUpdate();		// SQL 실행 요청, 적용된 데이터 개수를 받아온다.
												// 성공 시, result : 1
												// 실패 시, result : 0
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
	public Order lastOrderNo() {
		
		Order order = new Order();
		
		String sql = " SELECT * "
				+ " FROM joeun.order"
				+ " ORDER BY `order_no` DESC "
				+ " LIMIT 1; ";
		
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
				order.setAddress( rs.getString("address"));
			}
		} catch(SQLException e) {
			System.err.println("게시글 조회 시, 예외 발생");
			e.printStackTrace();
		}
		// 마지막 주문 정보 1건 의 주문 번호 반환
		return order;
	}

	
	/**
	 * 주문 내역 조회 - 회원
	 * @param userId
	 * @return
	 */
	public List<Order> list(String userId) {
		List<Order> orderList = new ArrayList<Order>();
		
		
		String sql = " SELECT * "
					+ " FROM joeun.order AS o "
					+ " JOIN product_io AS pio ON o.order_no = pio.order_no "
					+ " JOIN product AS p ON pio.product_id = p.product_id "
					+ " WHERE user_id = ? " ;
		try {
			// 쿼리(SQL) 실행 객체 생성 - PreparedStatement (psmt)
			psmt = con.prepareStatement(sql);
			
			// psmt.setXXX( 순서번호, 매핑할 값 );
			psmt.setString( 1, userId );		
					
			
			// 쿼리(SQL) 실행 -> 결과  - ResultSet (rs)
			rs = psmt.executeQuery();
			
			// 조회 결과를 1건 가져오기
			if( rs.next() ) {		// next() : 실행 결과의 다음 데이터로 이동
				// 결과 데이터 가져오기
				// rs.getXXX("컬럼명") --> 해당 컬럼의 데이터를 가져온다
				// * "컬럼명"의 값을 특정 타입으로 변환
				Order order = new Order();
				// 주문 정보 매핑
				order.setOrderNo(rs.getInt("order_no") );
				order.setShipName(rs.getString("ship_name") );
				order.setZipCode(rs.getString("zip_code") );
				order.setCountry(rs.getString("country") );
				order.setAddress(rs.getString("address"));
				order.setDate(rs.getString("date") );
				order.setOrderPw(rs.getString("order_pw") );
				order.setUserId(rs.getString("user_id") );
				order.setTotalPrice(rs.getInt("total_price") );
				order.setPhone(rs.getString("phone") );	
				
				 // 상품 정보 매핑
	            Product product = new Product();
	            product.setProductId(rs.getString("product_id"));
	            product.setName(rs.getString("name"));
	            product.setUnitPrice(rs.getInt("unit_price"));
	            product.setDescription(rs.getString("description"));
	            product.setManufacturer(rs.getString("manufacturer"));
	            product.setCategory(rs.getString("category"));
	            product.setUnitsInStock(rs.getInt("units_in_stock"));
	            product.setCondition(rs.getString("condition"));
	            product.setFile(rs.getString("file"));
	            product.setQuantity(rs.getInt("quantity"));
				
	            // 주문 정보에 상품 추가
	            order.setProduct(product);
	            
	            // 주문 목록에 추가
				orderList.add(order);
			}
		} catch(SQLException e) {
			System.err.println("비회원주문 내역 조회시, 예외 발생");
			e.printStackTrace();
		}
		return orderList;
	}
	
	/**
	 * 주문 내역 조회 - 비회원
	 * @param phone
	 * @param orderPw
	 * @return
	 */
	public List<Order> orderSelectNm (String phone, String orderPw) {
		
		List<Order> orderList = new ArrayList<Order>();
		
		
		// SQL 작성
		String sql = " SELECT * "
				   + " FROM joeun.order AS o"
				   + " JOIN product_io AS pio ON o.order_no = pio.order_no "
				   + " JOIN product AS p ON pio.product_id = p.product_id "
				   + " WHERE phone = ? and order_pw = ? ";
		try {
			// 쿼리(SQL) 실행 객체 생성 - PreparedStatement (psmt)
			psmt = con.prepareStatement(sql);
			
			// psmt.setXXX( 순서번호, 매핑할 값 );
			psmt.setString( 1, phone );		
			psmt.setString( 2, orderPw );		
			
			// 쿼리(SQL) 실행 -> 결과  - ResultSet (rs)
			rs = psmt.executeQuery();
			
			// 조회 결과를 1건 가져오기
			if( rs.next() ) {		// next() : 실행 결과의 다음 데이터로 이동
				// 결과 데이터 가져오기
				// rs.getXXX("컬럼명") --> 해당 컬럼의 데이터를 가져온다
				// * "컬럼명"의 값을 특정 타입으로 변환
				Order order = new Order();
				order.setOrderNo(rs.getInt("order_no") );
				order.setShipName(rs.getString("ship_name") );
				order.setZipCode(rs.getString("zip_code") );
				order.setCountry(rs.getString("country") );
				order.setAddress(rs.getString("address"));
				order.setDate(rs.getString("date") );
				order.setOrderPw(rs.getString("order_pw") );
				order.setUserId(rs.getString("user_id") );
				order.setTotalPrice(rs.getInt("total_price") );
				order.setPhone(rs.getString("phone") );
				
				 // 상품 정보 매핑
	            Product product = new Product();
	            product.setProductId(rs.getString("product_id"));
	            product.setName(rs.getString("name"));
	            product.setUnitPrice(rs.getInt("unit_price"));
	            product.setDescription(rs.getString("description"));
	            product.setManufacturer(rs.getString("manufacturer"));
	            product.setCategory(rs.getString("category"));
	            product.setUnitsInStock(rs.getInt("units_in_stock"));
	            product.setCondition(rs.getString("condition"));
	            product.setFile(rs.getString("file"));
	            product.setQuantity(rs.getInt("quantity"));
				
	            // 주문 정보에 상품 추가
	            order.setProduct(product);
	            
				orderList.add(order);
			}
			
		} catch(SQLException e) {
			System.err.println("비회원주문 내역 조회시, 예외 발생");
			e.printStackTrace();
		}
		return orderList;
	}
	
	public List<Ship> orderDeaileList (String phone) {
		
		List<Ship> orderDList = new ArrayList<Ship>();
		Ship orderDeail = new Ship();
		
		// SQL 작성
		String sql = " SELECT * "
				+ " FROM joeun.ship "
				+ " WHERE phone = ? ";
		try {
			// 쿼리(SQL) 실행 객체 생성 - PreparedStatement (psmt)
			psmt = con.prepareStatement(sql);
			
			// psmt.setXXX( 순서번호, 매핑할 값 );
			psmt.setString( 1, phone );		
			
			// 쿼리(SQL) 실행 -> 결과  - ResultSet (rs)
			rs = psmt.executeQuery();
			
			// 조회 결과를 1건 가져오기
			if( rs.next() ) {		// next() : 실행 결과의 다음 데이터로 이동
				// 결과 데이터 가져오기
				// rs.getXXX("컬럼명") --> 해당 컬럼의 데이터를 가져온다
				// * "컬럼명"의 값을 특정 타입으로 변환
				orderDeail.setOrderNo(rs.getInt("order_no") );
				orderDeail.setShipName(rs.getString("ship_Name") );
				orderDeail.setDate(rs.getString("date") );
				orderDeail.setCountry(rs.getString("country"));
				orderDeail.setZipCode(rs.getString("zip_code") );
				orderDeail.setAddress(rs.getString("address") );
				orderDeail.setPhone(rs.getString("phone") );
				orderDeail.setQuantity(rs.getInt("quantity") );
				orderDList.add(orderDeail);
			}
			
		} catch(SQLException e) {
			System.err.println("비회원주문 상세내역 조회시, 예외 발생");
			e.printStackTrace();
		}
		return orderDList;
	}
	
}






























