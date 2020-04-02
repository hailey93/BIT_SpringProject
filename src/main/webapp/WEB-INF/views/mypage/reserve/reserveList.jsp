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
	<table border="1">
		<tr>
			<th>	</th>
			<th>도서번호</th>
			<th>도서명</th>
			<th>예약신청일</th>
			<th>반납예정일</th>
			<th>예약만기일</th>
			<th>도서상태</th>
			</tr>
			
			<c:forEach var="rentst" items="${rentst }">
			
			<c:set var="rents" value="${rentst.rentStatus}"/>
			<c:choose>
				<c:when test = "${rents == 2 }">
					<c:set var="rentstat" value="대여가능"/>
				</c:when>
				
				<c:otherwise>
					<c:set var="rentstat" value="대여중"/>
				</c:otherwise>
			</c:choose>
			
			<tr>
				<td><input type="checkbox"></td>
				<td>${rentst.bookNo}</td>
				<td>${rentst.bookTitle}</td>
				<td>${rentst.reserveDate}</td>
				<td>${rentst.returnDueDate}</td>
				<td>${rentst.reserveFinDate }</td>
				<td><c:out value="${rentstat}"/></td>
				<%-- <td>${rentst.rentStatus}</td> --%>
			</tr>
			
			
				<!-- <script>
						var rentstat = ${rentst.rentStatus};
							
						if (rentstat == 1){
							document.write("대여중");
						}else{
							document.write("대여가능");
						}
						
						console.log('A : '+rentstat);
				</script> -->
</c:forEach>


</table>


<%-- <c:forEach var="rentst" items="${rentst }">
도서번호 : ${rentst.bookNo}<br>
도서명 : ${rentst.bookTitle}<br>
예약신청일 : ${rentst.reserveDate}<br>
반납예정일 : ${rentst.returnDueDate}<br>
예약만기일 : ${rentst.reserveFinDate}<br>
도서상태 : ${rentst.rentStatus}<br>
</c:forEach> --%>
<%-- <a href="./reserveList.do?bookTitle=${rentst.bookTitle}"></a> --%>
</body>
</html>