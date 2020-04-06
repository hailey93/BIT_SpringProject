<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
</head>
<body>
<form action="viewUser.do" method="post">
	아이디:${user.id}<br>
	이름: ${user.name}<br>
	비밀번호: ${user.pw}<br>
	생년월일: <fmt:formatDate value="${user.birth}" pattern="yyyy-MM-dd"/><br>
	성별: ${user.gender}<br>
	휴대폰번호: ${user.phone}<br>
	
	
	<input type ="button" value="수정" onclick="location.href='updateUser.do'">
</form>
</body>
</html>