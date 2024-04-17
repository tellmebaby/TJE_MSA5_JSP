package shop.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import shop.dto.Product;

public class ProductIORepository extends JDBConnection {

	/**
	 * 상품 입출고 등록
	 * @param product
	 * @param type
	 * @return
	 */
	public int insert(Product product) {
		
		int result = 0;
		String sql = " INSERT INTO product_io ( product_id, order_no, amount, type, user_id ) "
				   + " VALUES( ?, ?, ?, ?, ? ) ";
		
		try {
			psmt = con.prepareStatement(sql);			
			psmt.setString( 1, product.getProductId() );		
			psmt.setInt( 2, product.getOrderNo() );		
			psmt.setInt( 3, product.getAmount() );	
			psmt.setString( 4, product.getType() );	
			psmt.setString( 5, product.getUserId() );	
			
			result = psmt.executeUpdate();		// SQL 실행 요청, 적용된 데이터 개수를 받아온다.
												// 게시글 1개 적용 성공 시, result : 1
												// 				실패 시, result : 0
			// executeUpdate()
			// : SQL (INSERT, UPDATE, DELETE)을 실행하고 적용된 데이터 개수를 int 타입으로 반환
		} catch (SQLException e) {
			System.err.println("입출고 등록 시, 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	

}