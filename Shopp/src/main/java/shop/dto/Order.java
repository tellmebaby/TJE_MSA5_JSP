package shop.dto;

import java.util.List;

/**
 * 주문 데이터
 */
public class Order {

	private int orderNo;
	private String cartId;
	private String shipName;
	private String zipCode;
	private String country;
	private String address;
	private String date;
	private String userId;
	private int totalPrice;
	private String phone;
	private String orderPw;
	private Product product;
	private List<Product> productList;
	
	
	public Order() {
		
	}

	
	
	public List<Product> getProductList() {
		return productList;
	}



	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}



	public Product getProduct() {
		return product;
	}



	public void setProduct(Product product) {
		this.product = product;
	}



	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public String getCartId() {
		return cartId;
	}

	public void setCartId(String cartId) {
		this.cartId = cartId;
	}

	public String getShipName() {
		return shipName;
	}

	public void setShipName(String shipName) {
		this.shipName = shipName;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getOrderPw() {
		return orderPw;
	}

	public void setOrderPw(String orderPw) {
		this.orderPw = orderPw;
	}



	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", cartId=" + cartId + ", shipName=" + shipName + ", zipCode=" + zipCode
				+ ", country=" + country + ", address=" + address + ", date=" + date + ", userId=" + userId
				+ ", totalPrice=" + totalPrice + ", phone=" + phone + ", orderPw=" + orderPw + ", product=" + product
				+ ", productList=" + productList + "]";
	}



	

	
	
	
}
