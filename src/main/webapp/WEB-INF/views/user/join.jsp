<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
</head>
<body>
<h1>회원가입</h1>
	<form action="joinProcess" method="post" >
		<input type="text" name = "id" placeholder="ID"><br>
		<input type="text" name = "name" placeholder="이름"><br>
		<input type="password" name = "pw" placeholder="비밀번호 입력"><br>
		<input type="date" name = "birth" placeholder="생년월일"><br>
		<input type="text" name = "gender" placeholder="성별"><br>
		<input type="text" name = "phone" placeholder="휴대폰번호"><br>
		<button type="submit">가입하기</button>
	</form>
		<input type="button" value="로그인페이지로" onclick="location.href='login.do'">

</body>
</html>