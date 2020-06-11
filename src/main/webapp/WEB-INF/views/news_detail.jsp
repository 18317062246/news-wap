<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,  maximum-scale=1.0, minimum-scale=1.0"/>
    <title>资讯详情</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <link rel="apple-touch-icon" href="images/touch-icon-iphone.png"/>
    <link rel="apple-touch-icon" sizes="114x114" href="images/touch-icon-iphone-retina.png"/>
    <link rel="apple-touch-icon" sizes="144x144" href="images/touch-icon-ipad-retina.png"/>
    <link href="images/favicon.ico" type="image/x-icon" rel="icon">
    <link type="text/css" rel="stylesheet" href="${staticurl}/css/materialize.min.css" media="screen,projection"/>
    <link rel="stylesheet" href="${staticurl}/css/font.css?v=${ver}">
    <link rel="stylesheet" href="${staticurl}/iconfont/iconfont.css?v=${ver}">
    <link rel="stylesheet" href="${staticurl}/css/common.css?v=${ver}">
    <link rel="stylesheet" href="${staticurl}/css/newsCommon.css?v=${ver}">
    <link rel="stylesheet" href="${staticurl}/css/zixunDetail.css?v=${ver}">
    <style>
        img{
            width: 100% !important;
        }
    </style>
</head>

<body>
<div class="download-app" id="downloadApp">
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
</div>
<div class="search-new">
    <a href="//wap.centanet.com/${cityen}/page/common/search.aspx?type=7" class="search-a">
        <sapn class="search-title" style="font-size: 10px;">中原资讯</sapn>
        <div class="search-box"><i class="icon-sousuo iconfont"></i>请输入资讯标题或内容</div>
    </a>
</div>
<div class="newdetail-wrapper">
    <h3 class="new-title">${detail.Title}</h3>
    <div class="new-source">
        <span>${detail.Sources}</span>
        <span class="time"><%--${detail.PublishDate}--%>
            <jsp:useBean id="detailDate" class="java.util.Date"/>
            <c:set target="${detailDate}" property="time" value="${detail.PublishDate*1000}"/>
            <fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${detailDate}" type="both"/>
        </span>
    </div>
   <%-- <div class="new-main-img">
        <img src="${detail.LitPic}" class="responsive-img" alt="">
    </div>--%>
    <div>
        <p class="new-content">
            ${detail.Content}
        </p>
    </div>
</div>
<%--<p class="new-disclaimer">
    免责声明：本文仅代表作者个人观点，与环球网无关。其原创性以及文中陈述文字和内容未经本站证实，对本文以及其中全部或者部分内容、文字的真实性、完整性、及时性本站不作任何保证或承诺，请读者仅作参考，并请自行核实相关内容。
</p>--%>
<section class="new-houseblock">
    <h3 class="hot">热点排行</h3>
    <ul class="new-list">
        <c:forEach items="${news}" var="n">
            <li class="item">
                <a href="/m/${cityen}/detail/${n.ID}.html" class="item-a">
                    <div class="new-main">
                        <h4 class="title">${n.Title}</h4>
                        <div class="desc">
                            <span>全国楼市</span>
                            <span class="time">
                                <jsp:useBean id="myDate" class="java.util.Date"/>
                                <c:set target="${myDate}" property="time" value="${n.PublishDate*1000}"/>
                                <fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${myDate}" type="both"/>
                            </span>
                        </div>
                    </div>
                    <div class="new-img">
                       <%-- <img src="${n.LitPic}">--%>
                        <c:set var="defaultpic" value="https://static.centanet.com/v7p20415/images/error/220x165_loading.gif?v202005111"></c:set>
                        <img class="lazy" src="${n.LitPic}?x-oss-process=style/180x130"
                             data-original="${n.LitPic}?x-oss-process=style/180x130" alt="${item.Title}" onerror="this.src='${defaultpic}'"/>
                    </div>
                </a>
            </li>
        </c:forEach>
    </ul>
</section>
<div class="referBroker" id="jingjirenInfo">
    <div class="referImg left">
        <img src="" alt="" id="agentImg">
    </div>
    <div class="referCon left">
        <span class="fs14" id="agentName"></span>
        <span class="tel" id="telCode"></span>
    </div>
    <div class="referTel right"><a id="talk" href="#" style="color: #fff;">打电话</a></div>
