<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="mfn" uri="/WEB-INF/mfn.tld"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,  maximum-scale=1.0, minimum-scale=1.0" />
    <title>写字楼资讯列表</title>
    <link rel="apple-touch-icon" href="${staticurl}/images/touch-icon-iphone.png" />
    <link rel="apple-touch-icon" sizes="114x114" href="${staticurl}/images/touch-icon-iphone-retina.png" />
    <link rel="apple-touch-icon" sizes="144x144" href="${staticurl}/images/touch-icon-ipad-retina.png" />
    <link href="${staticurl}/images/favicon.ico" type="image/x-icon" rel="icon">
    <link type="text/css" rel="stylesheet" href="${staticurl}/css/materialize.min.css" media="screen,projection" />
    <link rel="stylesheet" href="${staticurl}/css/animsition.min.css">
    <link rel="stylesheet" href="${staticurl}/css/common.css">
    <link rel="stylesheet" href="${staticurl}/css/waphouse_list.css">
    <!-- <script src="http://10.58.1.96:5580/target/target-script-min.js#anonymous"></script> -->
</head>
<body>
<header class="page-topnav">
    <nav>
        <div class="nav-wrapper">
            <ul id="nav-mobile" class="right side-nav">
                <li class="user-details">
                    <div class="container row">
                        <div class="col s4 ">
                            <a href="https://passport.centanet.com/login?route=%2F" class="btn-floating btn-large btn-user "><i class="material-icons">perm_identity</i></a>
                        </div>
                        <div class="col s8 no-padding">
                            <a href="" class="white-text">登录</a>
                        </div>
                    </div>
                </li>
                <li class="bold">
                    <a href="https://wap.centanet.com/bj/" class="waves-effect "><i class="material-icons">account_balance</i>首页</a>
                </li>
                <li class="bold">
                    <a href="https://wap.centanet.com/bj/ershoufang" class="waves-effect "><i class="material-icons">domain</i>二手房</a>
                </li>
                <li class="bold">
                    <a href="https://wap.centanet.com/bj/zufang/" class="waves-effect "><i class="material-icons">store_mall_directory</i>租房</a>
                </li>
                <li class="bold">
                    <a href="https://wap.centanet.com/bj/xingfang/" class="waves-effect "><i class="material-icons">location_city</i>新房</a>
                </li>
                <li class="bold">
                    <a href="https://wap.centanet.com/bj/xuexiao/"><i class="material-icons">school</i>学校找房</a>
                </li>
                <li class="bold">
                    <a href="https://wap.centanet.com/bj/xiaoqu/"><i class="material-icons">home</i>找小区</a>
                </li>
               <%-- <li class="bold">
                    <a href="https://wap.centanet.com/applink/?fwap"><i class="material-icons">file_download</i>下载APP</a>
                </li>--%>
            </ul>
            <a href="#!" class="button-collapse" data-activates="nav-mobile" onclick="Materialize.showStaggeredList('#nav-mobile')"><i class="material-icons" >menu</i></a>

            <c:choose>
                <c:when test="${cityen == 'sz' || cityen == 'gz'}">
                    <a href="//m.${cityen}.centanet.com/search?type=7" class="right right-icon">
                </c:when>
                <c:otherwise>
                    <a href="//wap.centanet.com/${cityen}/page/common/search.aspx?type=7" class="right right-icon">
                </c:otherwise>
            </c:choose>

                <i class="material-icons" >search</i></a>
            <p class="topTitletxt" style="background-color: red;">商业头条</p>
        </div>
    </nav>
</header>

<div id="page_index">
    <div class="page_inner white">
        <section id="refresh" class="more_area more_area_list" style="display:none;">下拉刷新</section>
        <section class="houseListWrapper newsList" id="lists_con">
            <ul class="house-list">
                <c:forEach items="${news}" var="item">
                    <li class="house-list-item btbom">
                        <a href="/m/${cityen}/xzl/detail/${item.ID}.html" class="animsition-link houselink" data-animsition-out="fade-out-left-lg">
                            <div class="house-img news-img">
                                <c:set var="defaultpic" value="https://static.centanet.com/v7p20415/images/error/220x165_loading.gif?v202005111"></c:set>
                                <c:choose>
                                    <c:when test="${item.LitPic != null && item.LitPic.length() >= 10}">
                                        <img class="lazy"
                                             src="${defaultpic}"
                                             data-original="${fn:substring(item.LitPic, 0 , mfn:lastIndexOf(item.LitPic, "."))}_180x130_c${fn:substring(item.LitPic,mfn:lastIndexOf(item.LitPic, ".") , fn:length(item.LitPic))}"
                                             alt="${item.Title}">
                                    </c:when>
                                    <c:otherwise>
                                        <img class="lazy"
                                             src="${defaultpic}"
                                             data-original="${defaultpic}"
                                             alt="${item.Title}">
                                    </c:otherwise>
                                </c:choose>

                            </div>
                            <div class="house-title news-title">
                                <h2 class="fs15">${item.Title}</h2>
                                <p class="date f666"><span class="mr6 left">${item.TypeName}</span><span class="mr6 right">
                                     <jsp:useBean id="myDate" class="java.util.Date"/>
                                    <c:set target="${myDate}" property="time" value="${item.PublishDate*1000}"/>
                                    <fmt:formatDate pattern="yyyy-MM-dd" value="${myDate}" type="both"/>
                                </span></p>
                            </div>
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </section>
        <section id="more" class="more_area more_area_list" data_more_list="true" style="display: none;"> <span>正在加载...</span> </section>
    </div>
</div>
<script type="text/javascript" src="${staticurl}/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${staticurl}/js/materialize.min.js"></script>
<script src="${staticurl}/js/jquery.lazyload.min.js" type="text/javascript" language="javascript"></script>
<script type="text/javascript" src="${staticurl}/js/iscroll-probe.js"></script>
<script>
    $(function() {
        $(".button-collapse").sideNav();
        //图片延迟加载
        $("img.lazy").lazyload({effect: "fadeIn"});

    });
</script>
<%--统计代码--%>
<%@include file="/WEB-INF/views/statistics_code.jsp" %>
</body>
</html>
