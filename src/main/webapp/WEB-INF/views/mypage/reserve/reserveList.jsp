<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>


<body>
	<table border="1">
		<tr>
			<th></th>
			<th>도서번호</th>
			<th>도서명</th>
			<th>예약신청일</th>
			<th>반납예정일</th>
			<th>예약만기일</th>
			<th>도서상태</th>
		</tr>

		<c:forEach var="rentst" items="${rentst }">

			<c:set var="rents" value="${rentst.rentStatus}" />
			<c:choose>
				<c:when test="${rents == 2 }">
					<c:set var="rentstat" value="대여가능" />
				</c:when>

				<c:otherwise>
					<c:set var="rentstat" value="대여중" />
				</c:otherwise>
			</c:choose>

			<tr>
				<td><input type="checkbox"></td>
				<td>${rentst.bookNo}</td>
				<td>${rentst.bookTitle}</td>
				<td>${rentst.reserveDate}</td>
				<td>${rentst.returnDueDate}</td>
				<td>${rentst.reserveFinDate }</td>
				<td><c:out value="${rentstat}" /></td>
				<%-- <td>${rentst.rentStatus}</td> --%>
			</tr>
		</c:forEach>
		<input type="button" value="대여" Onclick="대여controller">
		<input type="button" value="예약취소" Onclick="취소cotroller">
	</table>
</body>
</html>