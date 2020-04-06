<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서등록</title>
</head>
<body>
도서등록페이지입니다.
<form action="addBook.do" method="post">
책이름: <input type="text" name="bookTitle"><br>
작가: <input type="text" name="author"><br>
장르: <input type="text" name="type"><br>
출판사: <input type="text" name="publisher"><br>
출판년도: <input type="text" name="pubYear"><br>
이미지 첨부: <input type="text" name="imagePath"><br>
책 수량: <input type="number" name="bookQty"><br>
등록하기<input type="submit">
</form>
</body>
</html>