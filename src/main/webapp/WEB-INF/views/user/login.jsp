<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="비트 도서관">
<meta name="keyword" content="비트 도서관">
<meta name="copyright"
	content="COPYRIGHT(C) BIT LIBRARY. ALL RIGHTS RESERVED.">
<meta content="initial-scale=1, width=device-width" name="viewport">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>login</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypagemenu.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypagetable.css">
</head>
<body>
<div class="headerBtm">
		<div>
<h2 class="logo">
				<a href="login.do" title="비트 도서관">
				<img src="webimg/bitlogo.png"/>
				
				
				</a>
			</h2>
			<div align="right">
			<ul> 
				<li>
					
						
						
							<a title="로그인" href="login.do">로그인</a>
						
					
				</li>
				<li><a title="회원가입" href="join.do">회원가입</a></li>
			</ul>
			</div>
			<br><br><br><br><br><br>
<div class="intro" align="center">
					<img alt="MEMBER LOGIN" src="webimg/login.png" align="middle">	
					<p><font size="4em" color="blue"> 비트도서관</font><font size="3em">에 오신것을 환영합니다.</font><p>
					<p><font size="3em">로그인을 하시면 더 많은 도서관 서비스를 이용하실 수 있습니다.</font><p>
					
					
					
				
<form action="loginProc" method="post">
		<label for="id">아이디</label> <input type="text" name="id" size="20" maxlength="15"><br><br>
		<label for="id">비밀번호</label><input type="password" name="pw" size="20" maxlength="15"><br><br>
		
		<p class="loginBtn">
			<input type="submit" value = "로그인">
			</p><br>
	</form> <ul><li>아직 회원이 아니세요? <a href="join.do">회원가입</a></li></ul>
	</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/bot.jsp" flush="false" />
</body>
</html>