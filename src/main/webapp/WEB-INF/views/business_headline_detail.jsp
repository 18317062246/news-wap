
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="mfn" uri="/WEB-INF/mfn.tld"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,  maximum-scale=1.0, minimum-scale=1.0" />
    <title>${detail.Title}</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <link rel="apple-touch-icon" href="${staticurl}/images/touch-icon-iphone.png" />
    <link rel="apple-touch-icon" sizes="114x114" href="${staticurl}/images/touch-icon-iphone-retina.png" />
    <link rel="apple-touch-icon" sizes="144x144" href="${staticurl}/images/touch-icon-ipad-retina.png" />
    <link href="${staticurl}/images/favicon.ico" type="image/x-icon" rel="icon">
    <link type="text/css" rel="stylesheet" href="${staticurl}/css/materialize.min.css" media="screen,projection" />
    <link rel="stylesheet" href="${staticurl}/css/common.css">
    <link rel="stylesheet" href="${staticurl}/css/waphouse_detail.css">
    <style type="text/css">
        .row img ,body {
            width :100% !important;
            border:none;
        }
    </style>
</head>
<body>
<header class="page-topnav">
    <nav>
        <div class="nav-wrapper">
            <a href="#!" class="button-collapse" data-activates="nav-mobile" onclick="Materialize.showStaggeredList('#nav-mobile')"><i class="material-icons">menu</i></a>
            <c:choose>
                <c:when test="${cityen == 'sz' || cityen == 'gz'}">
                    <a href="//m.${cityen}.centanet.com/search?type=7" class="right right-icon">
                </c:when>
                <c:otherwise>
                    <a href="//wap.centanet.com/${cityen}/page/common/search.aspx?type=7" class="right right-icon">
                </c:otherwise>
            </c:choose>
                <i class="material-icons" >search</i></a>
            <p class="topTitletxt" style="background-color: red;">商业头条详情</p>
        </div>
    </nav>
</header>
<div class="row">
    <header class="news-title totile fs15 col s12">${detail.Title}</header>
    <div class="sub-title clearfix col s12"><span class="date left fs13">
            <jsp:useBean id="detailDate" class="java.util.Date"/>
            <c:set target="${detailDate}" property="time" value="${detail.PublishDate*1000}"/>
            <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${detailDate}" type="both"/>
    </span><span class="source right fs13">来源：${detail.Sources}</span></div>
    ${detailContent}
</div>
<section class="houseblock">
    <div class="row">
        <div class="col s12">
            <div class="card">
                <p class="card-title f666 "><a href="/m/${cityen}/xzl/list/" class="f666 row waves-effect waves-cyan"><span class="col s9">热门排行</span><span class="col s3"><i class="material-icons right">keyboard_arrow_right</i></span></a></p>
                <div class="divider"></div>
                <div class="f999 card-txt ">
                    <ul class="hot-rank">
                        <c:forEach items="${news}" var="item">
                            <li>
                                <i class="order"></i>
                                <a href="/m/${cityen}/xzl/detail/${item.ID}.html" >
                                    <p class="truncate">${item.Title}</p>
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
<script type="text/javascript" src="${staticurl}/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${staticurl}/js/materialize.min.js"></script>
<script src="${staticurl}/js/jquery.lazyload.min.js" type="text/javascript" language="javascript"></script>
<script>
    $(function() {
        $(".button-collapse").sideNav();
    });
</script>
<script type="text/javascript">
    /**
     * 以下代码是判断是人还是蜘蛛
     */
        //获取当前进入页面的地址
    let r = document.referrer;
    r = r.toLowerCase(); //转为小写
    let aSites = new Array('google.','baidu.','soso.','so.','360.','yahoo.','youdao.','sogou.','gougou.');
    let flag = false;
    for (i in aSites){
        if (r.indexOf(aSites[i]) > 0){
            flag = true;
            break;
        }
    }


    //如果flag为false，证明是人，需要给页面加入访问量
    if(!flag){
        let locationAddress = window.location;
        $.get(
            "https://news.centanet.com/api/NewsAddToVisit?newsid=${newsId}&cityen=${cityen}&url="+locationAddress+"&platform=pc",
            function (data) {
            });
    }

</script>
<%--统计代码--%>
<%@include file="/WEB-INF/views/statistics_code.jsp" %>
</body>
</html>
