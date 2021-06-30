<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="mfn" uri="/WEB-INF/mfn.tld" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,  maximum-scale=1.0, minimum-scale=1.0"/>
    <title>${detail.Title}</title>
    <!-- 默认meta标签中的content作为描述 -->
    <meta name="description" content="${fn:substring(detail.ShareTitle , 0 , 30)}">
    <meta name="keywords" content="">
    <meta name="referrer" content="no-referrer"/>
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
    <script type="text/javascript" src="${staticurl}/js/materialize.min.js"></script>
    <script src="${staticurl}/js/jquery.lazyload.min.js" type="text/javascript" language="javascript"></script>

    <!-- 调用微信分享插件 -->
    <script src="${staticurl}/js/wx-share.js"></script>
    <script type="text/javascript" src="${staticurl}/js/sale_house_cookie.js" language="javascript"></script>
    <style>
        .newdetail-wrapper img {
             width:  100%   !important;
             height:  auto  !important;
             display:  block  !important;
        }

        .newdetail-wrapper section {
            width:  100%   !important;
            height:  auto  !important;
             display:  block  !important;
        }

        img {
            max-width: 100% !important;
        }

        * {
            max-width: 100% !important;
        }


    </style>
</head>

<body onload="loadNewsViewHistory()">
<%--埋点相关--%>
<input type="hidden" id="wechat_open_id" value="${wechat_open_id}"/>
<input type="hidden" id="wechat_union_id" value="${wechat_union_id}"/>
<input type="hidden" id="wechat_user_id" value="${wechat_user_id}"/>
<input type="hidden" id="centIO_citycode" value="${centio_citycode}"/>
<input type="hidden" id="srcm_init_log" value="${is_log_on}"/>
<input type="hidden" id="srcm_init_dev" value="${is_dev_on}"/>
<input type="hidden" id="srcm_init_monitor" value="${is_monitor_on}"/>
<%--<script type="text/javascript">document.write('<script src="https://imonitor.centaline.com.cn/sdk/centalab-sdk.js?v=' + new Date().getTime() + '"><\/script>')</script>--%>
<%--测试环境加cookie--%>
<script type="text/javascript">
    Date.prototype.format = function (fmt) {
        var o = {
            "M+": this.getMonth() + 1,                 //月份
            "d+": this.getDate(),                    //日
            "h+": this.getHours(),                   //小时
            "m+": this.getMinutes(),                 //分
            "s+": this.getSeconds(),                 //秒
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度
            "S": this.getMilliseconds()             //毫秒
        };
        if (/(y+)/.test(fmt)) {
            fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        }
        for (var k in o) {
            if (new RegExp("(" + k + ")").test(fmt)) {
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
            }
        }
        return fmt;
    }
    var nowDate = new Date().format("yyyy-MM-dd");
    document.write('<script src="https://imonitor.centaline.com.cn/sdk/centalab-sdk.js?v=' + nowDate + '"><\/script>')
