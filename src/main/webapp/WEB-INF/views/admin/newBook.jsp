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
<title>도서등록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypagemenu.css">
</head>
<body>
<div class="headerBtm">
		<div>
		
			<h2 class="logo">
				<a title="비트 도서관">
				<img src="webimg/bitlogo.png" />
				</a>
			</h2>

		</div>
	</div>
<div id="divContentsW">
	<div id="row">
	<h1 align="center">도서등록페이지입니다.</h1>
	</div>
	
	<div id="divContents">
		<form action="addBook.do" method="post" enctype="multipart/form-data">
		책이름: <input type="text" name="bookTitle"><br>
		작가: <input type="text" name="author"><br>
		장르: <input type="text" name="type"><br>
		출판사: <input type="text" name="publisher"><br>
		출판년도: <input type="text" name="pubYear"><br>
		이미지 첨부: <input type="file" name="file" ><br>
		책 수량: <input type="number" name="bookQty"><br>
		<input type="submit" value="등록하기">
		</form>
		
	</div>
</div>


</body>
</html>