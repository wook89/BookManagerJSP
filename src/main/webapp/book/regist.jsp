<%@ page language="java" contentType="text/html; charset=UTF-8"
import ="book.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String name = request.getParameter("name");
	String author = request.getParameter("author");
	String price = request.getParameter("price");
	
	if(name ==null || author ==null || price ==null){
		
		response.sendRedirect("registPage.jsp");	
		
	}else if(name == ""||author==""||price==""){
		
		response.sendRedirect("registPage.jsp");
	}else{
		BookService service = new BookService(new BookDAO());
		Book book = new Book(name,author,Integer.parseInt(price));
		
		if(service.regist(book)){
			response.sendRedirect("main.jsp");
		}else{
			response.sendRedirect("registPage.jsp");
		}
	}
%>  