</script>
<script src="//cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<%--埋点相关 begin--%>
<script>
    $(document).ready(function () {
        $.sendCentaIOData("1", "zx_detail_view");
    });
    $.extend({
        getBaseInfo: function () {
            localStorage.setItem('monitorProjectId', 'c84630e6-e878-4e6f-9812-bba9db5c2ab2');
            localStorage.setItem('monitorDeptId', 'till now it is empty');
        },
        getTestCookie: function () {
            var e = 32;
            var t = "ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz2345678";
            var a = t.length;
            var n = '';
            for (i = 0; i < e; i++) {
                n += t.charAt(Math.floor(Math.random() * a))
            }
            $.cookie('Y190cmFja2lk', n.replace('-', ''), {expires: 365});
            return n.replace('-', '');
        },
        getCurrentPageNum: function () {
            var currentUrl = window.location.href;
            var urlTempArray = currentUrl.split("/");
            return urlTempArray[urlTempArray.length - 1].split(".")[0];
        },
        getCurrentSendObj: function (obj) {
            var wechat_union_id = $("#wechat_union_id").val();
            var wechat_open_id = $("#wechat_open_id").val();
            var wechat_user_id = $("#wechat_user_id").val();
            var wechat_union_id_cookie = GetCookie('Y190cmFunion3Idja2lk');
            var wechat_open_id_cookie = GetCookie('Y190open2Idcmja2lk');
            var wechat_user_id_cookie = GetCookie('Y1usedrId90cmFunion3Idja2lk');
            if ($.paramNotNull(wechat_user_id)) {
                obj.userId = wechat_user_id;
                $.cookie('Y1usedrId90cmFunion3Idja2lk', wechat_user_id, {expires: 365});
            } else if ($.paramNotNull(wechat_user_id_cookie)) {
                obj.userId = wechat_user_id_cookie;
            }

            if ($.paramNotNull(wechat_union_id)) {
                obj.unionId = wechat_union_id;
                $.cookie('Y190cmFunion3Idja2lk', wechat_union_id, {expires: 365});
            } else if ($.paramNotNull(wechat_union_id_cookie)) {
                obj.unionId = wechat_union_id_cookie;
            }

            if ($.paramNotNull(wechat_open_id)) {
                obj.openId = wechat_open_id;
                $.cookie('Y190open2Idcmja2lk', wechat_open_id, {expires: 365});
            } else if ($.paramNotNull(wechat_open_id_cookie)) {
                obj.openId = wechat_open_id_cookie;
            }
            if ($.paramNotNull(GetCookie('Y190cmFja2lk'))) {
                obj.cookies = GetCookie('Y190cmFja2lk');
            } else {
                obj.cookies = $.getTestCookie();
                $.cookie('Y190cmFja2lk', obj.cookies, {expires: 365});
            }
            return obj;
        },
        /**
         * 用于设置当前的pageBuriedData，用于埋点SDK采集页面停留时间和下拉到底事件的自动手机
         * param1：频道缩写一般为zx
         * param2：页面类型目前只有detail和list两种
         * param3：事件类型，目前两个值①stay表示页面停留②scroll表示页面滚动到底
         * 备注：方便SDK自动采集
         */
        setPageBuriedData: function (channalShort, pageType, eventType, sourceObject) {
            if (!($.paramNotNull(channalShort) && $.paramNotNull(pageType) && $.paramNotNull(eventType))) {
                console.log("参数一个也不能为空");
                return;
            }
            var centaId = new Object();
            centaId = $.getCurrentSendObj(centaId);
            //console.log(centaId);
            var pageBuriedData = new Object();
            var source = new Object();
            if (eventType == "stay") {
                source.evenStayId = channalShort + "_" + pageType + "_stay";
            } else if (eventType == "scroll") {
                source.evenScrollDownId = channalShort + "_" + pageType + "_scroll_down";
            } else {
                console.log("第三个参数eventType参数输入错误，目前只能为scroll或stay");
            }
            source.sourceObject = sourceObject;
            source.channel = '资讯'
            pageBuriedData.source = source;
            pageBuriedData.centaId = centaId;
            window.pageBuriedData = pageBuriedData;
            //console.log(window.pageBuriedData);
        },
        paramNotNull: function (param) {
            return param != null && param != "";
        },
        /**
         * 用于封装当前的centaIO发送对象
         * param1：action 事件类型// action// 1-进入// 2-停留// 3-底部// 4-点击// 5-搜索
         * param2：eventId 事件Id看蓝湖上产品怎么写
         */
        sendCentaIOData: function (action, eventId) {
            if (!($.paramNotNull(action) && $.paramNotNull(eventId))) {
                console.log("参数一个也不能为空");
                return;
            }
            $.getBaseInfo();
            //封装页面信息对象

            //封装行为对象
            var userBehavior = new Object();
            var source = new Object();
            var centaId = new Object();
            var sourceObject = new Object();
            var cityCode = $('#centIO_citycode').val();
            userBehavior.action = action;//解析url获取当前tab标题
            userBehavior.cityCode = cityCode;
            sourceObject.newsId = $.getCurrentPageNum();
            sourceObject.newsTitle = $('.new-title').text();
            $.setPageBuriedData("zx", "detail", "stay", sourceObject)
            source.eventId = eventId;
            source.channel = "资讯";
            source.sourceId = $.getCurrentPageNum();
            source.sourceObject = sourceObject;
            userBehavior.source = source;
            centaId = $.getCurrentSendObj(centaId);
            userBehavior.centaId = centaId;
            var srcm_init_log = JSON.parse($('#srcm_init_log').val());
            var srcm_init_dev = JSON.parse($('#srcm_init_dev').val());
            var srcm_init_monitor = JSON.parse($('#srcm_init_monitor').val());
            console.log(userBehavior);
            var cent = new centaLabSdk();
            cent.init({
                "from": "002-资讯",
                "cityCode": cityCode,
                "isMonitor": srcm_init_monitor, //是否开启监控 || 默认开启
                "isLog": srcm_init_log, //是否开启⽇志 || 默认开启
                "isDev": srcm_init_dev, //应⽤环境 || 默认测试
            })
            cent.trigger(userBehavior);
        }
    })
    $(window).scroll(function () {
        //滑动到最底部才触发事件不合理，应该是文章差不多看完就触发
        //$(window).scrollTop()是向下滚的距离，通过可以通过finalPossition的大小来调节向下滑动多少触发事件
        var finalPossition = 1200;
        if ($(window).scrollTop() > $(document).height() - $('.new-houseblock').height() - finalPossition) {
            //封装sourceId
            //封装cityCode
            $.sendCentaIOData("3", "zx_detail_scroll_down");
            $(window).unbind("scroll");
        }
    });

