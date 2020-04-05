<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<table border="0">
		<c:forEach var="bookdt" items="${bookdt}">
			<tr>
				<th><h1>${bookdt.bookTitle}</h1></th>
				<th></th>
			</tr>

			<tr>
				<td><h3>자료유형</h3></td>
				<td><h5>${bookdt.type}</h5></td>
			</tr>
			<tr>
				<td><h3>서명/저자사항</h3></td>
				<td><h5>${bookdt.bookTitle}/${bookdt.author}</h5></td>
			</tr>
			<tr>
				<td><h3>발행사항</h3></td>
				<td><h5>${bookdt.publisher}/${bookdt.pubYear}</h5></td>
			</tr>
		</c:forEach>
	</table>

	<table border="1">


		<tr>
			<th></th>
			<th>도서번호</th>
			<th>도서상태</th>
			<th>예약여부</th>
		</tr>

		<c:forEach var="bookdtList" items="${bookdtList }">

			<c:set var="reservest" value="${bookdtList.reserveStatus}" />
			<c:set var="bookst" value="${bookdtList.rentStatus}" />
			<c:choose>
				<c:when test="${bookst == 2}">
					<c:set var="bookstat" value="대여가능" />
					<c:set var="reservestat" value="예약불가" />
				</c:when>

				<c:otherwise>
					<c:set var="bookstat" value="대여중" />

					<c:choose>

						<c:when test="${reservest == 0}">
							<c:set var="reservestat" value="예약가능" />
						</c:when>

						<c:otherwise>
							<c:set var="reservestat" value="예약불가" />
						</c:otherwise>

					</c:choose>

				</c:otherwise>
			</c:choose>

			<tr>
				<!-- <td><input type="radio" class="bookdtList" name="bookdtList"/></td> -->
				<!-- <td><input type="checkbox" class="bookdtList" name="bookdtList"/></td> -->
				<td class="num footalbe-first-cloumn"><input type="checkbox"
					name="check" id="check" data-bookNo="${bookdtList.bookNo}"
					value="${bookst}"></td>
				<td>${bookdtList.bookNo}</td>
				<td><c:out value="${bookstat}" /></td>
				<td><c:out value="${reservestat}" /></td>
			</tr>
		</c:forEach>
		<!-- <input type="button" value="대여" Onclick="location.href='/lib/bookRent.do'"> -->
		<button type="button" class="rent">대여</button>
		<input type="button" value="위시리스트"
			Onclick="location.href='lib/addwishlist.do'">
		<input type="button" value="예약"
			Onclick="location.href='/lib/reserve.do'">
	</table>

	<!-- <script type="text/javascript">
	function check_only(chk){
        var obj = document.getElementsByName("check");
        for(var i=0; i<obj.length; i++){
            if(obj[i] != check){
                obj[i].checked = false;
            }
        }
    }

</script>
 -->


	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

	<script>
	/* $(".rent").click(function() {
		$("input[name=check]:checked").each(function() {
			if (this.value != "2") { //대여불가
				alert("대여가 불가능합니다.") // 4/4 오후 9시 여기까지 현재 가능.
			} else {
				var count = $("input[name=check]:checked").length;
				var no
				$("input[name=check]:checked").each(function() {
					no=($(this).attr("data-bookNo")); //체크된 것의 data-bookNo 값을 뽑아서 배열에 넣기
				});
				console.log(no);
				if (count == 0) { //아무것도 선택된 것이 없을때 alert 띄워주기
					alert("선택된 위시리스트가 없습니다.")
				} else {//선택된 것이 있으면 controller로 값 넘겨주기
					$.ajaxSettings.traditional = true;
					$.ajax({
						url : "/lib/rent.do",
						type : "post",
						data : {bookNo : no},
						success : function(data) {
							alert('선택하신 도서가 대여되었습니다!');
							location.reload();
						},
					});
				}

			}
		});
	}); */
		 $(".rent").click(function() {
			$("input[name=check]:checked").each(function() {
				if (this.value != "2") { //대여불가
					alert("대여가 불가능합니다.") // 4/4 오후 9시 여기까지 현재 가능.
				} else {
					var count = $("input[name=check]:checked").length;
					var no = new Array();
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
							data : {chknos : no},
							success : function(data) {
								alert('선택하신 도서가 대여되었습니다!');
								location.reload();
							},
						});
					}

				}
			});
		});
	</script>
	<!-- <script>
		$(".rent").click(
				function() {
					var count = $("input[name=chk]:checked").length;
						var chkArray = [];
					$("input[name=chk]:checked").each(function(){
						 chkArray.push($(this).val());
					});
					console.log(chkArray);
					var data={};
					data["datas"] = chkArray;
					
					if(count == 0){
						alert("선택된 도서가 없습니다.")
					} else{
						/* jQuery.ajaxSettings.traditional = true; */
						
						$.ajax({
							url : "/lib/searchRent.do",
							type : "post",
							traditional : true,
							dataType : "JSON",
							contentType : "application/json; charset=UTF-8",
							async: false,
							data : JSON.stringify(data),
							success : function(data){
								alert("예약되었습니다.");
								console.log(JSON.stringify(chk));
							},
							error : function(request, status, error){
								alert("code:" + request.status + "\n"
										+ "message : " + request.responseText
										+ "\n" + "error : " +error);
								console.log('184', JSON.stringify(chk));
								console.log(data);
								location.reload();
								document.write("/////////////");
							},
						})
				}
				})
	</script> -->

</body>
</html>