<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
</head>
<body>
	<form action="joinProc" method="post">
	아이디: <input type="text" name="id"> <br> 
	이름: <input type="text" name="name"> <br> 
	비밀번호: <input type="password" name="pw"> <br>
	
	생년월일: <input type="date" name="birth"> <br> 
	
	성별: <input type="checkbox" name="gender" value="남">남
		 <input type="checkbox" name="gender" value="여">여 <br> 
	휴대폰번호: <input type="text" name="phone"> <br>

	<button type="submit">가입하기</button>
	</form>

</body>
</html>