</script>
<%--埋点相关 end--%>
<!-- 默认读取网页中的第一张图 可以在body标签顶部放一张图 style设置为display：none  -->
<img src="https://static.centanet.com/wap/main/img/download.png" style="display: none;">

<div class="header-down">
    <div class="download-app" id="downloadApp" style="display: none;">
        <div class="centa-logo">
            <img src="https://static.centanet.com/wap/main/img/download.png" class="logo-icon">
        </div>
        <div class="content">
            <h4>下载中原找房APP</h4>
            <p class="desc">地图找房，与经纪人在线直聊！</p>
        </div>
        <div class="download-btn">
            <a href="javascript:0" class="down-a" onclick="downApp()">立即打开</a>
        </div>
    </div>
</div>
<div class="search-new">
    <div class="search-wrapper">
        <a href="/m/${cityen}/" class="goback">
            <sapn class="search-title">中原资讯</sapn>
        </a>
        <c:choose>
            <c:when test="${cityen == 'sz' || cityen == 'gz'}">
                <a href="//m.${cityen}.centanet.com/search?type=7" class="search-a">
                    <div class="search-box"><i class="icon-sousuo iconfont"></i>请输入资讯标题或内容</div>
                </a>
            </c:when>
            <c:otherwise>
                <a href="//wap.centanet.com/${cityen}/page/common/search.aspx?type=7" class="search-a">
                    <div class="search-box"><i class="icon-sousuo iconfont"></i>请输入资讯标题或内容</div>
                </a>
            </c:otherwise>
        </c:choose>
    </div>
</div>
<div class="newdetail-wrapper">
    <h3 class="new-title">${detail.Title}</h3>
    <div class="new-source">
        <span>${detail.Sources}</span>
        <span class="time"><%--${detail.PublishDate}--%>
            <jsp:useBean id="detailDate" class="java.util.Date"/>
            <c:set target="${detailDate}" property="time" value="${detail.SenddateTime*1000}"/>
            <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${detailDate}" type="both"/>
        </span>
    </div>
    <div>
        <p class="new-content">
            ${detailContent}
        </p>
    </div>
</div>
<%--<p class="new-disclaimer">
    免责声明：本文仅代表作者个人观点，与环球网无关。其原创性以及文中陈述文字和内容未经本站证实，对本文以及其中全部或者部分内容、文字的真实性、完整性、及时性本站不作任何保证或承诺，请读者仅作参考，并请自行核实相关内容。
</p>--%>
<c:set var="defaultpic"
       value="https://static.centanet.com/v7p20415/images/error/220x165_loading.gif?v202005111"></c:set>
