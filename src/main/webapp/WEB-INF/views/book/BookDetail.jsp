<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="rentst" items="${rentst }">
<%-- 도서번호 : ${rentst.bookNo}<br>
도서명 : ${rentst.bookTitle}<br>
예약신청일 : ${rentst.reserveDate}<br>
반납일 : ${rentst.returnDate}<br>
예약만기일 : ${restst[0].reserveFinDate}<br>
도서상태 : ${rentst.rentStatus}<br> --%>
</c:forEach>
<%-- <a href="./reserveList.do?bookTitle=${rentst.bookTitle}"></a> --%>
</body>
</html>