<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
도서번호 : ${rentst.bookNo}<br>
도서명 : ${restst.bookTitle}<br>
예약신청일 : ${restst.reserveDate}<br>
반납일 : ${restst.returnDate}<br>
예약만기일 : ${restst.reserveFinDate}<br>
도서상태 : ${rentst.rentStatus}<br>
<a href="./reserveList.do?bookTitle=${rentst.bookTitle}"></a>
</body>
</html>