<div class="room-container">
    <c:forEach items="${commonHouseResult}" varStatus="status" var="n">
        <div class="roomlists">
            <div class="room-item">
                <div class="room-img">
                    <c:set var="citys" value="sz,gz"></c:set>
                    <c:if test="${n.xinfangResult != null}">
                    <c:if test="${fn:contains(citys, cityen)}">
                    <a href="//m.${cityen}.centanet.com/xinfang/lp-${n.xinfangResult.oid}/">
                        </c:if>
                        <c:if test="${!fn:contains(citys, cityen)}">
                        <a href="//wap.centanet.com/${cityen}/xinfang/lp-${n.xinfangResult.oid}/">
                            </c:if>
                            <img class="lazy"
                                 src="${defaultpic}"
                                 data-original="${n.xinfangResult.defaultImage}"
                                 alt=""/>
                        </a>
                        </c:if>
                        <c:if test="${n.esfResult != null}">
                        <c:if test="${fn:contains(citys, cityen)}">
                        <a href="//m.${cityen}.centanet.com/ershoufang/${n.esfResult.oid}.html">
                            </c:if>
                            <c:if test="${!fn:contains(citys, cityen)}">
                            <a href="//wap.centanet.com/${cityen}/ershoufang/${n.esfResult.oid}.html">
                                </c:if>
                                <img class="lazy"
                                     src="${defaultpic}"
                                     data-original="${fn:substring(n.esfResult.fullImagePath, 0 , mfn:lastIndexOf(n.esfResult.fullImagePath, "."))}_180x130_c${fn:substring(n.esfResult.fullImagePath,mfn:lastIndexOf(n.esfResult.fullImagePath, ".") , fn:length(n.esfResult.fullImagePath))}"
                                     alt=""/>
                            </a>
                            </c:if>
                            <c:if test="${n.xiaoQuResult != null}">
                            <c:if test="${fn:contains(citys, cityen)}">
                            <a href="//m.${cityen}.centanet.com/xiaoqu/xq-${n.xiaoQuResult.oid}/">
                                </c:if>
                                <c:if test="${!fn:contains(citys, cityen)}">
                                <a href="//wap.centanet.com/${cityen}/xiaoqu/xq-${n.xiaoQuResult.oid}/">
                                    </c:if>

                                    <img class="lazy"
                                         src="${defaultpic}"
                                         data-original="${fn:substring(n.xiaoQuResult.imagePath, 0 , mfn:lastIndexOf(n.xiaoQuResult.imagePath, "."))}_180x130_c${fn:substring(n.xiaoQuResult.imagePath,mfn:lastIndexOf(n.xiaoQuResult.imagePath, ".") , fn:length(n.xiaoQuResult.imagePath))}"
                                         alt=""/>
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
                <c:choose>
                <c:when test="${jingJiRenShareKey != null}">
                <a href="/m/${cityen}/detail/${n.ID}.html${jingJiRenShareKey}" class="item-a">
                    </c:when>
                    <c:otherwise>
                    <a href="/m/${cityen}/detail/${n.ID}.html" class="item-a">
                        </c:otherwise>
                        </c:choose>

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
                            <c:choose>
                                <c:when test="${n.LitPic != null && n.LitPic.length() >= 10}">
                                    <img class="lazy"
                                         src="${defaultpic}"
                                         data-original="${fn:substring(n.LitPic, 0 , mfn:lastIndexOf(n.LitPic, "."))}_300x210_c${fn:substring(n.LitPic,mfn:lastIndexOf(n.LitPic, ".") , fn:length(n.LitPic))}"
                                         alt="${item.Title}"/>
                                </c:when>
                                <c:otherwise>
                                    <img class="lazy"
                                         src="${defaultpic}"
                                         data-original="${defaultpic}"
                                         alt="${item.Title}"/>
                                </c:otherwise>
                            </c:choose>

                        </div>
                    </a>
            </li>
        </c:forEach>
    </ul>
    <%@include file="/WEB-INF/views/common_footer.jsp" %>
</section>
<div class="referBroker" id="jingjirenInfo" style="display: none;">
    <div class="referImg left">
        <c:set var="jingjinrensharedefaultpic"
               value="//static.centanet.com/resourcewap/images/photo_normal.jpg"></c:set>
        <img src="" alt="" id="agentImg" onerror="this.src='${jingjinrensharedefaultpic}'">
    </div>
    <div class="referCon left">
        <span class="fs14" id="agentName"></span>
        <span class="tel" id="telCode"></span>
    </div>
    <div class="referTel right"><a id="talk" href="#" style="color: #fff;">打电话</a></div>
</div>


