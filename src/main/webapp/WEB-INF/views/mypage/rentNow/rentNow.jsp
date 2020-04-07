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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/mypagemenu.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/mypagetable.css">

<style>
table {
	width: 100%;
}
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/top.jsp" flush="false" />

	<!-- divContents-->
	<div id="divContentsW">
		<div id="row">
			<h1 align="center">대여현황</h1>
		</div>
		<div id="divContents">
			<!-- Tab메뉴 -->

			<div id="divTabMenu"
				class="mThumbnailScroller _mTS_2 mTS-buttons-out"
				style="position: relative;">
				<div>
					<div id="mTS_2" class="mTSWrapper mTS_horizontal">
						<ul class="mTSContainer" id="mTS_2_container"
							style="position: relative; top: 0px; left: 0px; width: 100%;">

							<li class="selected mTSThumbContainer"><a href="rentNow.do">대여현황</a></li>

							<li class="mTSThumbContainer"><a href="reserveList.do">예약목록</a></li>

							<li class="mTSThumbContainer"><a href="rentHistory.do">대여이력</a></li>

							<li class="mTSThumbContainer"><a href="wishList.do">위시리스트</a></li>

							<li class="mTSThumbContainer"><a href="">회원정보</a></li>

						</ul>
					</div>
				</div>
			</div>



			<!-- divContent 시작-->
			<div id="divContent">
					<!-- Content List -->
					<div class="listTable">
						<table>
							<thead>
								<tr>
									<th scope="row" class="footable-first-column"><input
										type="checkbox" name="allCheck" id="allCheck" title="전체선택"></th>
									<!-- <label
										for="allCheck"></label> -->
									<!-- <th scope="col"><input type="checkbox" name="all"
										class="checkAll"></th> -->
									<th scope="row">No.</th>
									<th scope="row">도서명</th>
									<th scope="row">저자</th>
									<th scope="row">등록번호</th>
									<th scope="row">대여일</th>
									<th scope="row">반납예정일</th>
									<th scope="row">연장가능여부</th>
									<th scope="row" class="footable-last-column">연체일수</th>
								</tr>
							</thead>
							<!-- data-num="${status.count}" data-bookTitle="${rent.bookTitle }" data-author="${rent.author }" 
											data-bookNo="${rent.bookNo}" data-rentDate="${rent.rentDate}" data-returnDueDate="${rent.returnDueDate}" 
											data-rentStatus="${rent.rentStatus}" data-rentDif="${rent.datedif}"  -->
							<tbody>
								<c:forEach items="${selectRentNow}" var="rent">
									<tr>
										<td class="num footable-first-column"><input
											type="checkbox" name="check" class="check"
											data-num="${rent.historyCode}"
											<%-- data-bookTitle="${rent.bookTitle }"
											data-author="${rent.author }" data-bookNo="${rent.bookNo}"
											data-rentDate="${rent.rentDate}" --%>
											data-returnDueDate="${rent.returnDueDate}"
											data-rentStatus="${rent.rentStatus}"
											data-rentDif="${rent.datedif}" value="${rent.rentStatus}"></td>
										<td class="historyCode">${rent.historyCode}</td>
										<td class="bookTitle">
											<!-- bookDetail 페이지로 넘기기 --> <a
											href="./select.do?bookDetail=${rent.bookTitle}">${rent.bookTitle}</a>
										</td>
										<td class="author">${rent.author}</td>
										<td class="bookNo">${rent.bookNo}</td>
										<td class="rentDate">${rent.rentDate}</td>
										<td class="returnDueDate">${rent.returnDueDate}</td>
										<c:choose>
											<c:when test="${rent.rentStatus == 0}">
												<td class="rentStatus">가능</td>
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
												<td class="datedif footable-last-column">${rent.datedif}일</td>
											</c:otherwise>
										</c:choose>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>


					<!-- Content Buttons -->
					<div class="buttons">
						<input type="submit" title="도서연장" value="도서연장" class="renew"></input>
						<input type="submit" title="도서반납" value="도서반납" class="return"></input>
					</div>

					<jsp:include page="/WEB-INF/views/bot.jsp" flush="false" />
			<!-- divContent 끝-->
			</div>

			<!--//divContents-->
		</div>

		<!--//divContentsW-->
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

	<!-- <script>
						$(".renew").click(function() {
							var confirm_val = confirm("연장하시겠습니까?");

							if (confirm_val) {
								var checkArr = new Array();

								$("input[class='check']:checked").each(function() {
									checkArr.push($(this).attr("data-num"));
								});

						$.ajax({
							url : "/mypage/rentNow/renew" ,
							type : "post",
							data : {checkArr : cheak},
							success : function() {
							location.href = "/mypage/rentNow/rentNow";
								}
							});
						}
						});
					</script> -->

	<script>
		$(".renew").click(function() {
			$("input[name=check]:checked").each(function() {
				if (this.value != "0") { //대여상태가 0이 아닌 책들은 연장불가
					alert('선택하신 도서는 연장이 불가능합니다. 다시 선택해주십시오')
				} else {
					var count = $("input[name=check]:checked").length;
					var no = new Array();
					$("input[name=check]:checked").each(function() {
						no.push($(this).attr("data-bookNo")); //체크된 것의 data-bookNo 값을 뽑아서 배열에 넣기
					});
					console.log(no);
					
					if (count == 0) { //아무것도 선택된 것이 없을때 alert 띄워주기
						alert("선택된 연장 가능 목록이 없습니다.")
					} else {//선택된 것이 있으면 controller로 값 넘겨주기
						$.ajaxSettings.traditional = true;
						$.ajax({
							url : "/lib/renew.do",
							type : "post",
							data : {chknos : no},
							success : function(data) {
								alert('선택하신 도서가 연장되었습니다!');
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