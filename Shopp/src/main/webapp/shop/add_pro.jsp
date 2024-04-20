<%@page import="java.util.UUID"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="shop.dao.ProductRepository"%>
<%@page import="shop.dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	//클라이언트에서 서버로 요청한 파일을 다루는 클래스
	// MultipartRequest(request, 저장경로, 파일 최대크기, 인코딩타입, 파일명 정책 객체)
	String uploadPath = "C:/Users/Sung/git/TJE_MSA5_JSP/Shopp/src/main/webapp/static/img/";
	// 	out.println("upload 경로 : " + uploadPath);
	int maxSize = 10 * 1024 * 1024;			// 10MB
	DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();

	// 지정한 업로드 경로 및 최대 파일 사이즈를 파일 업로드
	MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "UTF-8", policy);

	// enctype="multipart/form-data" 으로 요청하는 경우
	// MultipartRequest 로 요청 파라미터 확인
	Enumeration<String> params = multi.getParameterNames();
	Product product = new Product();
	
	while (params.hasMoreElements()) {
	    String paramName = params.nextElement();
	    String paramValue = multi.getParameter(paramName);
	    
	    // 각 파라미터 이름에 따라서 Product 객체에 값을 설정
	    switch (paramName) {
	        case "productId":
	            product.setProductId(paramValue);
	            break;
	        case "name":
	            product.setName(paramValue);
	            break;
	        case "unitPrice":
	            int unitPrice = Integer.parseInt(paramValue);
	            product.setUnitPrice(unitPrice);
	            break;
	        case "description":
	            product.setDescription(paramValue);
	            break;
	        case "manufacturer":
	            product.setManufacturer(paramValue);
	            break;
	        case "category":
	            product.setCategory(paramValue);
	            break;
	        case "unitsInStock":
	            int unitsInStock = Integer.parseInt(paramValue);
	            product.setUnitsInStock(unitsInStock);
	            break;
	        case "condition":
	            product.setCondition(paramValue);
	            break;
	        // 필요에 따라 다른 파라미터들도 처리
	        default:
	            // 처리할 필요가 없는 경우
	            break;
	    }
	}
	
	Enumeration files = multi.getFileNames();
	String file = (String) files.nextElement();
	String fileName = multi.getFilesystemName(file);
	
	product.setFile("/static/img/"+fileName);
	
	ProductRepository productDAO = new ProductRepository();
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