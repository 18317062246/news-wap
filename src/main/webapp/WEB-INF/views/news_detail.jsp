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
    <meta name="referrer" content="no-referrer" />
    <link rel="apple-touch-icon" href="images/touch-icon-iphone.png"/>
    <link rel="apple-touch-icon" sizes="114x114" href="images/touch-icon-iphone-retina.png"/>
    <link rel="apple-touch-icon" sizes="144x144" href="images/touch-icon-ipad-retina.png"/>
    <link rel="icon" href="${staticurl}/images/favicon.ico" type="image/x-icon"/>
    <link type="text/css" rel="stylesheet" href="${staticurl}/css/materialize.min.css" media="screen,projection"/>
    <link rel="stylesheet" href="${staticurl}/css/font.css?v=${ver}">
    <link rel="stylesheet" href="${staticurl}/iconfont/iconfont.css?v=${ver}">
    <link rel="stylesheet" href="${staticurl}/css/common.css?v=${ver}">
    <link rel="stylesheet" href="${staticurl}/css/newsCommon.css?v=${ver}">
    <link rel="stylesheet" href="${staticurl}/css/zixunDetail.css?v=${ver}">

    <%--分享--%>
   <%-- <script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <script src="${staticurl}/js/shareJssdk.js"></script>--%>
    <style>
        .newdetail-wrapper img {
             width:  100%   !important;
             height:  auto  !important;
             display:  block  !important;
        }
        .newdetail-wrapper section{
            width:  100%   !important;
            height:  auto  !important;
             display:  block  !important;
        }
        img {
            max-width :100% !important;
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
    <div class="search-wrapper">
        <a href="/m/${cityen}/" class="goback">
            <sapn class="search-title">中原资讯</sapn>
        </a>
        <a href="//wap.centanet.com/${cityen}/page/common/search.aspx?type=7" class="search-a">
            <div class="search-box"><i class="icon-sousuo iconfont"></i>请输入资讯标题或内容</div>
        </a>
    </div>
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
            ${detailContent}
        </p>
    </div>
</div>
<%--<p class="new-disclaimer">
    免责声明：本文仅代表作者个人观点，与环球网无关。其原创性以及文中陈述文字和内容未经本站证实，对本文以及其中全部或者部分内容、文字的真实性、完整性、及时性本站不作任何保证或承诺，请读者仅作参考，并请自行核实相关内容。
</p>--%>
<div class="room-container">

    <c:forEach items="${commonHouseResult}" varStatus="status" var="n">
        <div class="roomlists">
            <div class="room-item" >
                <div class="room-img">
                    <c:if test="${n.xinfangResult != null}">
                        <a href="//wap.centanet.com/${cityen}/xinfang/lp-${n.xinfangResult.oid}/">
                            <img src="${n.xinfangResult.defaultImage}" alt="" />
                        </a>
                    </c:if>
                    <c:if test="${n.esfResult != null}">
                        <a href="//wap.centanet.com/${cityen}/ershoufang/${n.esfResult.oid}.html/" >
                            <img src="${n.esfResult.fullImagePath}" alt="" />
                        </a>
                    </c:if>
                    <c:if test="${n.xiaoQuResult != null}">
                        <a href="//wap.centanet.com/${cityen}/xiaoqu/xq-${n.xiaoQuResult.oid}/" >
                            <img src="${n.xiaoQuResult.imagePath}" alt="" />
                        </a>
                    </c:if>

                </div>
                <div class="room-mid">
                    <c:if test="${n.xinfangResult != null}">
                        <h5>${n.xinfangResult.adName}</h5>
                        <div class="room-type" style="white-space: nowrap;">${n.xinfangResult.roomsName}</div>
                        <p class="room-address" style="white-space: nowrap;">${n.xinfangResult.baseNewProp.address}</p>
                        <c:if test="${n.xinfangResult.averagePrice != null && n.xinfangResult.averagePrice > 0}">
                            <div style=" white-space: nowrap;display: inline-block;">
                                <p class="room-price">${n.xinfangResult.averagePrice}元/平</p>
                            </div>
                        </c:if>
                    </c:if>
                    <c:if test="${n.esfResult != null}">
                        <h5>${n.esfResult.estateName}</h5>
                        <div class="room-type" style="white-space: nowrap;">${n.esfResult.title}</div>
                        <p class="room-address" style="white-space: nowrap;">${n.esfResult.address}</p>
                        <c:if test="${n.esfResult.salePriceString != null}">
                            <div style=" white-space: nowrap;display: inline-block;">
                                <p class="room-price">
                                        ${n.esfResult.salePriceString}万</p>
                            </div>
                        </c:if>
                    </c:if>
                    <c:if test="${n.xiaoQuResult != null}">
                        <h5>${n.xiaoQuResult.estateName}</h5>
                       <%-- <div class="room-type" style="white-space: nowrap;">${n.esfResult.title}</div>--%>
                        <p class="room-address" style="white-space: nowrap;">${n.xiaoQuResult.address}</p>
                        <c:if test="${n.xiaoQuResult.saleAvgPriceString != null }">
                            <div style=" white-space: nowrap;display: inline-block;">
                                <p class="room-price">
                                        ${n.xiaoQuResult.saleAvgPriceString}元/平</p>
                            </div>
                        </c:if>
                    </c:if>

                </div>
                <div class="room-side">
                    <c:set var="apartmentStr" value="公寓"></c:set>
                    <c:set var="residenceStr" value="住宅"></c:set>
                    <c:set var="vilaResidenceStr" value="普通住宅"></c:set>
                    <c:set var="villaStr" value="别墅"></c:set>
                    <p class="onsale"><%--${n.estType}--%>
                        <c:if test="${n.xinfangResult != null}">
                            <c:if test="${fn:contains(apartmentStr, n.xinfangResult.estType)}">
                                ${apartmentStr}
                            </c:if>
                            <c:if test="${fn:contains(residenceStr, n.xinfangResult.estType)}">
                                ${residenceStr}
                            </c:if>
                            <c:if test="${fn:contains(villaStr, n.xinfangResult.estType)}">
                                ${villaStr}
                            </c:if>
                        </c:if>
                        <c:if test="${n.esfResult != null}">
                            <c:if test="${fn:contains(apartmentStr, n.esfResult.propertyType)}">
                                ${apartmentStr}
                            </c:if>
                            <c:if test="${fn:contains(residenceStr, n.esfResult.propertyType)}">
                                ${residenceStr}
                            </c:if>
                            <c:if test="${fn:contains(villaStr, n.esfResult.propertyType)}">
                                ${villaStr}
                            </c:if>
                            <c:if test="${fn:contains(vilaResidenceStr, n.esfResult.propertyType)}">
                                ${residenceStr}
                            </c:if>
                        </c:if>
                        <c:if test="${n.xiaoQuResult != null}">
                            <c:if test="${fn:contains(apartmentStr, n.xiaoQuResult.propertyType)}">
                                ${apartmentStr}
                            </c:if>
                            <c:if test="${fn:contains(residenceStr, n.xiaoQuResult.propertyType)}">
                                ${residenceStr}
                            </c:if>
                            <c:if test="${fn:contains(vilaResidenceStr, n.xiaoQuResult.propertyType)}">
                                ${residenceStr}
                            </c:if>
                            <c:if test="${fn:contains(villaStr, n.xiaoQuResult.propertyType)}">
                                ${villaStr}
                            </c:if>
                        </c:if>
                    </p>
                </div>
            </div>
        </div>
    </c:forEach>


</div>
<p class="new-disclaimer"></p>
<section class="new-houseblock">
    <h3 class="hot">热点排行</h3>
    <ul class="new-list">
        <c:forEach items="${news}" var="n">
            <li class="item">
                <a href="/m/${cityen}/detail/${n.ID}.html" class="item-a">
                    <div class="new-main">
                        <h4 class="title">${n.Title}</h4>
                        <div class="desc">
                            <span>${n.TypeName}</span>
                            <span class="time">
                                <jsp:useBean id="myDate" class="java.util.Date"/>
                                <c:set target="${myDate}" property="time" value="${n.PublishDate*1000}"/>
                                <fmt:formatDate pattern="yyyy-MM-dd" value="${myDate}" type="both"/>
                            </span>
                        </div>
                    </div>
                    <div class="new-img">
                            <%-- <img src="${n.LitPic}">--%>
                        <c:set var="defaultpic"
                               value="https://static.centanet.com/v7p20415/images/error/220x165_loading.gif?v202005111"></c:set>
                        <img class="lazy" src="${n.LitPic}?x-oss-process=style/180x130"
                             data-original="${n.LitPic}?x-oss-process=style/180x130" alt="${item.Title}"
                             onerror="this.src='${defaultpic}'"/>
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
                } else {
                    $("#jingjirenInfo").css('display', 'none');//隐藏底部
                    $("#downloadApp").css('display', 'none');//隐藏头部
                }
            }
        });
    } else {
        $("#jingjirenInfo").css('display', 'none');//隐藏底部
        $("#downloadApp").css('display', 'none');//隐藏头部
    }
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
        $.get(
            "https://news.centanet.com/api/NewsAddToVisit?newsid=${newsId}&cityen=${cityen}&url="+r+"&platform=pc",
            function (data) {
            });
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
<%--统计代码--%>
<%@include file="/WEB-INF/views/statistics_code.jsp" %>

</html>