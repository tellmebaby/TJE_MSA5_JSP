package shop.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import shop.dto.Product;

public class ProductRepository extends JDBConnection {
	
	/**
	 * 상품 목록
	 * @return
	 */
	public List<Product> list() {
		List<Product> productList = new ArrayList<Product>();
		
		// SQL 작성
				String sql = " SELECT * "
						   + " FROM product ";
				try {
					// 쿼리(SQL) 실행 객체 생성 - Statement (stmt)
					stmt = con.createStatement();
					
					// 쿼리(SQL) 실행 -> 결과  - ResultSet (rs)
					rs = stmt.executeQuery(sql);
					
					// 조회 결과를 리스트에 추가
					while( rs.next() ) {		// next() : 실행 결과의 다음 데이터로 이동
						Product product = new Product();
						
						// 결과 데이터 가져오기
						// rs.getXXX("컬럼명") --> 해당 컬럼의 데이터를 가져온다
						// * "컬럼명"의 값을 특정 타입으로 변환
						product.setProductId( rs.getString("product_id") );
						product.setName( rs.getString("name") );
						product.setUnitPrice( rs.getInt("unit_price") );
						product.setDescription( rs.getString("description") );
						product.setManufacturer( rs.getString("manufacturer") );
						product.setCategory( rs.getString("category") );
						product.setUnitsInStock( rs.getInt("units_in_stock") );
						product.setCondition( rs.getString("condition") );
						product.setFile( rs.getString("file") );
						product.setQuantity( rs.getInt("quantity") );
						
						// 상품목록에 추가
						productList.add(product);
					}
				} catch(SQLException e) {
					System.err.println("게시글 목록 조회 시, 예외 발생");
					e.printStackTrace();
				}
				// 상품목록 반환
				return productList;
	}
	
	
	/**
	 * 상품 목록 검색
	 * @param keyword
	 * @return
	 */
	public List<Product> list(String keyword) {
		List<Product> productList = new ArrayList<Product>();
		
		Product product = new Product();
		
				// SQL 작성
				String sql = " SELECT * "
						   + " FROM product "
						   + " WHERE name = ? ";
				try {
					// 쿼리(SQL) 실행 객체 생성 - PreparedStatement (psmt)
					psmt = con.prepareStatement(sql);
					
					// psmt.setXXX( 순서번호, 매핑할 값 );
					psmt.setString( 1, keyword );		// ?(1) <-- no (글번호)
					
					// 쿼리(SQL) 실행 -> 결과  - ResultSet (rs)
					rs = psmt.executeQuery();
					
					// 조회 결과를 1건 가져오기
					if( rs.next() ) {		// next() : 실행 결과의 다음 데이터로 이동
						// 결과 데이터 가져오기
						// rs.getXXX("컬럼명") --> 해당 컬럼의 데이터를 가져온다
						// * "컬럼명"의 값을 특정 타입으로 변환
						product.setProductId( rs.getString("product_id") );
						product.setName( rs.getString("name") );
						product.setUnitPrice( rs.getInt("unit_price") );
						product.setDescription( rs.getString("description") );
						product.setManufacturer( rs.getString("manufacturer") );
						product.setCategory( rs.getString("category") );
						product.setUnitsInStock( rs.getLong("units_in_stock") );
						product.setCondition( rs.getString("condition") );
						product.setFile( rs.getString("file") );
						product.setQuantity( rs.getInt("quantity") );
						
						// 상품목록에 추가
						productList.add(product);
					}
				} catch(SQLException e) {
					System.err.println("게시글 조회 시, 예외 발생");
					e.printStackTrace();
				}
				// 게시글 정보 1건 반환
				return productList;
	}
	
	/**
	 * 상품 조회
	 * @param productId
	 * @return
	 */
	public Product getProductById(String productId) {
		Product product = new Product();
		
		// SQL 작성
				String sql = " SELECT * "
						   + " FROM product "
						   + " WHERE product_id = ? ";
				try {
					// 쿼리(SQL) 실행 객체 생성 - PreparedStatement (psmt)
					psmt = con.prepareStatement(sql);
					
					// psmt.setXXX( 순서번호, 매핑할 값 );
					psmt.setString( 1, productId );		// ?(1) <-- no (글번호)
					
					// 쿼리(SQL) 실행 -> 결과  - ResultSet (rs)
					rs = psmt.executeQuery();
					
					// 조회 결과를 1건 가져오기
					if( rs.next() ) {		// next() : 실행 결과의 다음 데이터로 이동
						// 결과 데이터 가져오기
						// rs.getXXX("컬럼명") --> 해당 컬럼의 데이터를 가져온다
						// * "컬럼명"의 값을 특정 타입으로 변환
						product.setProductId( rs.getString("product_id") );
						product.setName( rs.getString("name") );
						product.setUnitPrice( rs.getInt("unit_price") );
						product.setDescription( rs.getString("description") );
						product.setManufacturer( rs.getString("manufacturer") );
						product.setCategory( rs.getString("category") );
						product.setUnitsInStock( rs.getLong("units_in_stock") );
						product.setCondition( rs.getString("condition") );
						product.setFile( rs.getString("file") );
						product.setQuantity( rs.getInt("quantity") );
						
					}
				} catch(SQLException e) {
					System.err.println("게시글 조회 시, 예외 발생");
					e.printStackTrace();
				}
				// 게시글 정보 1건 반환
				return product;
	}
	
