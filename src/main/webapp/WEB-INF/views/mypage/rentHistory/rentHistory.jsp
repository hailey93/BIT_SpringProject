<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>대여이력</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main(1).css"
	media="screen and (min-width:768px) and (max-width:1024px)">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main(2).css"
	media="screen and (max-width:767px)">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/slick.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sub.css">

<style>
table {
	width: 100%;
}
</style>



</head>
<body>

	<div id="divHeader">
		<!--header-->
		<div class="headerBtm">
			<div>
				<h2 class="logo">
					<a href="" title="비트 도서관"><img
						src="${pageContext.request.contextPath}/img/webimg/bitlogo.png"
						alt=""></a>
				</h2>
				<div id="globalMenu">
					<ul>
						<li><a href="" title="로그인">마이페이지</a></li>

						<li><a href="" title="회원가입">로그아웃</a></li>

					</ul>
				</div>
				<div id="divSearch">
					<form name="searchForm" action="" method="get">
						<!-- 검색어 넘겨주기 -->
						<input type="hidden" name="si" value="TOTAL"> <input
							type="hidden" name="st" value="KWRD">
						<fieldset>
							<legend>검색</legend>
							<div class="search">
								<p class="searchBox">
									<input type="text" class="searchInput" id="type1q" name="q"
										title="검색어를 입력하세요." placeholder="검색어를 입력하세요."> <input
										type="image" class="searchBtn"
										src="${pageContext.request.contextPath}/img/webimg/btnSrch.png"
										alt="검색" title="검색">
								</p>
							</div>
						</fieldset>
					</form>

				</div>
			</div>
		</div>
	</div>
	<a href="rentNow.do" title="대여현황">대여현황</a>
	<a href="reserveList.do" title="예약목록">예약목록</a>
	<a href="rentHistory.do" title="대여이력">대여이력</a> 
	<a href="wishList.do" title="위시리스트">위시리스트</a> 
	<a href="ishList.do" title="회원정보수정">회원정보수정</a>
	<br>

	<table border="1">
		<thead>
			<tr>
				<th>No.</th>
				<th>도서명</th>
				<th>저자</th>
				<th>등록번호</th>
				<th>대여일</th>
				<th>반납일</th>
			</tr>
		</thead>
		<tbody>				<!--     받는 값        		      쓸값 -->
			<c:forEach items="${rentHistoryList}" var="rent" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<!-- bookDetail 페이지로 넘기기 -->
					<td><a href="./select.do?empno=${rent.bookTitle}"> ${rent.bookTitle}</a></td>
					<td>${rent.author}</td>
					<td>${rent.bookNo}</td>
					<td>${rent.rentDate}</td>
					<td>${rent.returnDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>


	<div id="divFooter">
		<div class="banner"></div>
		<!-- //배너모음 -->
		<div class="footer">
			<div>
				<p class="copyright">COPYRIGHT©BIT LIBRARY. ALL RIGHTS RESERVED.</p>
			</div>
			<a href="https://www.nowonlib.kr/#" class="btnTop">페이지 맨 위로 이동</a>
		</div>
		<!-- //divFooter -->
	</div>

	
</body>
</html>