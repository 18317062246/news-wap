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

    <link type="text/css" rel="stylesheet" href="//at.alicdn.com/t/font_1711561_vq9r96ey3c.css">
    <link rel="stylesheet" href="${staticurl}/css/common.css">
    <link rel="stylesheet" href="${staticurl}/css/news_common.css">
    <link rel="stylesheet" href="${staticurl}/css/zixun_detail_dwq.css">
    <link rel="stylesheet" href="${staticurl}/css/fonts_jt.css">

    <script type="text/javascript" src="${staticurl}/js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="${staticurl}/js/materialize.min.js"></script>
    <script src="${staticurl}/js/jquery.lazyload.min.js" type="text/javascript" language="javascript"></script>

    <!-- 调用微信分享插件 -->
    <script src="${staticurl}/js/wx-share.js"></script>
    <script type="text/javascript" src="${staticurl}/js/sale_house_cookie.js" language="javascript"></script>
    <script charset="UTF-8" src="https://cdn.jsdelivr.net/npm/sa-sdk-javascript@1.19.3/sensorsdata.min.js"></script>
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

        .houseInfo_totalPrice {
            margin-right: 6px;
            font-size: 14px;
            color: rgb(153, 153, 153);
        }

    </style>
</head>
<%--maidian--%>


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
    <h3 class="new-title" id="dw-new-title">${detail.Title}</h3>
    <div class="new-time">
        <span class="time" id="dw-time"><%--${detail.PublishDate}--%>
            <jsp:useBean id="detailDate" class="java.util.Date"/>
            <c:set target="${detailDate}" property="time" value="${detail.SenddateTime*1000}"/>
            <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${detailDate}" type="both"/>
        </span>
    </div>

    <div class="new-source" id="dw-new-source">
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
    <input type="hidden" id="typeName" value="${typeName}"  />
    <input type="hidden" id="entry" value="${entry}" />
    <input type="hidden" id="cityCn" value="${cityCn}" />
    <input type="hidden" id="platform" value="${platform}">
    <script>
        $(document).ready(function () {
            var sc_information_title=$('#dw-new-title').text();
             var sc_post_time_or=$('#dw-time').text();
            var sc_post_time_str=sc_post_time_or.replace( /^\s+/, "" ).replace("\n","").replace( /\s+$/, "");

            //处理时间
            var arr1 = sc_post_time_str.split(" ");
            var sdate = arr1[0].split('-');
            var sc_post_time = new Date(sdate[0], sdate[1]-1, sdate[2]);

            var entry=localStorage.getItem("entry");
            // var sendUrl=localStorage.getItem("sendUrl");
            //封装发送的对象
            var sendObj=new Object();
            sendObj.sc_information_title=sc_information_title;
            sendObj.sc_post_time=sc_post_time;

            if(entry !=null && entry!='' ){
                sendObj.sc_information_entry=entry;
            }
            if($('#dw-new-source').text()!=null && $('#dw-new-source').text()!=''){
                var sc_information_author=$('#dw-new-source').text().replace( /^\s+/, "" ).replace("\n","").replace( /\s+$/, "");;
                sendObj.sc_information_author=sc_information_author;
            }
            var crrentTab=$('#typeName').val();
            if(crrentTab !=null && crrentTab !=''){
                sendObj.sc_information_type=crrentTab;
            }
            //公共属性
            var pulicObj=new Object();
            var platform=$('#platform').val();
            if(platform !=null && platform !=''){
                pulicObj.sc_platform_type=platform;
                sendObj.sc_platform_type=platform;
            }
            var cityCn=$('#cityCn').val();
            if(platform !=null && platform !=''){
                pulicObj.sc_city=cityCn;
                sendObj.sc_city=cityCn;
            }
            //初始化埋点对象
            var sensors = window['sensorsDataAnalytic201505'];
            sensors.init({
                server_url: 'https://data.zhongyuanzhaofang.com/sa',
                heatmap: {
                    scroll_notice_map: 'not_collect'
                },
                is_track_single_page: true,
                use_client_time: true,
                send_type: 'beacon',
                show_log:true
            });
            // sensors.use('SiteLinker',
            //     {linker: [
            //             {part_url: sendUrl, after_hash: false}
            //         ]}
            // );
            // sensors.registerPage(sendObj);
            sensors.track('sc_information_read',sendObj);
            sensors.registerPage(pulicObj);
            sensors.quick('autoTrack');
        });
    </script>
    <c:forEach items="${xfInfoResult}" varStatus="status" var="n">
        <div class="roomlists" >
            <c:if test="${xfInfoResult[0].xinfangResult != null && status.index == 0}">
                <h3 style="font-size: 16px;color: #333333;font-weight: 700;line-height: 10px; margin-left: 20px;" >新房推荐</h3>
            </c:if>
            <a href="javascript:loadPropertyDetail(11,'${n.xinfangResult.oid}','${cityen}')">

                  <div  class="house-info">
                      <div  class="h-img">
                          <img  alt="" height="90px" width="120px"
                               data-src="${n.xinfangResult.defaultImage}"
                               src="${n.xinfangResult.defaultImage}"
                               onerror="this.src='${defaultpic}'">
                          <!---->
                          <c:if test="${n.xinfangResult.vrCnt != null && n.xinfangResult.vrCnt > 0}">
                              <i data-v-3e6af0be="" class="h-vr"></i>
                          </c:if>
                      </div>
                      <div  class="h-left">
                          <div  class="h-info">
                              <div  class="first-line">
                                  <h2  class="h-name oneline_hide">${n.xinfangResult.adName}</h2>
                                  <span  class="h-price oneline_hide">
                                        <c:if test="${n.xinfangResult.averagePrice != null && n.xinfangResult.averagePrice > 0}">
                                            ${n.xinfangResult.averagePrice}元/平
                                        </c:if>
                                         <c:if test="${n.xinfangResult.averagePrice == null || n.xinfangResult.averagePrice <= 0}">
                                             均价未定
                                         </c:if>
                                  </span>
                              </div>
                              <div  class="second-line">
                                  <span  class="h-area">
                                      <i  class="iconfont iconhuxing h-hx"></i>
                                        <c:if test="${n.xinfangResult.minArea != null && n.xinfangResult.minArea > 0}">
                                            <c:if test="${n.xinfangResult.maxArea != null && n.xinfangResult.maxArea > 0 && n.xinfangResult.minArea != n.xinfangResult.maxArea}">
                                                ${n.xinfangResult.minArea}-${n.xinfangResult.maxArea}m<sup >2</sup>
                                            </c:if>
                                            <c:if test="${n.xinfangResult.maxArea != null && n.xinfangResult.maxArea > 0 && n.xinfangResult.minArea == n.xinfangResult.maxArea}">
                                                ${n.xinfangResult.minArea}m<sup >2</sup>起
                                            </c:if>
                                        </c:if>
                                      <c:if test="${n.xinfangResult.minArea == null || n.xinfangResult.minArea <= 0}">
                                          面积未定
                                      </c:if>

                                  </span>
                                  <span  class="h-total">
                                      <c:if test="${n.xinfangResult.minTotalPrice != null && n.xinfangResult.minTotalPrice > 0}">
                                          ${n.xinfangResult.minTotalPrice}万起
                                      </c:if>
                                      <c:if test="${n.xinfangResult.minTotalPrice == null || n.xinfangResult.minTotalPrice <= 0}">
                                         售价未定
                                      </c:if>
                                  </span></div>
                              <div  class="h-addr">
                                  <i  class="iconfont icondiqu h-dq"></i>${n.xinfangResult.baseNewProp.district.GScopeCnName}<i >-</i>${n.xinfangResult.baseNewProp.GScope.GScopeCnName}</div>
                              <div  class="more"><div  class="h-tags">
                                  <span  class="tags-flat">
                                      <c:set var="apartmentStr" value="公寓"></c:set>
                                    <c:set var="residenceStr" value="住宅"></c:set>
                                    <c:set var="vilaResidenceStr" value="普通住宅"></c:set>
                                    <c:set var="villaStr" value="别墅"></c:set>
                                      <c:if test="${fn:contains(apartmentStr, n.xinfangResult.estType)}">
                                          ${apartmentStr}
                                      </c:if>
                                <c:if test="${fn:contains(residenceStr, n.xinfangResult.estType)}">
                                    ${residenceStr}
                                </c:if>
                                <c:if test="${fn:contains(villaStr, n.xinfangResult.estType)}">
                                    ${villaStr}
                                </c:if>
                                </span>
                                   <c:forTokens items="${n.xinfangResult.features}" delims="、" var="temp">
                                       <span >${temp}</span>
                                   </c:forTokens>

                              </div></div></div><!----><!----><!----></div></div><!----><!----><!---->
            </a>
        </div>
    </c:forEach>

    <c:forEach items="${esfInfoResult}" varStatus="status" var="n">
        <div class="roomlists">
            <c:if test="${esfInfoResult[0].esfResult != null && status.index == 0}">
                <h3 style="font-size: 16px;color: #333333;font-weight: 700;line-height: 10px; margin-left: 20px;margin-top: 30px;margin-bottom: 20px;" >二手房推荐</h3>
            </c:if>
            <a href="javascript:loadPropertyDetail(21,'${n.esfResult.oid}','${cityen}')" >

                    <div  class="list_item_esf">
                        <div  class="item_esf">
                            <div class="houseimg_esf">
                                <img
                                     class="load_bakimg" height="90px" width="120px"
                                     data-src="${fn:substring(n.esfResult.fullImagePath, 0 , mfn:lastIndexOf(n.esfResult.fullImagePath, "."))}_180x130_c${fn:substring(n.esfResult.fullImagePath,mfn:lastIndexOf(n.esfResult.fullImagePath, ".") , fn:length(n.esfResult.fullImagePath))}"
                                     src="${fn:substring(n.esfResult.fullImagePath, 0 , mfn:lastIndexOf(n.esfResult.fullImagePath, "."))}_180x130_c${fn:substring(n.esfResult.fullImagePath,mfn:lastIndexOf(n.esfResult.fullImagePath, ".") , fn:length(n.esfResult.fullImagePath))}" lazy="loaded"><!----><!---->
                                <c:if test="${n.esfResult.vrSeeHouseUrl != null && n.esfResult.vrSeeHouseUrl.length() > 0}">
                                    <i data-v-3e6af0be="" class="h-vr"></i>
                                </c:if>
                            </div>
                            <div class="housetitle_esf">
                                <h2 class="" style="color: rgb(51, 51, 51);">
                                        ${n.esfResult.estateName}</h2>
                                <div  class="double_columns_esf">

                                </div>
                                <div  class="double_columns_esf">
                                    <div  class="left_column_esf"><!----></div>
                                    <span  style="white-space: nowrap;">
                                        ${n.esfResult.roomCount}室${n.esfResult.hallCount}厅&nbsp;|&nbsp;${n.esfResult.GArea}平&nbsp;|&nbsp;
                                    </span><span  class="mr6_esf overflow">
                                    <span  style="color: rgb(153, 153, 153);">${n.esfResult.regionName}&nbsp;${n.esfResult.GScopeName}</span></span><!---->
                                </div><p  class="tags_esf">
                                <c:if test="${n.esfResult.tagTitle != null}">
                                    <span  class="szGood">${n.esfResult.tagTitle}</span>
                                </c:if>
                                <c:forTokens items="${n.esfResult.keyWords}" delims="," var="temp">
                                    <span  class="tags-szOther tags-szfive">${temp}</span>
                                </c:forTokens>

                                </p>
                                <c:if test="${n.esfResult.guidingSalePriceStr != null && n.esfResult.guidingSalePriceStr.value != null}">
                                    <p  class="houseInfo_szprice"><span ><span  class="guidingSalePrice">
                                        <span class="houseInfo_totalPrice">参考总价：</span>${n.esfResult.guidingSalePriceStr.value}
                                        </span>
                                     </span>
                                    </p>
                                </c:if>
                                <c:if test="${n.esfResult.guidingSalePriceStr == null}">
                                    <p  class="houseInfo_szprice"><span ><span  class="guidingSalePrice">
                                        <span></span>${n.esfResult.salePrice}万
                                        </span>
                                     </span>
                                      <span  class="unitSalePrice">${n.esfResult.unitSalePrice}元/平</span>
                                    </p>
                                </c:if>
                                </div></div></div>
             </a>
        </div>
    </c:forEach>

    <c:forEach items="${xqInfoResult}" varStatus="status" var="n">
        <div class="roomlists">
            <c:if test="${n.xiaoQuResult != null && status.index == 0}">
                <h3 style="font-size: 16px;color: #333333;font-weight: 700;line-height: 10px; margin-left: 20px;margin-top: 30px;margin-bottom: 20px;" >小区推荐</h3>
            </c:if>
            <li  class="house_item_xq">
                <a  href="javascript:loadPropertyDetail(61,'${n.xiaoQuResult.oid}','${cityen}')">
                    <div  class="list_item_xq"><div  class="houseimg_xq">
                        <i  class="iconfont icon-play xiaoquimg_i" style="display: none;"></i>
                        <img  class="load_bakimg"
                              data-src="${n.xiaoQuResult.imagePath}"
                              src="${n.xiaoQuResult.imagePath}"
                              lazy="loaded" onerror="this.src='${defaultpic}'">
                    </div><div  class="housetitle_xq">
                        <div  class="xqtitle" style="color: rgb(51, 51, 51);">
                            <c:if test="${n.xiaoQuResult.isDealHot != null && n.xiaoQuResult.isDealHot}">
                                <img  src="data:image/png;base64,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" class="hotIcon">
                            </c:if>
                                ${n.xiaoQuResult.estateName}</div>
                        <div  class="double-columns_xq">
                            <div  class="left-column_xq">
                                <span >${n.xiaoQuResult.regionName}</span>
                                <span >${n.xiaoQuResult.GScopeName}</span>
                                <span >${n.xiaoQuResult.address}</span>
                            </div><!----></div>
                        <div  class="double-columns_xq">
                            <div  class="left-column_xq">
                                <span >
                                    <jsp:useBean id="myDate1" class="java.util.Date"/>
                                <c:set target="${myDate1}" property="time" value="${n.xiaoQuResult.opDate*1000}"/>
                                <fmt:formatDate pattern="yyyy" value="${myDate1}" type="both"/>年建成</span></div>
                            <div  class="right-column_xq"><!----></div></div>
                        <div  class="double-columns_xq f8_xq">
                            <span >在售${n.xiaoQuResult.saleNumber}套&nbsp;在租${n.xiaoQuResult.rentNumber}套</span></div>
                        <c:if test="${n.xiaoQuResult.guidingPrice != null && n.xiaoQuResult.guidingPrice > 0}">
                            <div  class="priceInfo"><span >
                            <span  class="priceTitle">参考单价：</span><span  class="priceNum">${n.xiaoQuResult.guidingPrice}</span>元/平
                            </span></div>
                        </c:if>

                    </div></div></a></li>


        </div>
    </c:forEach>


</div>
<%--<p class="new-disclaimer"></p>--%>
<p style="width: 100%;height: 30px;"></p>
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
