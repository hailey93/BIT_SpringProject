<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta name="description" content="비트 도서관">
        <meta name="keyword" content="비트 도서관 , 도서관, 도서검색">
        <meta
            name="copyright"
            content="COPYRIGHT(C) NOWON LIBRARY. ALL RIGHTS RESERVED.">
        <meta content="initial-scale=1, width=device-width" name="viewport">
        <title>비트 도서관</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sub.css">
        <link
            rel="stylesheet"
            type="text/css"
            href="${pageContext.request.contextPath}/css/list.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/brief.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/basket.css">
        <link
            rel="stylesheet"
            href="${pageContext.request.contextPath}/css/jquery-ui.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Nwagon.css">
        <link
            rel="stylesheet"
            href="${pageContext.request.contextPath}/css/toastr.min.css">
        <link
            rel="stylesheet"
            href="${pageContext.request.contextPath}/css/mobiletable.css"
            media="screen and (max-width:767px)">
        <link
            rel="stylesheet"
            href="${pageContext.request.contextPath}/css/sub(1).css"
            media="screen and (min-width:768px) and (max-width:1024px)">
        <link
            rel="stylesheet"
            href="${pageContext.request.contextPath}/css/sub(2).css"
            media="screen and (max-width:767px)">
        <link
            rel="stylesheet"
            type="text/css"
            href="${pageContext.request.contextPath}/css/mobiletable.css"
            media="screen and (max-width:767px)">
        <link
            rel="stylesheet"
            href="${pageContext.request.contextPath}/css/mThumbnailScroller.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css"/>
        <link
            rel="stylesheet"
            href="${pageContext.request.contextPath}/css/main(1).css"
            media="screen and (min-width:768px) and (max-width:1024px)">
        <link
            rel="stylesheet"
            href="${pageContext.request.contextPath}/css/main(2).css"
            media="screen and (max-width:767px)">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/slick.css">
        <link
            rel="stylesheet"
            type="text/css"
            href="${pageContext.request.contextPath}/css/common.css"/>

    </head>

    <body>

        <div id="divHeader">
            <!--header-->

            <div class="headerBtm">
                <div>
                    <h2 class="logo">
                        <a href="/lib/main" title="비트 도서관">
                            <img src="${pageContext.request.contextPath}/img/webimg/bitlogo.png"/>
                        </a>
                    </h2>
                    <div id="globalMenu">
                        <ul>
                            <li>
                                <a href="wishList.do" title="마이페이지">마이페이지</a>
                            </li>

                            <li>
                                <a href="" title="로그아웃">로그아웃</a>
                            </li>

                        </ul>
                    </div>
                    <div id="divSearch">
                        <form action="mainSearch" method="get" id="mainSearch">
                            <!-- 검색어 넘겨주기 -->
                            <fieldset>
                                <legend>검색</legend>
                                <div class="search">
                                    <p class="searchBox">
                                        <input
                                            type="text"
                                            class="searchInput"
                                            id="keyWord"
                                            name="keyWord"
                                            title="검색어를 입력하세요."
                                            placeholder="검색어를 입력하세요.">
                                        <input
                                            type="image"
                                            class="searchBtn"
                                            src="${pageContext.request.contextPath}/img/webimg/btnSrch.png"
                                            alt="검색"
                                            title="검색"></p>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div id="divContentsW">
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
                                        총<strong>458</strong>건 중
                                        <strong>458</strong>건 출력
                                    </p>
                                </div>
                                <form
                                    name="briefFrm"
                                    method="post"
                                    action="https://www.nowonlib.kr/search/brief/service"
                                    onsubmit="return checked(this);">
                                    <fieldset>
                                        <legend>Service Form</legend>
                                        <input type="hidden" name="webSysdiv" value="TOT">
                                        <input type="hidden" name="popupYn" value="N">
                                        <input type="hidden" name="mainLink" value="/search/tot">

                                        <ul class="resultList resultDetail">
                                            <li id="item_CATTOT000000032948" class="items">
                                                <dl>
                                                    <dt class="title">No</dt>

                                                    <dd class="num">1.</dd>
                                                    <dt class="title">표지이미지</dt>
                                                    <dd class="book">
                                                        <a
                                                            href="https://www.nowonlib.kr/search/detail/CATTOT000000032948?mainLink=/search/tot&amp;briefLink=/search/tot/result?st=KWRD_A_q=code_A_si=TOTAL_A_x=0_A_y=0">

                                                            <img
                                                                id="bookImg_CATTOT000000032948"
                                                                src=""
                                                                width="75"
                                                                height="103"
                                                                alt="(The)Da Vinci code"
                                                                onerror=""></a>

                                                    </dd>

                                                    <dt class="title">제목</dt>

                                                    <dd class="title">
                                                        <a
                                                            href="https://www.nowonlib.kr/search/detail/CATTOT000000032948?mainLink=/search/tot&amp;briefLink=/search/tot/result?st=KWRD_A_q=code_A_si=TOTAL_A_x=0_A_y=0">(The)Da Vinci
                                                            <span class="hilight">code</span>
                                                        </a>
                                                        <input
                                                            type="button"
                                                            class="addItem btnType2"
                                                            onclick="addItem(&#39;data=CAT000000032948&#39;);"
                                                            title="추가"
                                                            value="추가"
                                                            style="display: none;">
                                                        <span class="bookLending">
                                                            <strong>7</strong>회 대출
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

                                                        <img alt="" src="./[키워드_ 전체_code] 검색결과 _ 노원구 구립도서관_files/type_m.png">
                                                        단행본

                                                    </dd>
                                                    <dt class="title">매체정보</dt>
                                                    <dd class="media"></dd>
                                                    <dt class="title">미리보기</dt>
                                                    <dd class="preview">
                                                        <div
                                                            id="prevDetail_CATTOT000000032948"
                                                            class="detailInfo"
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
                                            <span>
                                                <span>1</span>
                                                <a
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

        <div id="divFooter">

            <!-- //배너모음 -->
            <div class="footer">
                <div>
                    <div class="footerInfo">
                        <ul>
                            <li>· 노원정보도서관
                                <span class="hide">
                                    :
                                </span>
                                <span class="block">서울특별시 노원구 노원로34길 43(상계동) Tel)02-950-0050</span>
                            </li>
                            <li>· 노원어린이도서관
                                <span class="hide">
                                    :
                                </span>
                                <span class="block">서울특별시 노원구 한글비석로 346(중계동) Tel)02-933-7145</span>
                            </li>
                            <li>· 월계문화정보도서관
                                <span class="hide">:
                                </span>
                                <span class="block">서울특별시 노원구 월계로 319(월계동) Tel)02-991-0871</span>
                            </li>
                            <li>· 상계문화정보도서관
                                <span class="hide">:
                                </span>
                                <span class="block">서울특별시 노원구 동일로 243길 57(상계동) Tel)02-3391-7882</span>
                            </li>
                            <li>· 노원휴먼라이브러리
                                <span class="hide">:
                                </span>
                                <span class="block">서울특별시 노원구 노원로 34길 43(상계동) Tel)02-950-0041</span>
                            </li>
                            <li>· 불암도서관
                                <span class="hide">:
                                </span>
                                <span class="block">서울특별시 노원구 중계로 106(중계동) Tel)02-935-0721</span>
                            </li>
                            <li>· 공릉청소년문화정보센터 화랑도서관
                                <span class="hide">:
                                </span>
                                <span class="block">서울특별시 노원구 노원로1나길10(공릉동) Tel)02-973-1318</span>
                            </li>
                        </ul>
                    </div>
                    <p class="copyright">COPYRIGHT©NOWON LIBRARY. ALL RIGHTS RESERVED.</p>
                </div>
                <a
                    href="https://www.nowonlib.kr/search/tot/result?si=TOTAL&amp;st=KWRD&amp;q=code&amp;x=0&amp;y=0#"
                    class="btnTop">페이지 맨 위로 이동</a>
            </div>
            <!-- //divFooter -->
        </div>

    </body>

</html>