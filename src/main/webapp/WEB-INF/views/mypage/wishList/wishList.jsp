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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypagemenu.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypagetable.css">

<style>
table {
	width: 100%;
}
</style>
</head>
<body>

<jsp:include page="/WEB-INF/views/top.jsp" flush="false" />

	<div id="divContentsW">
	<div id="row">
	<h1 align="center">위시리스트</h1>
	</div>
		<div id="divContents">
			<div id="divTabMenu" class="mThumbnailScroller _mTS_2 mTS-buttons-out" style="position: relative;">
				<div>
					<div id="mTS_2" class="mTSWrapper mTS_horizontal"><ul class="mTSContainer" id="mTS_2_container" style="position: relative; top: 0px; left: 0px; width: 100%;">

								<li class="mTSThumbContainer"><a href="">대여현황</a></li>

								<li class="mTSThumbContainer"><a href="">예약목록</a></li>
								
								<li class="mTSThumbContainer"><a href="">대여이력</a></li>

								<li class="selected mTSThumbContainer"><a href="wishList.do">위시리스트</a></li>

								<li class="mTSThumbContainer"><a href="viewUser.do">회원정보</a></li>

					</ul>
					</div>
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
					id="check" data-wishListCode="${myWishList.wishListCode}" data-bookNo="${myWishList.bookNo}"
					value="${myWishList.rentStatus }"></td>

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

<jsp:include page="/WEB-INF/views/bot.jsp" flush="false" />


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
		$(".delete").click(function() {//삭제버튼 누르면 컨트롤러로 체크된 값 넘겨주기
				
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
		$(".rent").click(function() {
			$("input[name=check]:checked").each(function() {	 
					if(this.value!="2"){ //대여상태가 반납(2)이 아닌 책들은 대여 불가
						alert('선택하신 도서가 대여불가 상태입니다. 대여가능책만 대여하실 수 있습니다!')
					} else{
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
						success : function(data) {			
								alert('선택하신 도서가 대여되었습니다!');
								location.reload();							
						},
						});
					}
					
				}
			});
		});
		$(".reserve").click(function() {
			$("input[name=check]:checked").each(function() {	 
				if(this.value=="2"){ //대여상태가 반납(2)인 책들은 예약 불가, 바로 대여
					alert('선택하신 도서는 대여가능 상태입니다. 대여버튼을 눌러주세요!')
				} else{
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
					url : "/lib/reserve.do",
					type : "post",
					data : { chknos : no },
					success : function(data) {			
							alert('선택하신 도서가 예약되었습니다!');
							location.reload();							
					},
					});
				}
				
			}
		});
		});
			
	</script>
</body>
</html>