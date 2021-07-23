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
    <title>${detail.Title}</title>
    <!-- 默认meta标签中的content作为描述 -->
    <meta name="description" content="${fn:substring(detail.ShareTitle , 0 , 30)}">
    <meta name="keywords" content="">
    <meta name="referrer" content="no-referrer" />
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
    <link rel="stylesheet" href="${staticurl}/css/fonts_jt.css">

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
        .newdetail-wrapper section{
            width:  100%   !important;
            height:  auto  !important;
             display:  block  !important;
        }
        img {
            max-width :100% !important;
        }

        *{max-width:100%!important;}


    </style>
</head>

<body onload="loadNewsViewHistory();">
<!-- 默认读取网页中的第一张图 可以在body标签顶部放一张图 style设置为display：none  -->
<img  src="https://static.centanet.com/wap/main/img/download.png"  style="display: none;">

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
<div class="newdetail-wrapper">
    <h3 class="new-title">${detail.Title}</h3>
    <div class="new-time">
        <span class="time"><%--${detail.PublishDate}--%>
            <jsp:useBean id="detailDate" class="java.util.Date"/>
            <c:set target="${detailDate}" property="time" value="${detail.SenddateTime*1000}"/>
            <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${detailDate}" type="both"/>
        </span>
    </div>
    <div class="new-source">
        <span>${detail.Sources}</span>
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
<c:set var="defaultpic" value="https://static.centanet.com/v7p20415/images/error/220x165_loading.gif?v202005111"></c:set>
<div style="width: 100%;height: 20px;background-color: #EEEEEE;"></div>
<div class="room-container" style="padding-top: 40px;">
    <c:forEach items="${xfInfoResult}" varStatus="status" var="n">
        <div class="roomlists" >
            <c:if test="${xfInfoResult[0].xinfangResult != null && status.index == 0}">
                <h3 style="font-size: 16px;color: #333333;font-weight: 700;line-height: 10px; margin-left: 10px;">
                    推荐新房</h3>
            </c:if>
            <a href="javascript:loadPropertyDetail(11,'${n.xinfangResult.oid}','${cityen}')">
                <div class="list_item_xf">
                    <div >
                        <div  class="houseimg_xf">
                            <c:if test="${n.xinfangResult.vrCnt != null && n.xinfangResult.vrCnt > 0}">
                                <i  class="iconfont icon-VR3D vr" style="margin-left: 5px;"></i>
                            </c:if>
                            <c:if test="${n.xinfangResult.videoCnt != null && n.xinfangResult.videoCnt > 0}">
                                <i  class="iconfont icon-bofang2 video" style="${n.xinfangResult.vrCnt != null && n.xinfangResult.vrCnt > 0 ? 'margin-left: 30px;': 'margin-left: 5px;'}"></i>
                            </c:if>
                            <c:if test="${n.xinfangResult.isTop != null && n.xinfangResult.isTop}">
                                <i class="xf_top_label">热门</i>
                            </c:if>

                            <img  data-src="${n.xinfangResult.defaultImage}"
                                  src="${n.xinfangResult.defaultImage}" lazy="loaded" onerror="this.src='${defaultpic}'" style="border-radius: 5px;">
                            <!----></div><div  class="housetitle_xf hidden"><p  class="title_xf hidden">
                        <span  class="h2" style="color: rgb(51, 51, 51);">${n.xinfangResult.adName}</span><!----><!----><span class="xf_estate_status">${n.xinfangResult.baseNewProp.status}</span></p>
                        <span  class="mr6_xf mcolor hidden"><i >${n.xinfangResult.baseNewProp.district.GScopeCnName}<c:if test="${n.xinfangResult.baseNewProp.GScope.GScopeCnName != null && n.xinfangResult.baseNewProp.GScope.GScopeCnName.length() > 0}">-${n.xinfangResult.baseNewProp.GScope.GScopeCnName}</c:if></i><i >/${n.xinfangResult.minArea}-${n.xinfangResult.maxArea}平</i><c:if test="${n.xinfangResult.minTotalPrice != null && n.xinfangResult.minTotalPrice > 0  && n.xinfangResult.maxTotalPrice != null && n.xinfangResult.maxTotalPrice > 0 }"><i >/${n.xinfangResult.minTotalPrice}-${n.xinfangResult.maxTotalPrice}万</i></c:if>
                            </span><span  class="hidden Typetags">
                                <c:forTokens items="${n.xinfangResult.features}" delims="、" var="temp" begin="0" end="2">
                                    <i >${temp}</i>
                                </c:forTokens>
                               </span>
                        <p  class="mt-4">
                            <span  class="total-price_xf">${n.xinfangResult.minUnitPrice}-${n.xinfangResult.maxUnitPrice}元/平</span>
                            <span  class="discountInfo">  </span></p></div></div>
                    <span  class="desc"><i  class="bookimg"></i>“${n.xinfangResult.simpleDescription}”</span></div>
            </a>
        </div>
    </c:forEach>

    <c:forEach items="${esfInfoResult}" varStatus="status" var="n">
        <div class="roomlists">
            <c:if test="${esfInfoResult[0].esfResult != null && status.index == 0}">
                <h3 style="font-size: 16px;color: #333333;font-weight: 700;line-height: 10px; margin-left: 10px;margin-top: 30px;margin-bottom: 20px;">
                    推荐二手房</h3>
            </c:if>
            <a href="javascript:loadPropertyDetail(21,'${n.esfResult.oid}','${cityen}')">

                <div  class="list_item_esf">
                    <div class="item_esf commonCity">
                        <div  class="houseimg_esf">

                            <c:if test="${n.esfResult.vrSeeHouseUrl != null && n.esfResult.vrSeeHouseUrl.length() > 0}">
                                <i  class="iconfont icon-VR3D vr" style="margin-left: 5px;"></i>
                            </c:if>
                            <c:if test="${n.esfResult.estateVideo != null}">
                                <i  class="iconfont icon-bofang2 video" style="${n.esfResult.vrSeeHouseUrl != null && n.esfResult.vrSeeHouseUrl.length() > 0? 'margin-left: 30px;': 'margin-left: 5px;'}"></i>
                            </c:if>
                            <img  class="load_bakimg"
                                  data-src="${fn:substring(n.esfResult.fullImagePath, 0 , mfn:lastIndexOf(n.esfResult.fullImagePath, "."))}_180x130_c${fn:substring(n.esfResult.fullImagePath,mfn:lastIndexOf(n.esfResult.fullImagePath, ".") , fn:length(n.esfResult.fullImagePath))}"
                                  src="${fn:substring(n.esfResult.fullImagePath, 0 , mfn:lastIndexOf(n.esfResult.fullImagePath, "."))}_180x130_c${fn:substring(n.esfResult.fullImagePath,mfn:lastIndexOf(n.esfResult.fullImagePath, ".") , fn:length(n.esfResult.fullImagePath))}"
                                  lazy="loaded" onerror="this.src='${defaultpic}'"  style="border-radius: 5px;">
                        </div>
                        <div  class="housetitle_esf"><div  class="list_right"><h2  class="" style="color: rgb(51, 51, 51);"><!---->
                            <c:if test="${n.esfResult.isHot != null && n.esfResult.isHot}">
                                <span class="esf_hot_title">经理推荐</span>
                            </c:if>
                                ${n.esfResult.title}
                        </h2><span  class="house_info"><!---->
                               <span  class="mr6_esf">${n.esfResult.roomCount}室${n.esfResult.hallCount}厅/</span><span class="mr6_esf">${n.esfResult.GArea}平/</span><span  class="mr6_esf">朝${n.esfResult.direction}/</span><span  class="mr6_esf">${n.esfResult.estateName}/</span><span  class="mr6_esf">${n.esfResult.GScopeName}</span>
                            <p >
                                <c:forTokens items="${n.esfResult.keyWords}" delims="," var="temp"  begin="0" end="2">
                                    <span  class="tags-common">${temp}</span>
                                </c:forTokens>

                            </p></div><!---->
                            <div class="houseInfo_price"><!---->
                                <span >${n.esfResult.salePrice}<i >万</i></span><!---->
                                <span  class="unitPrice">${n.esfResult.unitSalePrice}元/平</span></div><!----></div></div></div>
            </a>
        </div>
    </c:forEach>

    <c:forEach items="${xqInfoResult}" varStatus="status" var="n">
        <div class="roomlists">
            <c:if test="${n.xiaoQuResult != null && status.index == 0}">
                <h3 style="font-size: 16px;color: #333333;font-weight: 700;line-height: 10px; margin-left: 10px;margin-top: 30px;margin-bottom: 10px;">
                    推荐小区</h3>
            </c:if>
            <li  class="house_item_xq">
                <a  href="javascript:loadPropertyDetail(61,'${n.xiaoQuResult.oid}','${cityen}')">
                    <div  class="list_item_xq">
                        <div  class="houseimg_xq">
                            <c:if test="${n.xiaoQuResult.isVideo != null && n.xiaoQuResult.isVideo}">
                                <i  class="iconfont icon-play xiaoquimg_i"></i>
                            </c:if>
                            <img  class="load_bakimg"
                                  data-src="${n.xiaoQuResult.imagePath}"
                                  src="${n.xiaoQuResult.imagePath}"
                                  lazy="loaded" onerror="this.src='${defaultpic}'"  style="border-radius: 5px;"></div>
                        <div  class="housetitle_xq">
                            <div class="xqtitle" style="color: rgb(51, 51, 51);">
                                <!---->${n.xiaoQuResult.estateName}</div>
                            <div  class="double-columns_xq">
                                <div  class="left-column_xq">
                                    <span >${n.xiaoQuResult.regionName}</span><span >${n.xiaoQuResult.GScopeName}</span><span >${n.xiaoQuResult.address}</span></div>
                                <div  class="right-column_xq"><!---->
                                    <span  class="total-price_xq">${n.xiaoQuResult.saleAvgPrice}元/平</span><!----></div></div>
                            <div  class="double-columns_xq">
                                <div  class="left-column_xq"><span >
                                  <jsp:useBean id="myDate1" class="java.util.Date"/>
                                <c:set target="${myDate1}" property="time" value="${n.xiaoQuResult.opDate*1000}"/>
                                <fmt:formatDate pattern="yyyy" value="${myDate1}" type="both"/>年建成</span></div>
                                <div  class="right-column_xq"><!----></div></div>
                            <div  class="double-columns_xq f8_xq">
                                <span >在售${n.xiaoQuResult.saleNumber}套&nbsp;在租${n.xiaoQuResult.rentNumber}套</span></div><!----></div></div></a></li>
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
                                         src="${fn:substring(n.LitPic, 0 , mfn:lastIndexOf(n.LitPic, "."))}_300x210_c${fn:substring(n.LitPic,mfn:lastIndexOf(n.LitPic, ".") , fn:length(n.LitPic))}"
                                         data-original="${fn:substring(n.LitPic, 0 , mfn:lastIndexOf(n.LitPic, "."))}_300x210_c${fn:substring(n.LitPic,mfn:lastIndexOf(n.LitPic, ".") , fn:length(n.LitPic))}"
                                         alt="${item.Title}" onerror="this.src='${defaultpic}'"/>
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
        if(${cityen == 'sz'}){
            serviceUrl = 'https://apisz.centanet.com/v6/json/reply/StaffRequest?staffNo='+ searchStr +'&cityen=${cityen}&platform=wap';
        }else {//其他城市公用获取经纪人地址
            serviceUrl = 'https://mobileapi.centanet.com/v6/json/reply/StaffRequest?StaffNo='+ searchStr +'&cityen=${cityen}&platform=wap';
        }
        $.ajax({
            type: "GET",
            async: false,
            url: serviceUrl,
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
            "https://news.centanet.com/api/NewsAddToVisit?newsid=${newsId}&cityen=${cityen}&url="+locationAddress+"&platform=wap&Referer=${referer}",
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

    function downApp() {
        var u = navigator.userAgent;
        var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Adr') > -1; //android终端
        var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端
        var isWechat = u.toLowerCase().match(/MicroMessenger/i) == 'micromessenger';
        var iosUrl="https://itunes.apple.com/cn/app/zhong-yuan-zhao-fang/id880575384?mt=8";
        var adrUrl="https://static.centanet.com/apk/salehouse.apk";
        var tenUrl="https://a.app.qq.com/o/simple.jsp?pkgname=com.centaline.androidsalesblog";
        var iosSchema="SaleHouse://static.centanet.com/salehouseuniversallink";
        var adrSchema="salehouse://static.centanet.com/salehouseuniversallink";
        //由于webview无法检测用户是否安装app,schema协议执行后,2s后不管用户是否跳转至app,都跳下载页
        if (isiOS) {
            location.href = isWechat?tenUrl:iosSchema;
            !isWechat&&setTimeout(function () {location.href = iosUrl;}, 2000);
        }
        else if (isAndroid) {
            location.href = isWechat?tenUrl:adrSchema;
            !isWechat&&setTimeout(function () {location.href = adrUrl;}, 2000);
        }else {
            //无设备标识的跳转到wap下载引导页
            location.href='//wap.centanet.com/applink/?fwx';
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

    /**
     * 跳转到房源详情
     */
    function loadPropertyDetail(type , targetId , cityen) {
        let u = navigator.userAgent;
        let Agents = ['Android','iPhone','SymbianOS','Windows Phone','iPod'];
        let flag = true;
        for(let i = 0;i < Agents.length;i++){
            if(u.indexOf(Agents[i])>0){
                flag = false;
                break;
            }
        }
        if(window.screen.width>=768){
            flag = true;
        }
        if(flag){
            let citys = ['sz','gz'];
            if(parseInt(type) == 11){
                if(citys.indexOf(cityen) > 0){
                    window.location.href = "//m."+ cityen +".centanet.com/xinfang/lp-"+ targetId +"/";
                }else {
                    window.location.href = "//wap.centanet.com/"+ cityen +"/xinfang/lp-"+ targetId +"/";
                }
            }
            if(parseInt(type) == 21){
                if(citys.indexOf(cityen) > 0){
                    window.location.href = "//m."+ cityen +".centanet.com/ershoufang/"+ targetId +".html";
                }else {
                    window.location.href = "//wap.centanet.com/"+ cityen +"/ershoufang/"+ targetId +".html";
                }
            }

            if(parseInt(type) == 61){
                if(citys.indexOf(cityen) > 0){
                    window.location.href = "//m."+ cityen +".centanet.com/ershoufang/"+ targetId +".html";
                }else {
                    window.location.href = "//wap.centanet.com/"+ cityen +"/ershoufang/"+ targetId +".html";
                }
            }
        }else {
            let isAndroid = u.indexOf('Android') > -1 || u.indexOf('Linux') > -1; //g
            let isIOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端
            if (isAndroid) {
                //这个是安卓操作系统
                window.salehouse.pushToNativePage("{\"type\":" + type +",\"target\":\""+ targetId+"\"}");
            }
            if (isIOS) {
                //这个是ios操作系统
                window.webkit.messageHandlers.pushToNativePage.postMessage("{\"type\":\"" + type +"\",\"target\":\""+ targetId+"\"}")
            }
        }
    }
</script>
</body>
<%--统计代码--%>
<%@include file="/WEB-INF/views/statistics_code.jsp" %>
</html>