<script type="text/javascript">

    $(function () {
        //图片延迟加载
        $("img.lazy").lazyload({effect: "fadeIn"});
    });

    var searchStr = "${jingJiRenShareKey}";
    if (searchStr.indexOf("staffno") > 0) {
        //由于searchStr属性值包括“?”，所以除去该字符
        searchStr = searchStr.substr(9);
        if (searchStr.indexOf("&") > 0) {
            var str = searchStr.split('&');
            searchStr = str[0];
        }

        //定义一个serviceUrl
        let serviceUrl;

        //判断是否为深圳,深圳独有获取经纪人地址
        if (${cityen == 'sz'}) {
            serviceUrl = 'https://apisz.centanet.com/v6/json/reply/StaffRequest?staffNo=' + searchStr + '&cityen=${cityen}&platform=wap';
        } else {//其他城市公用获取经纪人地址
            serviceUrl = 'https://mobileapi.centanet.com/v6/json/reply/StaffRequest?StaffNo=' + searchStr + '&cityen=${cityen}&platform=wap';
        }
        $.ajax({
            type: "GET",
            async: false,
            url: serviceUrl,
            /* data: {
                 StaffNo: searchStr,
                 cityen:cityShort,
                 platform: "wap"
             },*/
            success: function (data) {
                console.log(data);
                if (data.ResultNo == 0) {
                    $("#jingjirenInfo").show();//打开经纪人展示信息
                    $(".download-app").show();//打开下载APP
                    $(".header-down").show();//打开头部
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
                    $(".header-down").css('display', 'none');//隐藏头部
                }
            }
        });
    } else {
        $("#jingjirenInfo").css('display', 'none');//隐藏底部
        $("#downloadApp").css('display', 'none');//隐藏头部
        $(".header-down").css('display', 'none');//隐藏头部
    }
</script>
<script type="text/javascript">
    /**
     * 以下代码是判断是人还是蜘蛛
     */
        //获取当前进入页面的地址
    let r = document.referrer;
    r = r.toLowerCase(); //转为小写
    let aSites = new Array('google.', 'baidu.', 'soso.', 'so.', '360.', 'yahoo.', 'youdao.', 'sogou.', 'gougou.');
    let flag = false;
    for (i in aSites) {
        if (r.indexOf(aSites[i]) > 0) {
            flag = true;
            break;
        }
    }


    //如果flag为false，证明是人，需要给页面加入访问量
    if (!flag) {
        let locationAddress = window.location;
        $.get(
            "https://news.centanet.com/api/NewsAddToVisit?newsid=${newsId}&cityen=${cityen}&url=" + locationAddress + "&platform=wap&Referer=${referer}",
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

        /*$("a.down-a").click(function () {
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
        })*/
        //$(".button-collapse").sideNav();
    });

    function downApp() {
        var u = navigator.userAgent;
        var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Adr') > -1; //android终端
        var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端
        var isWechat = u.toLowerCase().match(/MicroMessenger/i) == 'micromessenger';
        var iosUrl = "https://itunes.apple.com/cn/app/zhong-yuan-zhao-fang/id880575384?mt=8";
        var adrUrl = "https://static.centanet.com/apk/salehouse.apk";
        var tenUrl = "https://a.app.qq.com/o/simple.jsp?pkgname=com.centaline.androidsalesblog";
        var iosSchema = "SaleHouse://static.centanet.com/salehouseuniversallink";
        var adrSchema = "salehouse://static.centanet.com/salehouseuniversallink";
        //由于webview无法检测用户是否安装app,schema协议执行后,2s后不管用户是否跳转至app,都跳下载页
        if (isiOS) {
            location.href = isWechat ? tenUrl : iosSchema;
            !isWechat && setTimeout(function () {
                location.href = iosUrl;
            }, 2000);
        } else if (isAndroid) {
            location.href = isWechat ? tenUrl : adrSchema;
            !isWechat && setTimeout(function () {
                location.href = adrUrl;
            }, 2000);
        } else {
            //无设备标识的跳转到wap下载引导页
            location.href = '//wap.centanet.com/applink/?fwx';
        }
    }

    //页面加载完之后进行加载
    function loadNewsViewHistory() {
        $.get(
            "/m/${cityen}/detail/loadNewsViewHistory?newsId=${newsId}",
            function (resp) {
            }
        );
    }
</script>
</body>
<%--统计代码--%>
<%@include file="/WEB-INF/views/statistics_code.jsp" %>
</html>