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

<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css" />

</head>

<body>
	<!-- divHeader -->
	<div class="headerBtm">
		<div>
			<h2 class="logo">
				<a href="/lib/main" title="비트 도서관"> <img
					src="webimg/bitlogo.png" />
				</a>
			</h2>
			<div id="globalMenu">
				<ul>
					<li><a href="rentNow.do" title="마이페이지">마이페이지</a></li>

					<li><a href="logout.do" title="로그아웃">로그아웃</a></li>

				</ul>
			</div>
			<div id="divSearch">
				<form action="mainSearch" method="get" >
					<fieldset>
						<div class="search">
							<p class="searchBox">
							
								<input type="text" class="searchInput" id="keyWord"
									name="keyWord" title="검색어를 입력하세요." placeholder="검색어를 입력하세요.">
								<input type="image" class="searchBtn" src="webimg/btnSrch.png"
									alt="검색" title="검색">
									
							</p>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>

	<!-- 메인 출력 페이지-->
	<div>
		<!-- <div id="contents2"> -->
		<article>
			<div class="block">
				<p>
					<a href="lib/mainSearch"> <img src="/bookimg/1.PNG" width="300"
						height="400" vspace="20" hspace="50" /></a> <img src="/bookimg/2.PNG"
						width="300" height="400" vspace="20" hspace="50" /> <img
						src="/bookimg/3.PNG" width="300" height="400" vspace="20"
						hspace="50" /> <img src="/bookimg/4.PNG" width="300" height="400"
						vspace="20" hspace="50" /> <img src="/bookimg/5.PNG" width="300"
						height="400" vspace="20" hspace="50" /> <img src="/bookimg/6.PNG"
						width="300" height="400" vspace="20" hspace="50" />
				</p>
			</div>
			<!-- 반복 -->
		</article>
		
		
		<script>
			var count = 7;
			window.onscroll = function(e) {
				if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
					if (count < 50) {
						var addContent = '<p>'
								+
								'<img src="/bookimg/'+ count++ +'.PNG" width="300" height="400" vspace="20" hspace="50"/>'
								+ '<img src="/bookimg/'+ count++ +'.PNG" width="300" height="400" vspace="20" hspace="50"/>'
								+ '<img src="/bookimg/'+ count++ +'.PNG" width="300" height="400" vspace="20" hspace="50"/>'
								+
								'</p>';
						$('.block').append(addContent);
					}
					else {
						alert('여기까지가 끝인가보오.');
					}
				}
			};
		</script>


	</div>


	<jsp:include page="bot.jsp" flush="false" />

</body>
</html>