</div>
<%--统计代码--%>
<%@include file="/WEB-INF/views/statistics_code.jsp" %>
<script type="text/javascript" src="${staticurl}/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${staticurl}/js/materialize.min.js"></script>
<script src="${staticurl}/js/jquery.lazyload.js" type="text/javascript" language="javascript"></script>
<script type="text/javascript">

    $(function () {
        //图片延迟加载
        $("img.lazy").lazyload({effect: "fadeIn"});
    });
    var searchStr = location.search;
    if (searchStr.indexOf("staffNo") > 0) {
        //由于searchStr属性值包括“?”，所以除去该字符
        searchStr = searchStr.substr(9);
        if (searchStr.indexOf("&") > 0) {
            var str = searchStr.split('&');
            searchStr = str[0];
        }
        $.ajax({
            type: "GET",
            async: false,
            url: "https://mobileapi.centanet.com/v6/json/reply/StaffRequest?StaffNo=" + searchStr + "&cityen=${cityen}&platform=wap",
            /* data: {
                 StaffNo: searchStr,
                 cityen:cityShort,
                 platform: "wap"
             },*/
            success: function (data) {
                if (data.ResultNo == 0) {
                    $("#AplusShare").show();
                    $(".download-app").show();
                    $("#StaffName").html(data.Result.CnName);
                    $("#ThumbImage").attr("src", data.Result.StaffImg);
                    var telstr = data.Result.Staff400Tel;
                    var bigCode = "";
                    var extCode = "";
                    if (telstr != undefined && telstr != "" && telstr != null) {
                        var tel = telstr.split(",");
                        bigCode = tel[0];
                        extCode = tel[1];
                    }
                    /*  $("#telCode").html(bigCode + "转" + extCode);
                      $("#agentDetail").attr("href", "//m.gz.centanet.com/jingjiren/esf-" + data.Result.StaffNo + "/");
                      $("#agentImg").attr("src", data.Result.StaffImg);
                      $("#agentTel").html(bigCode + "转" + extCode);
                      $("#Tel").attr("href", "tel:" + bigCode + "," + extCode);
                      $("#AgentName").html(data.Result.CnName);
                      $("#Talk").attr("href", "tel:" + bigCode + "," + extCode);*/
                    $("#telCode").html(bigCode + "转" + extCode);
                    $("#agentName").html(data.Result.CnName);
                    $("#agentImg").attr("src", data.Result.StaffImg);
                    $("#talk").attr("href", "tel:" + bigCode + "," + extCode);
                }else {
                    $("#jingjirenInfo").css('display','none');//隐藏底部
                    $("#downloadApp").css('display','none');//隐藏头部
                }
            }
        });
    }else {
        $("#jingjirenInfo").css('display','none');//隐藏底部
        $("#downloadApp").css('display','none');//隐藏头部
    }
</script>
<script>
    $(function () {

        /*获取地址栏指定参数*/
        function GetUrl(item) {
            var svalue = location.search.match(new RegExp("[\?\&]" + item + "=([^\&]*)(\&?)", "i"));
            return svalue ? svalue[1] : svalue;
        }
        //获取渠道参数
        function GetSem() {
            var sem = getCookie('sem');
            var hmpl = getCookie('hmpl');
            if (sem != null && sem != undefined) {
                return {
                    sem: sem,
                    hmpl: hmpl
                };
            } else {
                var cookie400 = getCookie('400cookiesem');
                if (cookie400 != undefined) {
                    var list400 = cookie400.split('&');
                    if (list400.length > 1)
                        return {
                            sem: list400[0].replace('sem=', ''),
                            hmpl: list400[1].replace('hmpl=', '')
                        };
                    else
                        return {
                            sem: '',
                            hmpl: ''
                        };
                } else {
                    return {
                        sem: '',
                        hmpl: ''
                    };
                }
            }
        }
        //获取cookie
        function getCookie(name) {
            var arr,
                reg = new RegExp('(^| )' + name + '=([^;]*)(;|$)');
            if ((arr = document.cookie.match(reg))) return unescape(arr[2]);
            else return null;
        }
        $("a.down-a").click(function () {
            var url = $(this).attr('href');
            var searchStr = location.search;
            var url2 = "";
            var str = searchStr.substr(1);
            strs = str.split("&");
            if (strs.length > 1) {
                url2 = "https://datayi.cn/rB40DLW";
                $(this).attr('href', url2);
            } else {
                url2 = "https://datayi.cn/re61OwJ";
                $(this).attr('href', url2);
            }
        })
        //$(".button-collapse").sideNav();
    });
</script>
</body>

</html>