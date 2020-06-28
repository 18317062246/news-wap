<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="mfn" uri="/WEB-INF/mfn.tld"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,  maximum-scale=1.0, minimum-scale=1.0"/>
    <title>热门专题</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <link rel="apple-touch-icon" href="images/touch-icon-iphone.png"/>
    <link rel="apple-touch-icon" sizes="114x114" href="images/touch-icon-iphone-retina.png"/>
    <link rel="apple-touch-icon" sizes="144x144" href="images/touch-icon-ipad-retina.png"/>
    <link rel="icon" href="${staticurl}/images/favicon.ico" type="image/x-icon"/>
    <link type="text/css" rel="stylesheet" href="${staticurl}/css/materialize.min.css" media="screen,projection"/>
    <link rel="stylesheet" href="${staticurl}/css/font.css">
    <link rel="stylesheet" href="${staticurl}/iconfont/iconfont.css">
    <link rel="stylesheet" href="${staticurl}/css/common.css">
    <link rel="stylesheet" href="${staticurl}/css/news_common.css">
    <link rel="stylesheet" href="${staticurl}/css/zixun_detail.css">
    <script type="text/javascript" src="${staticurl}/js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="${staticurl}/js/jquery.lazyload.min.js" language="javascript"></script>
</head>

<body>
<%--<div class="download-app" id="downloadApp">
    <div class="centa-logo">
        <img src="https://static.centanet.com/wap/main/img/download.png" class="logo-icon">
    </div>
    <div class="content">
        <h4>下载中原找房APP</h4>
        <p class="desc">地图找房，与经纪人在线直聊！</p>
    </div>
    <div class="download-btn">
        <a href="javascript:0" class="down-a">立即打开</a>
    </div>
</div>--%>
<div class="search-new">
    <div class="search-wrapper">
        <a href="/m/${cityen}/" class="goback">
            <sapn class="search-title">中原资讯</sapn>
        </a>
        <c:if test="${cityen == 'sz'}">
            <a href="//m.${cityen}.centanet.com/search?type=7" class="search-a">
                <div class="search-box"><i class="icon-sousuo iconfont"></i>请输入资讯标题或内容</div>
            </a>
        </c:if>
        <c:if test="${cityen != 'sz'}">
            <a href="//wap.centanet.com/${cityen}/page/common/search.aspx?type=7" class="search-a">
                <div class="search-box"><i class="icon-sousuo iconfont"></i>请输入资讯标题或内容</div>
            </a>
        </c:if>
    </div>
</div>
<div>
    <div class="wrapper">
        <ul class="news-tab" style="width: 593px;">
            <input type="hidden" id="tabtype" value="${tabtype}"/>
            <c:forEach items="${types}" var="type" varStatus="status" begin="0" end="6">
                    <li class="tab" ref="${type.id}"><a href="/m/${cityen}/list/c${type.id}/">${type.columnsName}</a></li>
            </c:forEach>
        </ul>
    </div>
</div>
<div class="news-project-list">
    <ul class="project-list">
        <c:forEach items="${news}" var="item">
            <li class="item type${item.TypeID}">
                <a class="item-a" href="/m/${cityen}/detail/${item.ID}.html">
                    <div class="img-box">
                        <%--<img src="${item.LitPic}">--%>
                        <c:set var="defaultpic" value="https://static.centanet.com/v7p20415/images/error/220x165_loading.gif?v202005111"></c:set>
                        <img class="lazy" src="${fn:substring(item.LitPic, 0 , mfn:lastIndexOf(item.LitPic, "."))}_1000x700_c${fn:substring(item.LitPic,mfn:lastIndexOf(item.LitPic, ".") , fn:length(item.LitPic))}"
                             data-original="${fn:substring(item.LitPic, 0 , mfn:lastIndexOf(item.LitPic, "."))}_1000x700_c${fn:substring(item.LitPic,mfn:lastIndexOf(item.LitPic, ".") , fn:length(item.LitPic))}" alt="${item.Title}" onerror="this.src='${defaultpic}'"/>
                    </div>
                    <div class="content">
                        <h4 class="title">${item.Title}</h4>
                        <div class="desc">
                            <span class="txt">${item.TypeName}</span>
                            <span><%--${item.PublishDate}--%>
                             <jsp:useBean id="myDate" class="java.util.Date"/>
                                <c:set target="${myDate}" property="time" value="${item.PublishDate*1000}"/>
                                <fmt:formatDate pattern="yyyy-MM-dd" value="${myDate}" type="both"/>
                            </span>
                        </div>
                    </div>
                </a>
            </li>
        </c:forEach>
    </ul>
</div>
<div class="news-project-list">
    <ul class="project-list" id="project_list">

    </ul>
</div>

<%--<script type="text/javascript" src="${staticurl}/js/jquery-2.1.4.min.js"></script>--%>
<script type="text/javascript" src="${staticurl}/js/materialize.min.js"></script>
<script type="text/javascript" src="${staticurl}/js/iscroll-probe.js"></script>
<%--<script type="text/javascript" src="${staticurl}/js/jquery.lazyload.js" language="javascript"></script>--%>
<script src="${staticurl}/js/bscroll.min.js"></script>
<script>
    $(function () {
        let sumWidth = 0;
        $(".news-tab").children("li").each(function (item, index) {
            sumWidth += $(this).width() + 36;
            $(this).on("click", function () {
                $(".news-tab").find(".active").removeClass("active");
                $(this).children("a").addClass("active");
                //切换分类文章
                let typeid = $(this).children("a").attr('ref');
                $('.new-list .item').hide().filter('.type' + typeid).show();
            });
        });
        $(".news-tab").width(sumWidth + 18);
        //上一次点击的tab加红色样式
        let index = $("#tabtype").val();
        $(".news-tab  li[ref=" + index + "]").find('a').addClass("active").parent().siblings().children("a").removeClass("active");
        //图片延迟加载
        $("img.lazy").lazyload({effect: "fadeIn"});
    });
    let wrapper = document.querySelector('.wrapper')
    let scroll = new BScroll(wrapper, {
        scrollX: true,
        click: true,
        startX: 0
    })
</script>
</body>
<%--统计代码--%>
<%@include file="/WEB-INF/views/statistics_code.jsp" %>

</html>