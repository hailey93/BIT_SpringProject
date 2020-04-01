<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>비트 도서관</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main(1).css"
	media="screen and (min-width:768px) and (max-width:1024px)">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main(2).css"
	media="screen and (max-width:767px)">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/slick.css">

</head>


<!-- divHeader -->
<div id="divHeader">
	<!--header-->

	<div class="headerBtm">
		<div>
			<h2 class="logo">
				<a href="" title="비트 도서관"> <img
					src="${pageContext.request.contextPath}/img/webimg/bitlogo.png" />
				</a>
			</h2>
			<div id="globalMenu">
				<ul>
					<li><a href="wishList.do" title="마이페이지">마이페이지</a></li>

					<li><a href="" title="회원가입">로그아웃</a></li>

				</ul>
			</div>
			<div id="divSearch">
				<form action="mainSearch" method="get" id="mainSearch" >
					<!-- 검색어 넘겨주기 -->
					<fieldset>
						<legend>검색</legend>
						<div class="search">
							<p class="searchBox">
								<input type="text" class="searchInput" id = "query" name="query" 
								title="검색어를 입력하세요." placeholder="검색어를 입력하세요."> 
								<input type="image" class="searchBtn" src="${pageContext.request.contextPath}/img/webimg/btnSrch.png" alt="검색" title="검색">
							</p>
						</div>
					</fieldset>
				</form>


			</div>
		</div>
	</div>


	<!-- 메인 출력 페이지-->
	<div id="divContents">
		<!-- Contents2 -->
		<div class="contents2">
			<div></div>
		</div>
	</div>

	<div id="divFooter">
		<div class="banner"></div>
		<!-- //배너모음 -->
		<div class="footer">
			<div>
				<p class="copyright">COPYRIGHT©NOWON LIBRARY. ALL RIGHTS
					RESERVED.</p>
			</div>
			<a href="https://www.nowonlib.kr/#" class="btnTop">페이지 맨 위로 이동</a>
		</div>
		<!-- //divFooter -->
	</div>
	<!-- //divFooter -->
</div>



</body>
</html>