<%@ page language="java" contentType="text/html; charset=UTF-8"
import="book.*"
    pageEncoding="UTF-8"%>
<%
	String idStr = request.getParameter("id");
	if(idStr == null) {
		response.sendRedirect("main.jsp");
	}else{
		BookService service = new BookService(new BookDAO());
		Book book = service.read(Integer.parseInt(idStr));
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세 페이지</title>
</head>
<body>
	<h3>회원 상세 정보</h3>
		<% 	if(book == null){ %>
			<p>해당 회원 정보가 없습니다.</p>
	<% 	}else{ %>
			<ul>
				<li>도서ID : <%= book.getId() %> </li>
				<li>제목 : <%= book.getName() %> </li>
				<li>저자 : <%= book.getAuthor() %></li>
				<li>가격 : <%= book.getPrice() %> </li>
			</ul>
			<br>
			<a href="modifyPage.jsp?id=<%=book.getId()%>"><button>도서정보수정</button></a>
			<a href="removePage.jsp?id=<%=book.getId()%>"><button>도서 삭제</button></a>
	<% } %>	
</body>
</html>
<% } %>