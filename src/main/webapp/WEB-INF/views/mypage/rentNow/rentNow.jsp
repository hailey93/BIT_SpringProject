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
	<a href="wishList.do" title="예약목록">예약목록</a>
	<a href="overdue.do" title="연체현황">연체현황</a>
	<a href="rentHistory.do" title="대여이력">대여이력</a>
	<a href="wishList.do" title="위시리스트">위시리스트</a>
	<a href="wishList.do" title="회원정보수정">회원정보수정</a>
	<br>

	<table border="1">
		<thead>
			<tr>
				<th><input type="checkbox" name="all" class="check-all">
					<label></label></th>
				<th>No.</th>
				<th>도서명</th>
				<th>저자</th>
				<th>등록번호</th>
				<th>대여일</th>
				<th>반납예정일</th>
				<th>연장가능여부</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${selectRentNow}" var="rent" varStatus="status">
				<c:set var="rentStatus" value="${rent.rentStatus}" />
				<c:choose>
					<c:when test="${rentStatus==0}">
						<c:set var="rentStatus" value="가능" />
					</c:when>
					<c:otherwise>
						<c:set var="rentStatus" value="불가능" />
					</c:otherwise>
				</c:choose>
				<tr>
					<td class="checkbox"><input type="checkbox" name="check"></td>
					<td>${status.count }</td>
					<!-- bookDetail 페이지로 넘기기 -->
					<td><a href="./select.do?empno=${rent.bookTitle}">${rent.bookTitle}</a></td>
					<td>${rent.author}</td>
					<td>${rent.bookNo}</td>
					<td>${rent.rentDate}</td>
					<td>${rent.returnDueDate}</td>
					<td><c:out value="${rentStatus}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<button type="button" class="renew" onclick="location='/renew.do'">도서연장</button> 
	<button type="submit" class="return">도서반납</button>

	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script>
		$(document).ready(function() {
			$('.check-all').click(function() {
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
			var chkArray = [];
			$("input[name=check]:checked").each(function() {//체크된 것만 선택하기
				chkArray.push($(this).val()); //체크된 것만 뽑아서 배열에 넣기
			});
			console.log(JSON.stringify(chkArray));

			if (count == 0) { //아무것도 선택된 것이 없을때 alert 띄워주기
				alert("선택된 위시리스트가 없습니다.")
			} else {//선택된 것이 있으면 controller로 값 넘겨주기
				jQuery.ajaxSettings.traditional = true;

				$.ajax({
					url : '/lib/deleteWishList.do',
					type : 'post',
					data : JSON.stringify(chkArray),
					dataType : 'json',
					contentType : 'application/json; charset=UTF-8',
					success : function(data) {
						alert('삭제되었습니다!');
						location.reload();
					},
					error : function() {
						alert('삭제되지 않았습니다!');
					},
				});
			}

		});
	</script>

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

