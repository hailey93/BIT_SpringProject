<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="description" content="비트 도서관">
<meta name="keyword" content="비트 도서관 , 도서관, 도서검색">
<meta name="copyright"
	content="COPYRIGHT(C) NOWON LIBRARY. ALL RIGHTS RESERVED.">
<meta content="initial-scale=1, width=device-width" name="viewport">

<title>비트 도서관</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/sub.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/brief.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css" />

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common.css" />



</head>

<body>
	<div class="headerBtm">
		<div>
			<h2 class="logo">
				<a href="/lib/main" title="비트 도서관"> <img
					src="webimg/bitlogo.png" />
				</a>
			</h2>
			<div id="globalMenu">
				<ul>
					<li><a href="wishList.do" title="마이페이지">마이페이지</a></li>

					<li><a href="" title="로그아웃">로그아웃</a></li>

				</ul>
			</div>
			<div id="divSearch">
				<form action="mainSearch" method="get" id="mainSearch">
					<!-- 검색어 넘겨주기 -->
					<fieldset>
						<legend>검색</legend>
						<div class="search">
							<p class="searchBox">
								<input type="text" class="searchInput" id="keyWord"
									value="${keyWord}" name="keyWord" title="검색어를 입력하세요."
									placeholder="검색어를 입력하세요."> <input type="image"
									class="searchBtn" src="webimg/btnSrch.png" alt="검색" title="검색">
							</p>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
<div>
	<article>
	<div class="block">
		<div id="divContentsW" style="margin-top: 100px;">
			<div id="divContents">
				<!-- content -->
				<div id="divContent">

					<div class="searchBrief">

						<div class="searchWords">
							<dl class="searchKeyword">
								<dt>검색어</dt>
								<dd>
									<span class="keyword">[키워드/ ${keyWord} ]</span>

								</dd>

							</dl>

							<ul class="selectedFacet"></ul>

						</div>
						<div class="briefContent">
							<div class="facet"></div>
							<!-- //facet -->

							<div class="result">
								<div class="resultHeader">

									<p class="searchCnt">
										총<strong>458</strong>건 중 <strong>458</strong>건 출력
									</p>
								</div>
								<form name="briefFrm" method="post"
									action="https://www.nowonlib.kr/search/brief/service"
									onsubmit="return checked(this);">
									<fieldset>
										<legend>Service Form</legend>
										<input type="hidden" name="webSysdiv" value="TOT"> <input
											type="hidden" name="popupYn" value="N"> <input
											type="hidden" name="mainLink" value="/search/tot">

										<ul class="resultList resultDetail">
											<li id="item_CATTOT000000032948" class="items">
												<dl>
													<dt class="title">No</dt>

													<dd class="num">1.</dd>
													<dt class="title">표지이미지</dt>
													<dd class="book">
														<a
															href="https://www.nowonlib.kr/search/detail/CATTOT000000032948?mainLink=/search/tot&amp;briefLink=/search/tot/result?st=KWRD_A_q=code_A_si=TOTAL_A_x=0_A_y=0">

															<img id="bookImg_CATTOT000000032948" src="" width="75"
															height="103" alt="(The)Da Vinci code" onerror="">
														</a>

													</dd>

													<dt class="title">제목</dt>

													<dd class="title">
														<a
															href="https://www.nowonlib.kr/search/detail/CATTOT000000032948?mainLink=/search/tot&amp;briefLink=/search/tot/result?st=KWRD_A_q=code_A_si=TOTAL_A_x=0_A_y=0">(The)Da
															Vinci <span class="hilight">code</span>
														</a> <input type="button" class="addItem btnType2"
															onclick="addItem(&#39;data=CAT000000032948&#39;);"
															title="추가" value="추가" style="display: none;"> <span
															class="bookLending"> <strong>7</strong>회 대출
														</span>
													</dd>

													<dt class="title">저자</dt>

													<dd class="info">Brown, Dan</dd>

													<dt class="title">출판사</dt>

													<dd class="info">Doubleday</dd>

													<dt class="title">청구기호</dt>

													<dd class="info">843 B877d</dd>

													<dt class="title">출판년</dt>

													<dd class="info">2000</dd>

													<dt class="title">ISBN</dt>

													<dd class="info">0385513224</dd>

													<dt class="title">자료유형</dt>
													<dd class="type info">

														<img alt=""
															src="./[키워드_ 전체_code] 검색결과 _ 노원구 구립도서관_files/type_m.png">
														단행본

													</dd>
													<dt class="title">매체정보</dt>
													<dd class="media"></dd>
													<dt class="title">미리보기</dt>
													<dd class="preview">
														<div id="prevDetail_CATTOT000000032948" class="detailInfo"
															style="display: none;"></div>
													</dd>
													<dt class="title">소장현황</dt>
													<dd class="holdingInfo">
														<div class="holding">

															<p class="location">

																<span>대출가능</span>
															</p>
														</div>
													</dd>
												</dl>
											</li>
										</ul>

										<div class="paging">
											<span> <span>1</span> <a
												href="https://www.nowonlib.kr/search/tot/result?pn=2&amp;st=KWRD&amp;q=code&amp;si=TOTAL&amp;x=0&amp;y=0">2</a>
												<a
												href="https://www.nowonlib.kr/search/tot/result?pn=3&amp;st=KWRD&amp;q=code&amp;si=TOTAL&amp;x=0&amp;y=0">3</a>
												<a
												href="https://www.nowonlib.kr/search/tot/result?pn=4&amp;st=KWRD&amp;q=code&amp;si=TOTAL&amp;x=0&amp;y=0">4</a>
												<a
												href="https://www.nowonlib.kr/search/tot/result?pn=5&amp;st=KWRD&amp;q=code&amp;si=TOTAL&amp;x=0&amp;y=0">5</a>
											</span>
										</div>

									</fieldset>
								</form>
							</div>
							<!-- //resultInfo -->
						</div>
					</div>
					<!-- //brief -->

				</div>
			</div>
		</div>
		</div>
	</article>
</div>
	<jsp:include page="../bot.jsp" flush="false" />


</body>

</html>