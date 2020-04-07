<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<title>예약목록</title>
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

#button {
	margin: -1px;
	border: 1px solid rgba(0, 155, 255, 0.9);
	background-color: rgba(0, 0, 0, 0);
	color: rgba(0, 155, 255, 0.9);
	padding: 3px;
	border-radius: 5px;
	font-size: 24px;
}
#button:hover{
	color:white;
	background-color: skyblue;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/top.jsp" flush="false" />
	 <div id="divContentsW">
	  <div id="divContents">
	   <div id="divTabMenu"
			class="mThumbnailScroller _mTS_2 mTS-buttons-out"
			style="position: relative;">
		<div>
		 <div id="mTS_2" class="mTSWrapper mTS_horizontal">
		  <ul class="mTSContainer" id="mTS_2_container"
			  style="position: relative; top: 0px; left: 0px; width: 100%;">
			<li class="mTSThumbContainer"><a href="">대여현황</a></li>
			<li class="selected mTSThumbContainer"><a href="reserveList.do">예약목록</a></li>
			<li class="mTSThumbContainer"><a href="">대여이력</a></li>
			<li class="mTSThumbContainer"><a href="wishList.do">위시리스트</a></li>
			<li class="mTSThumbContainer"><a href="">회원정보</a></li>
		  </ul>
		 </div>
		</div>
	   </div>

	<div class="listTable">
	 <table class="mobileTable tablet">
	  <thead>
		<tr>
		 <th scope="row" class="footable-first-column" />
		 <th scope="row" data-class="expand">도서번호</th>
		 <th scope="row" data-class="expand">도서명</th>
		 <th scope="row" data-class="expand">예약신청일</th>
		 <th scope="row" data-class="expand">반납예정일</th>
		 <th scope="row" data-class="expand">예약만기일</th>
		 <th scope="row" data-class="expand">도서상태</th>
		</tr>
 	   </thead>
	  <tbody>
	   <c:forEach var="rentst" items="${rentst }">
		<c:set var="rents" value="${rentst.rentStatus}" />
		 <c:choose>
		  <c:when test="${rents == 2 }">
		   <c:set var="rentstat" value="대여가능" />
	  	  </c:when>
		   <c:otherwise>
			<c:set var="rentstat" value="대여중" />
		   </c:otherwise>
		 </c:choose>
			<tr>
			 <td class="num footable-first-column"><input
				 type="checkbox" name="check" id="check"
				 data-bookNo="${rentst.bookNo}" value="${rents}"
				 onclick="check_only(this)"></td>
			 <td>${rentst.bookNo}</td>
			 <td>${rentst.bookTitle}</td>
			 <td>${rentst.reserveDate}</td>
			 <td>${rentst.returnDueDate}</td>
			 <td>${rentst.reserveFinDate }</td>
			 <td><c:out value="${rentstat}" /></td>
			</tr>
		</c:forEach>
	   </tbody>	
	  </table>
		<button id="button" type="button" class="rent">대여</button>
		<button id="button" type="button" class="delete">예약취소</button>
	</div>
   </div>
  </div>

	<jsp:include page="/WEB-INF/views/bot.jsp" flush="false" />

	<script type="text/javascript">
		function check_only(check) {
			var obj = document.getElementsByName("check");
			for (var i = 0; i < obj.length; i++) {
				if (obj[i] != check) {
					obj[i].checked = false;
				}
			}
		}
	</script>

	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

	<script>
		$(".delete").click(function() {
			var count = $("input[name=check]:checked").length;
			var chk;
			$("input[name=check]:checked").each(function() {
				chk = ($(this).attr("data-bookNo"));
				
			});
			console.log(chk);
			if (count == 0) {
				alert("선택된 목록이 없습니다.")
			} else {
				$.ajaxSettings.traditional = true;
				$.ajax({
					url : "/lib/reserveCancel1.do",
					type : "post",
					data : {bookNo : chk},
					success : function(data) {
						alert("삭제되었습니다");
						console.log(data);
					},
					error : function(request, status, error){
						alert("code:" + request.status + "\n"
								+ "message : " + request.responseText
								+ "\n" + "error : " +error);
					
					},
				});
			}
		});

		$(".rent").click(function() {
			$("input[name=check]:checked").each(function() {
				if (this.value != "2") { //대여불가
					alert("대여가 불가능합니다.") 
				} else {
					var count = $("input[name=check]:checked").length;
					var no = new Array;
					$("input[name=check]:checked").each(function() {
						no.push($(this).attr("data-bookNo")); //체크된 것의 data-bookNo 값을 뽑아서 배열에 넣기
					});

					if (count == 0) { //아무것도 선택된 것이 없을때 alert 띄워주기
						alert("선택된 위시리스트가 없습니다.")
					} else {//선택된 것이 있으면 controller로 값 넘겨주기

						$.ajaxSettings.traditional = true;
						$.ajax({
							url : "/lib/rent.do",
							type : "post",
							data : {chknos : no},
							success : function(data) {
								alert('선택하신 도서가 대여되었습니다!');
								console.log(data)
							},
							error : function(request, status, error){
								alert("code:" + request.status + "\n"
										+ "message : " + request.responseText
										+ "\n" + "error : " +error);
							},
						});
					}

				}
			});
		});
	</script>
</body>
</html>