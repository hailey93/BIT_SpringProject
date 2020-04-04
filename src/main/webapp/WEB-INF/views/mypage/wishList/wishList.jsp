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
<title>위시리스트</title>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypagemenu.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypagetable.css">

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
						<li><a href="" title="마이페이지">마이페이지</a></li>

						<li><a href="" title="로그아웃">로그아웃</a></li>

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
	<div id="divContentsW">
		<div id="divContents">
			<div id="divTabMenu" class="mThumbnailScroller _mTS_2 mTS-buttons-out" style="position: relative;">
				<div>
					<div id="mTS_2" class="mTSWrapper mTS_horizontal"><ul class="mTSContainer" id="mTS_2_container" style="position: relative; top: 0px; left: 0px; width: 100%;">

								<li class="mTSThumbContainer"><a href="">대여현황</a></li>

								<li class="mTSThumbContainer"><a href="">예약목록</a></li>
								
								<li class="mTSThumbContainer"><a href="">대여이력</a></li>

								<li class="selected mTSThumbContainer"><a href="wishList.do">위시리스트</a></li>

								<li class="mTSThumbContainer"><a href="">회원정보</a></li>

					</ul></div>
				</div>
			</div>	
	
	<button type="button" class="delete">삭제</button>
	<button type="button" class="rent">대여하기</button>
	<button type="button" class="reserve">예약하기</button>
	
	<div class="listTable">
	<table class="mobileTable tablet">

		<thead>
			<tr>
				<th scope="row" class="footable-first-column"><input type="checkbox" name="allCheck" id="allCheck"></th>

				<th scope="row" data-class="expand" />

				<th scope="row" data-class="expand">도서명</th>

				<th scope="row" data-hide="phone" class="footable-last-column" style="display: table-cell;">대출상태</th>

			</tr>
		</thead>
		<tbody>

			<c:forEach var="myWishList" items="${wishList }">

				<tr>
					<td class="num footable-first-column"><input type="checkbox" name="check" 
					id="check" data-wishListCode="${myWishList.wishListCode}" data-bookNo="${myWishList.bookNo}"></td>

					<td class="image"><a href=""><img src="${myWishList.imagePath }"></a></td>

					<td class="bookTitle"><a href="">${myWishList.bookTitle }</a></td>
					
					<td class="footable-last-column"  style="display: table-cell;">
				    <c:choose>
						<c:when test="${myWishList.rentStatus==2 }">대여가능</c:when>
						<c:otherwise>대여중</c:otherwise>
					</c:choose></td>
				</tr>

			</c:forEach>
		</tbody>
	</table>
	</div>
	</div>
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

	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script>
		$(document).ready(function() {
			$("#allCheck").click(function() {
				var chk = $(this).is(":checked");
				if (chk) {
					$("input[name=check]").prop("checked", true);
				} else {
					$("input[name=check]").prop("checked", false);
				}
			});
		});
	</script>

	<script>
		$(".delete").click(function() {//삭제버튼 누르면 삭제 컨트롤러로 체크된 값 넘겨주기
					var count = $("input[name=check]:checked").length;
					var code=new Array();
					$("input[name=check]:checked").each(function() {//체크된 것만 선택하기
						code.push($(this).attr("data-wishListCode")); //체크된 것의 data-wishListCode 값을 뽑아서 배열에 넣기
					});
 					console.log(code); 
					if (count == 0) { //아무것도 선택된 것이 없을때 alert 띄워주기
						alert("선택된 위시리스트가 없습니다.")
					} else {//선택된 것이 있으면 controller로 값 넘겨주기
						$.ajaxSettings.traditional = true;
						$.ajax({
							url : "/lib/deleteWishList.do",
							type : "post",
							data : { chkcodes : code },
							success : function(data) {
								alert('삭제되었습니다!');
								location.reload();
							},
							
						});
					}

				});
		$(".rent").click(function() {//삭제버튼 누르면 삭제 컨트롤러로 체크된 값 넘겨주기
			var count = $("input[name=check]:checked").length;
			var no=new Array();
			$("input[name=check]:checked").each(function() {
				no.push($(this).attr("data-bookNo")); //체크된 것의 data-bookNo 값을 뽑아서 배열에 넣기
			});
			console.log(no); 
			if (count == 0) { //아무것도 선택된 것이 없을때 alert 띄워주기
				alert("선택된 위시리스트가 없습니다.")
			} else {//선택된 것이 있으면 controller로 값 넘겨주기
				$.ajaxSettings.traditional = true;
				$.ajax({
					url : "/lib/rent.do",
					type : "post",
					data : { chknos : no },
					success : function(result) {
						if(result==1){
							alert('선택하신 도서가 대여되었습니다!');
							location.reload();
						}
						else{
							alert('선택하신 도서가 대여불가 상태입니다. 대여가능책을 확인해주세요!');
						}
					},
				});
			}

		});
		$(".reserve").click(function() {//삭제버튼 누르면 삭제 컨트롤러로 체크된 값 넘겨주기
			var count = $("input[name=check]:checked").length;
			var no=new Array();
			$("input[name=check]:checked").each(function() {
				no.push($(this).attr("data-bookNo")); //체크된 것의 data-bookNo 값을 뽑아서 배열에 넣기
			});
			
			if (count == 0) { //아무것도 선택된 것이 없을때 alert 띄워주기
				alert("선택된 위시리스트가 없습니다.")
			} else {//선택된 것이 있으면 controller로 값 넘겨주기
				$.ajaxSettings.traditional = true;
				$.ajax({
					url : "/lib/reserve.do",
					type : "post",
					data : { chknos : no },
					success : function(result) {
						if(result==1){
							alert('선택하신 도서가 예약되었습니다!');
							location.reload();
						}
						else{
							alert('선택하신 도서는 대여가능 상태입니다. 대여버튼을 눌러주세요!');
						}
						
					},
				});
			}

		});
	</script>
</body>
</html>