<%@ page language="java" contentType="text/html; charset=UTF-8"
import="book.*"
    pageEncoding="UTF-8"%>
<%
	String idStr = request.getParameter("id");
	if(idStr == null){
		response.sendRedirect("main.jsp");
	}else{
	BookService service = new BookService(new BookDAO());
	Book book = service.read(Integer.parseInt(idStr));
		if(book == null){
			response.sendRedirect("main.jsp");
		}else{
				
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 삭제 페이지</title>
</head>
<body>
	<h3>도서 삭제</h3>
		<ul>
				<li>도서ID : <%= book.getId() %> </li>
				<li>제목 : <%= book.getName() %> </li>
				<li>저자 : <%= book.getAuthor() %> </li>
				<li>가격 : <%= book.getPrice() %> </li>
			</ul>
			<br>
			<a href="remove.jsp?id=<%=book.getId()%>"><button>삭제</button></a>
			<a href="detailPage.jsp?id=<%=book.getId()%>"><button>취소</button></a>
</body>
</html>

<% 		}
	}
		%>