	public Product getProductByName(String shipName) {
		Product product = new Product();
		
		// SQL 작성
				String sql = " SELECT * "
						   + " FROM product "
						   + " WHERE name = ? ";
				try {
					// 쿼리(SQL) 실행 객체 생성 - PreparedStatement (psmt)
					psmt = con.prepareStatement(sql);
					
					// psmt.setXXX( 순서번호, 매핑할 값 );
					psmt.setString( 1, shipName );		// ?(1) <-- no (글번호)
					
					// 쿼리(SQL) 실행 -> 결과  - ResultSet (rs)
					rs = psmt.executeQuery();
					
					// 조회 결과를 1건 가져오기
					if( rs.next() ) {		// next() : 실행 결과의 다음 데이터로 이동
						// 결과 데이터 가져오기
						// rs.getXXX("컬럼명") --> 해당 컬럼의 데이터를 가져온다
						// * "컬럼명"의 값을 특정 타입으로 변환
						product.setProductId( rs.getString("product_id") );
						product.setName( rs.getString("name") );
						product.setUnitPrice( rs.getInt("unit_price") );
						product.setDescription( rs.getString("description") );
						product.setManufacturer( rs.getString("manufacturer") );
						product.setCategory( rs.getString("category") );
						product.setUnitsInStock( rs.getLong("units_in_stock") );
						product.setCondition( rs.getString("condition") );
						product.setFile( rs.getString("file") );
						product.setQuantity( rs.getInt("quantity") );
						
					}
				} catch(SQLException e) {
					System.err.println("게시글 조회 시, 예외 발생");
					e.printStackTrace();
				}
				// 게시글 정보 1건 반환
				return product;
	}
	
	/**
	 * 상품 등록
	 * @param product
	 * @return
	 */
	public int insert(Product product) {
		int result = 0;
		
		String sql = " INSERT INTO product (product_id, name, unit_price, description, manufacturer, category, units_in_stock, `condition`, file) " 
				   + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?) ";
		
		try {
			psmt = con.prepareStatement(sql);			
			psmt.setString( 1, product.getProductId() );		
			psmt.setString( 2, product.getName() );		
			psmt.setInt( 3, product.getUnitPrice() );	
			psmt.setString( 4, product.getDescription() );	
			psmt.setString( 5, product.getManufacturer() );	
			psmt.setString( 6, product.getCategory() );	
			psmt.setLong( 7, product.getUnitsInStock() );	
			psmt.setString( 8, product.getCondition() );	
			psmt.setString( 9, product.getFile() );	
			
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
	 * 상품 수정
	 * @param product
	 * @return
	 */
	public int update(Product product) {
		
		int result = 0;
			
		 String sql = "UPDATE product SET name = ?, unit_price = ?, description = ?, manufacturer = ?, category = ?, units_in_stock = ?, `condition` = ?";
		 if (product.getFile() != null && !product.getFile().isEmpty()) {
		        sql += ", file = ? ";
		    }
		 	sql += "WHERE product_id = ?";
		 	System.out.println("sql문 어떠니 : " + sql);
		try {
			psmt = con.prepareStatement(sql);
	        int index = 1;
	        psmt.setString(index++, product.getName());
	        psmt.setInt(index++, product.getUnitPrice());
	        psmt.setString(index++, product.getDescription());
	        psmt.setString(index++, product.getManufacturer());
	        psmt.setString(index++, product.getCategory());
	        psmt.setLong(index++, product.getUnitsInStock());
	        psmt.setString(index++, product.getCondition());		
	        if (product.getFile() != null && !product.getFile().isEmpty()) {
	            psmt.setString(index++, product.getFile());
	        }
	        psmt.setString(index, product.getProductId());
	        
			result = psmt.executeUpdate();		// SQL 실행 요청, 적용된 데이터 개수를 받아온다.
												// result : 1
												// result : 0
			// executeUpdate()
			// : SQL (INSERT, UPDATE, DELETE)을 실행하고 적용된 데이터 개수를 int 타입으로 반환
		} catch (SQLException e) {
			System.err.println("상품 수정 시, 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	/**
	 * 상품 삭제
	 * @param product
	 * @return
	 */
	public int delete(String productId) {
		int result = 0;
		
		String sql = " DELETE FROM product "
				   + " WHERE product_id = ? ";
		
		try {
			psmt = con.prepareStatement(sql);	// 쿼리 실행 객체 생성
			psmt.setString( 1, productId );				// 1번 ? 에 게시글 번호를 매핑
			
			result = psmt.executeUpdate();		// SQL 실행 요청, 적용된 데이터 개수를 받아온다.
												// 게시글 1개 적용 성공 시, result : 1
												// 				실패 시, result : 0
			// executeUpdate()
			// : SQL (INSERT, UPDATE, DELETE)을 실행하고 적용된 데이터 개수를 int 타입으로 반환
		} catch (SQLException e) {
			System.err.println("게시글 삭제 시, 예외 발생");
			e.printStackTrace();
		}
		return result;
	}

}





























