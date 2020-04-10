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

<title>대여이력</title>
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

	<div id="divContentsW">
	
	<div id="row">
	<h1 align="center">대여 이력</h1>
	</div>
		<div id="divContents">
			<div id="divTabMenu" class="mThumbnailScroller _mTS_2 mTS-buttons-out" style="position: relative;">
				<div>
					<div id="mTS_2" class="mTSWrapper mTS_horizontal"><ul class="mTSContainer" id="mTS_2_container" style="position: relative; top: 0px; left: 0px; width: 100%;">

								<li class="mTSThumbContainer"><a href="rentNow.do">대여현황</a></li>

								<li class="mTSThumbContainer"><a href="reserveList.do">예약목록</a></li>
								
								<li class="selected mTSThumbContainer"><a href="rentHistory.do">대여이력</a></li>

								<li class="mTSThumbContainer"><a href="wishList.do">위시리스트</a></li>

								<li class="mTSThumbContainer"><a href="viewUser.do">회원정보</a></li>

					</ul>
					</div>
				</div>
			</div>	
	
	<div class="listTable">
	<table class="mobileTable tablet">

		<thead>
			<tr>
				<th scope="row" class="footable-first-column">No.</th>

				<th scope="row" data-class="expand">도서명</th>

				<th scope="row" data-class="expand">저자</th>

				<th scope="row" data-class="expand">등록번호</th>
				<th scope="row" data-class="expand">대여일</th>
			
				<th scope="row" data-hide="phone" class="footable-last-column" style="display: table-cell;">반납일</th>

			</tr>
		</thead>
		<tbody>

			<c:forEach items="${rentHistoryList}" var="rent" varStatus="status">

				<tr>
					<td class="num footable-first-column">${status.count}</td>

					<td class="bookTitle"><a href="/lib/bookDetail.do?bookCode=${rent.bookCode}">${rent.bookTitle}</a></td>
					
					<td class="author" style="display: table-cell;">${rent.author}</td>
					<td class="bookNo" style="display: table-cell;">${rent.bookNo}</td>
					<td class="rentDate" style="display: table-cell;">${rent.rentDate}</td>
				    
					<td class="footable-last-column"  style="display: table-cell;">${rent.returnDate}</td>
					
				</tr>

			</c:forEach>

	</tbody>
	</table>
	
	</div>
	</div>
</div>			
			<div class="paging">
												
													<span> 
													
														<c:if test="${paging.prev == true }">
															<a href="/lib/rentHistory.do?page=1" class="page" >
															<img src="webimg/firstPage.gif">
															</a>
														</c:if> 
													
													
														<c:if test="${paging.prev == true }">
															<a href="/lib/rentHistory.do?page=${paging.pageSize}&range=${paging.range-paging.pageSize}" class="page" >
															<img src="webimg/prevPage.gif">
															</a>
														</c:if> 
														
														<c:forEach begin="1" end="${paging.pageSize }" varStatus="page" >
														
															<c:choose>
																
																<c:when test="${paging.page+paging.range == page.count+paging.range}">
																	<span>${paging.page+paging.range}</span>
																</c:when>
																
																<c:when test="${page.count+paging.range <= paging.pageCnt}">
																	<a href="/lib/rentHistory.do?page=${page.count}&range=${paging.range}">
																	${page.count+paging.range}</a>
																</c:when>
																
																<c:otherwise>
																<%-- 공백처리 --%>
																</c:otherwise>
																
																
															</c:choose>
															
														</c:forEach>
														
														<c:if test="${paging.next == true }">
															<a href="/lib/rentHistory.do?page=1&range=${paging.range+paging.pageSize}" class="page" > 
															<img src="webimg/nextPage.gif">
															</a>
														</c:if> 
														
														<c:if test="${paging.next == true }">
															<a href="/lib/rentHistory.do?page=${paging.pageCnt%paging.pageSize }
															&range=${paging.pageCnt-paging.pageCnt%paging.pageSize}" class="page" > 
															<img src="webimg/lastPage.gif">
															</a>
														</c:if> 

													</span>
												</div>
			
			
			
		
	
<jsp:include page="/WEB-INF/views/bot.jsp" flush="false" />

	
</body>
</html>