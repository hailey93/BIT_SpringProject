<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



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

<title>대여현황</title>
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/sub.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/list.css">

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

	<!-- divContents-->
	<div id="divContentsW">
		<div id="divContents">

			<script>
				$(document).ready(
						function() {
							var savexlsDialog, savexlsform;
							savexlsDialog = $("#dialog-form").dialog({
								autoOpen : false,
								height : 250,
								width : 430,
								modal : true,
								title : '엑셀 다운로드 사유',
								buttons : {
									"확인" : savexls,
									"취소" : function() {
										$(this).dialog("close");
									}
								},
								close : function(event, ui) {
									savexlsform[0].reset();
								}
							});

							savexlsform = savexlsDialog.find("form").on(
									"submit", function(event) {
										event.preventDefault();
										savexls();
									});

							function savexls() {
								var reason = $("#reason").val();
								if (reason == '') {
									alert('엑셀 다운로드 사유를 입력하세요.');
									return false;
								}

								if (reason.length > 100) {
									alert('100자 이하로 입력하세요.');
									$("#reason").val("");
									return false;
								}

								savexlsform[0].submit();
								savexlsDialog.dialog("close");
								return true;
							}

							$("a").click(function(event) {
								var href = $(this).attr("href");
								for (var i = 0; i < excelUrlLength; i++) {
									if (href.indexOf(excelUrl[i]) != -1) {
										event.preventDefault();
										$("#formSavexls").attr("action", href);
										if ('*******YUN123' == "")
											alert('로그인 후 이용이 가능합니다.');
										else
											savexlsDialog.dialog("open");

										break;
									}
								}
							});
						});
			</script>

			<!-- Tab메뉴 -->
			<div id="divTabMenu">
				<div>
					<ul>
						<li class="selected"><a href="rentNow.do" title="대여현황">대여현황</a></li>
						<li><a href="reserveList.do" title="예약목록">예약목록</a></li>
						<li><a href="rentHistory.do" title="대여이력">대여이력</a></li>
						<li><a href="wishList.do" title="위시리스트">위시리스트</a></li>
						<li><a href="wishList.do" title="회원정보수정">회원정보수정</a></li>
					</ul>
				</div>
			</div>

			<!-- divContent 시작-->
			<div id="divContent">
				<form id="frm" name="frm" method="post" action="/myloan/renew"
					onsubmit="return checked(this);">
					<!-- Content List -->
					<div class="listTable">
						<table>
							<thead>
								<tr>
									<th scope="row"><input type="checkbox" name="all"
										class="checkAll"></th>
									<th scope="row">No.</th>
									<th scope="row">도서명</th>
									<th scope="row">저자</th>
									<th scope="row">등록번호</th>
									<th scope="row">대여일</th>
									<th scope="row">반납예정일</th>
									<th scope="row">연장가능여부</th>
									<th scope="row">연체일수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${selectRentNow}" var="rent"
									varStatus="status">
									<tr>
										<td class="checkbox"><input type="checkbox" name="check"
											id="chk"></td>
										<td>${status.count }</td>
										<!-- bookDetail 페이지로 넘기기 -->
										<td><a href="./select.do?empno=${rent.bookTitle}">${rent.bookTitle}</a></td>
										<td>${rent.author}</td>
										<td>${rent.bookNo}</td>
										<td>${rent.rentDate}</td>
										<td>${rent.returnDueDate}</td>
										<c:choose>
											<c:when test="${rent.rentStatus == 0}">
												<td>가능</td>
											</c:when>
											<c:otherwise>
												<td>불가능</td>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${rent.datedif == 0}">
												<td></td>
											</c:when>
											<c:otherwise>
												<td>${rent.datedif}일</td>
											</c:otherwise>
										</c:choose>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>


					<!-- Content Paging -->
					<div class="paging">
						<span><span>1</span><a href="?pn=2">2</a><a href="?pn=3">3</a><a
							href="?pn=4">4</a><a href="?pn=5">5</a></span><a href="?pn=6"
							class="page" title="다음"><img
							src="/image/ko/solution/common/btn/nextPage.gif" alt="다음"
							title="다음"></a><a href="?pn=396" class="page" title="맨뒤"><img
							src="/image/ko/solution/common/btn/lastPage.gif" alt="맨뒤"
							title="맨뒤"></a>
					</div>

					<!-- Content Buttons -->
					<div class="buttons">
						<input type="submit" title="도서연장" value="도서연장"></input> <input
							type="submit" title="도서반납" value="도서반납"></input>
					</div>



					<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
					<script>
						$(document).ready(
								function() {
									/* $(".box button").attr("disabled", true); */
									$(".checkAll").click(
											function() {
												var chk = $(this)
														.is(":checked");
												/* if (chk == true) {
													$(".box button").removeAttr('disabled');
													$(".box").removeClass("on");
												} else {
													$(".box button").attr("disabled", true);
													$(".box").addClass("on");
												} */
												if (chk) {
													$("input[name=check]")
															.prop("checked",
																	true);
												} else {
													$("input[name=check]")
															.prop("checked",
																	false);
												}
											});
								});
					</script>

				</form>
				"return checked(this);"
			<!-- divContent 끝-->
			</div>

		<!--//divContents-->
		</div>

	<!--//divContentsW?????-->
	</div>


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


