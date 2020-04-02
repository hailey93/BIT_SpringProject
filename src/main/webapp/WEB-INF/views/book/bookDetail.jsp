<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="0">
	<c:forEach var="bookdt" items="${bookdt}">
	<tr>
	<th><h1>${bookdt.bookTitle}</h1></th>
	<th>                 </th>
	</tr>

	<tr>
	<td><h3>자료유형</h3></td>
	<td><h5>${bookdt.type}</h5></td>
	</tr>
	<tr>
	<td><h3>서명/저자사항</h3></td>
	<td><h5>${bookdt.bookTitle}/ ${bookdt.author}</h5></td>
	</tr>
	<tr>
	<td><h3>발행사항</h3></td>
	<td><h5>${bookdt.publisher}/ ${bookdt.pubYear}</h5></td>
	</tr>
	</c:forEach>
</table>

	<table border="1">


		<tr>
			<th></th>
			<th>도서번호</th>
			<th>도서상태</th>
			<th>예약여부</th>
		</tr>

		<c:forEach var="bookdtList" items="${bookdtList }">
			<c:set var="reservest" value="${bookdtList.reserveStatus}"/>
			<c:set var="bookst" value="${bookdtList.rentStatus}" />
			<c:choose>
				<c:when test="${bookst == 2}">
					<c:set var="bookstat" value="대여가능" />
					<c:set var="reservestat" value="예약불가" />
				</c:when>

				<c:otherwise>
					<c:set var="bookstat" value="대여중" />
						
						<c:choose>
					
						<c:when test="${reservest == 0}">
							<c:set var="reservestat" value="예약가능"/>
						</c:when>
						
						<c:otherwise>
							<c:set var="reservestat" value="예약불가"/>
						</c:otherwise>
						
						</c:choose>
					
				</c:otherwise>
			</c:choose>

			<tr>
				<td><input type="checkbox"></td>
				<td>${bookdtList.bookNo}</td>
				<td><c:out value="${bookstat}" /></td>
				<td><c:out value="${reservestat}" /></td>
			</tr>
		</c:forEach>
		<input type="button" value="대여" Onclick="대여controller">
		<input type="button" value="위시리스트" Onclick="위시리스트controller">
		<input type="button" value="예약" Onclick="예약controller">
	</table>
</body>
</html>