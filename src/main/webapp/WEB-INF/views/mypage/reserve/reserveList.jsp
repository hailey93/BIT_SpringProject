<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>


<body>
	<table border="1">
		<tr>
			<th></th>
			<th>도서번호</th>
			<th>도서명</th>
			<th>예약신청일</th>
			<th>반납예정일</th>
			<th>예약만기일</th>
			<th>도서상태</th>
		</tr>

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
				<td class="num footable-first-column"><input type="checkbox" 
				name="check" id="check" data-bookNo="${rentst.bookNo}"
				value="${rents}" onclick="check_only(this)"></td>
				<td>${rentst.bookNo}</td>
				<td>${rentst.bookTitle}</td>
				<td>${rentst.reserveDate}</td>
				<td>${rentst.returnDueDate}</td>
				<td>${rentst.reserveFinDate }</td>
				<td><c:out value="${rentstat}" /></td>
				<%-- <td>${rentst.rentStatus}</td> --%>
			</tr>
		</c:forEach>
	</table>
		<button type="button" class="rent">대여</button>
		<button type="button" class="delete">예약취소</button>
		
		<script type="text/javascript">
	function check_only(check){
        var obj = document.getElementsByName("check");
        for(var i=0; i<obj.length; i++){
            if(obj[i] != check){
                obj[i].checked = false;
            }
        }
    }

</script>
	
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	
	<script>
		$(".delete").click(
				function() {
					var count = $("input[name=check]:checked").length;
						var chk;
					$("input[name=check]:checked").each(function(){
						 chk=($(this).attr("data-bookNo"));
					});
					console.log("input[name=check]:checked");
					if(count == 0){
						alert("선택된 목록이 없습니다.")
					} else{
						jQuery.ajaxSettings.traditional = true;
						
						$.ajax({
							url : "/lib/reserveCancel1.do",
							type : "post",
							data : JSON.stringify({
								'bookNo' : chk
							}),
							dataType : "json",
							contentType : "application/json; charset=UTF-8",
							success : function(data){
								alert("삭제되었습니다");
								console.log(JSON.stringify(chk));
							},
						});
					}
				});
				
				 $(".rent").click(function() {
			$("input[name=check]:checked").each(function() {
				if (this.value != "2") { //대여불가
					alert("대여가 불가능합니다.") // 4/4 오후 9시 여기까지 현재 가능.
				} else {
					var count = $("input[name=check]:checked").length;
					var no=new Array;
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
	</script>
</body>
</html>