<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
<form action="loginProc" method="post">
		아이디:<input type="text" name="id"><br>
		비밀번호:<input type="password" name="pw"><br>
		
			<input type="submit" value = "로그인">
			
	</form> <a href="join.do"><input type="submit" value="회원가입"></a>
</body>
</html>