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
<title>관리자페이지</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/mypagemenu.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/mypagetable.css">

</head>
<body>
	<div class="headerBtm">
		<div>
			<h2 class="logo">
				<a href="admLogin.do" title="비트 도서관"> <img src="webimg/bitlogo.png" />


				</a>
			</h2>

			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<div class="intro" align="center">
				<img alt="MEMBER LOGIN" src="webimg/login.png" align="middle">
				<p>
					<font size="4em" color="blue"> 비트도서관</font><font size="3em">에
						오신것을 환영합니다.</font>
				<p>
				<p>
					<font size="3em">관리자페이지입니다.</font>
				<p>
				<form action="admLoginProc.do" method="post">
					<table>
						<tbody>
							<tr>
								<td>아이디</td>
								<td><input type="text" name="id" size="20" maxlength="15"></td>
							</tr>

							<tr>
								<td>비밀번호</td>
								<td><input type="password" name="pw" size="20"
									maxlength="15"></td>

							</tr>
						</tbody>
					</table>

					<p>
						<input type="submit" value="로그인"
							style="position: absolute; left: 710px; top: 253px; WIDTH: 60pt; HEIGHT: 38pt; background-color: #005490; color: #fff; cofont-weight: bold; cursor: pointer">
					</p>

					<br>
				</form>
				
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/bot.jsp" flush="false" />
</body>
</html>