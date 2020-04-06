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

<body>
	<!-- divHeader -->
	<div id="divHeader">
		<!--header-->

		<div class="headerBtm">
			<div>
				<h2 class="logo">
					<a href="/lib/main" title="비트 도서관"> <img
						src="webimg/bitlogo.png" />
					</a>
				</h2>
				<div id="globalMenu">
					<ul>
						<li><a href="wishList.do" title="마이페이지">마이페이지</a></li>

						<li><a href="" title="로그아웃">로그아웃</a></li>

					</ul>
				</div>
				<div id="divSearch">
					<form action="mainSearch" method="get" id="mainSearch">
						<!-- 검색어 넘겨주기 -->
						<fieldset>
							<legend>검색</legend>
							<div class="search">
								<p class="searchBox">
									<input type="text" class="searchInput" id="keyWord"
										name="keyWord" title="검색어를 입력하세요." placeholder="검색어를 입력하세요.">
									<input type="image" class="searchBtn"
										src="webimg/btnSrch.png"
										alt="검색" title="검색">
								</p>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- 메인 출력 페이지-->
	<div>
	<!-- <div id="contents2"> -->


					<li><a href="login.do" title="로그아웃">로그아웃</a></li>


		<article>
			<div class="block">
				<p>
					<c:forEach items="${mainView }" var="mainView" varStatus="status">


						<img id="${mainView.author }" src="${mainView.imagePath }"
							width="300" height="400" alt="${mainView.bookTitle}" />
							
						<!-- onerror="this.src='/image/ko/solution/common/ico/typeM.png'" width="75" height="103"  -->
					</c:forEach>
				</p>
			</div>
			<div class="block">
				<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
					Voluptatem mollitia accusamus sequi ipsa, rerum nam laboriosam,
					ipsam aperiam deleniti beatae expedita id quisquam veritatis
					corporis, voluptates ducimus molestiae eum adipisci.</p>
			</div>
			<!-- 반복 -->
			
		</article>
		<script>
			var count = 0;
			//스크롤 바닥 감지
			window.onscroll = function(e) {
				//추가되는 임시 콘텐츠
				//window height + window scrollY 값이 document height보다 클 경우,
				if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
					//실행할 로직 (콘텐츠 추가)
					 alert("you're at the bottom of the page");
					/* count++;
					var addContent = '<div class="block"><p>' + count
							+ '번째로 추가된 콘텐츠</p></div>';
					//article에 추가되는 콘텐츠를 append
					$('article').append(addContent); */
				}
			};
		</script>


	</div>

	<div id="divFooter">
		<div class="footer">
			<a href="main#" class="btnTop">페이지 맨 위로 이동</a>
		</div>
		<!-- //divFooter -->
	</div>
	<!-- //divFooter -->

</body>
</html>