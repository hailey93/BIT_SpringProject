<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/menu.css">

</head>
<body>
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

</body>
</html>