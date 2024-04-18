<%@page import="shop.dao.ProductRepository"%>
<%@page import="shop.dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

	//필요한 정보 
	String file = request.getParameter("file");
	String productId = request.getParameter("productId");
	String name = request.getParameter("name");
	String unitPrice = request.getParameter("unitPrice");
	String description = request.getParameter("description");
	String manufacturer = request.getParameter("manufacturer");
	String category = request.getParameter("category");
	String unitsInStock = request.getParameter("unitsInStock");
	String condition = request.getParameter("condition");

	Product product = new Product();
	ProductRepository productDAO = new ProductRepository();
	product.setProductId(productId);
	product.setName(name);
	product.setUnitPrice(Integer.parseInt(unitPrice));
	product.setDescription(description);
	product.setManufacturer(manufacturer);
	product.setCategory(category);
	product.setUnitsInStock(Integer.parseInt(unitsInStock));
	product.setCondition(condition);
	
	
	int result = productDAO.insert(product);
	
	
	String root = request.getContextPath();
	if( result > 0 ) {
		//등록성공
		response.sendRedirect(root + "/shop/products.jsp");
	} else {
		//등록실패
		response.sendRedirect(root + "/shop/add.jsp?msg=0");
	}

%>