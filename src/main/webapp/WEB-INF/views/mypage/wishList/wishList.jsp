<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="비트 도서관">
<meta name="keyword" content="비트 도서관">
<meta name="copyright" content="COPYRIGHT(C) BIT LIBRARY. ALL RIGHTS RESERVED.">
<meta content="initial-scale=1, width=device-width" name="viewport">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>위시리스트</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main(1).css"
	media="screen and (min-width:768px) and (max-width:1024px)">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main(2).css"
	media="screen and (max-width:767px)">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/slick.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/menu.css">

<script src="/resources/jquery/jquery-3.3.1.min.js"></script>

</head>
<body>

<div id="divHeader">
	<!--header-->
	<div class="headerBtm">
		<div>
			<h2 class="logo">
				<a href="" title="비트 도서관"><img src="${pageContext.request.contextPath}/img/webimg/bitlogo.png" alt=""></a>
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
									type="image" class="searchBtn" src="${pageContext.request.contextPath}/img/webimg/btnSrch.png"
									alt="검색" title="검색">
							</p>
						</div>
					</fieldset>
				</form>

			</div>
		</div>
	</div>
</div>

<div id="divTabMenu" class="mThumbnailScroller _mTS_2 mTS-buttons-out" style="position: relative;">
				<div>
					<div id="mTS_2" class="mTSWrapper mTS_horizontal"><ul class="mTSContainer" id="mTS_2_container" style="position: relative; top: 0px; left: 0px; width: 344px;">

								<li class="mTSThumbContainer"><a href="">대여현황</a></li>

								<li class="mTSThumbContainer"><a href="">예약목록</a></li>

								<li class="mTSThumbContainer"><a href="">연체목록</a></li>
								
								<li class="mTSThumbContainer"><a href="">대여이력</a></li>

								<li class="selected mTSThumbContainer"><a href="mypage/wishList/wishList">위시리스트</a></li>

								<li class="mTSThumbContainer"><a href="">회원정보</a></li>

					</ul></div>
				</div>
</div>		
		
${wishList }

<div class="listTable">
		<table>
			<caption>위시리스트 목록</caption>
			<thead>
				<tr>
					<th scope="row" class="allCheck"><input type="checkbox" name="allCheck" id="allCheck"></th>
					
					<th scope="row" />
					
					<th scope="row" data-class="expand">도서명</th>

			  	</tr>
			</thead>
			<tbody>
				
 <c:forEach var="myWishList" items="${wishList }">	
 			
				<tr>
					<td class="checkbox"><input type="checkbox" name="check" value="${myWishList.bookTitle }"></td>

					<td class="image"><a href=""><img src="${myWishList.imagePath }" ></a></td>
					
					<td class="bookTitle"><a href="">${myWishList.bookTitle }</a></td>

				</tr>
				
				
 </c:forEach>				
			</tbody>
		</table>
</div>





<div id="divFooter">
		<div class="banner"></div>
		<!-- //배너모음 -->
		<div class="footer">
			<div>
				<p class="copyright">COPYRIGHT©BIT LIBRARY. ALL RIGHTS
					RESERVED.</p>
			</div>
			<a href="https://www.nowonlib.kr/#" class="btnTop">페이지 맨 위로 이동</a>
		</div>
		<!-- //divFooter -->
	</div>

<script>
$("#allCheck").click(function(){
 var chk = $("#allCheck").prop("checked");
 if(chk) {
  $(".check").prop("checked", true);
 } else {
  $(".check").prop("checked", false);
 }
});
</script>
<script>
 $(".check").click(function(){
  $("#allCheck").prop("checked", false);
 });
</script>
</body>
</html>