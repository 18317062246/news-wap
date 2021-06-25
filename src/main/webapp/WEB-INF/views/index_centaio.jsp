<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="mfn" uri="/WEB-INF/mfn.tld" %>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width,  maximum-scale=1.0, minimum-scale=1.0"/>
    <title>资讯列表</title>
    <link rel="apple-touch-icon" href="${staticurl}/images/touch-icon-iphone.png"/>
    <link rel="apple-touch-icon" sizes="114x114" href="${staticurl}/images/touch-icon-iphone-retina.png"/>
    <link rel="apple-touch-icon" sizes="144x144" href="${staticurl}/images/touch-icon-ipad-retina.png"/>
    <link href="${staticurl}/images/favicon.ico" type="image/x-icon" rel="icon">
    <link type="text/css" rel="stylesheet" href="${staticurl}/css/materialize.min.css" media="screen,projection"/>
    <link rel="stylesheet" href="${staticurl}/css/font.css">
    <link rel="stylesheet" href="${staticurl}/iconfont/iconfont.css">
    <link rel="stylesheet" href="${staticurl}/css/common.css">
    <link rel="stylesheet" href="${staticurl}/css/news_common.css">
    <link rel="stylesheet" href="${staticurl}/css/zixun_list.css">
    <script type="text/javascript" src="${staticurl}/js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="${staticurl}/js/jquery.lazyload.min.js" language="javascript"></script>
    <script type="text/javascript" src="${staticurl}/js/sale_house_cookie.js" language="javascript"></script>
</head>

<body>
<%--引入带时间戳的埋点SDK--%>
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
    document.write('<script src="https://imonitor.centaline.com.cn/sdk/centalab-sdk.js?v=' + new Date().getTime() + '"><\/script>')
</script>
<%--&lt;%&ndash;测试环境加cookie&ndash;%&gt;--%>
<script src="//cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<%--<div class="search-new">
    <a href="//wap.centanet.com/${cityen}/page/common/search.aspx?type=7" class="search-a">
        <sapn class="search-title">中原资讯</sapn>
        <div class="search-box"><i class="icon-sousuo iconfont"></i>请输入资讯标题或内容</div>
    </a>
</div>--%>
<div class="search-new">
    <div class="search-wrapper">
        <a href="/m/${cityen}/" class="goback">
            <sapn class="search-title">中原资讯</sapn>
        </a>
        <c:choose>
            <c:when test="${cityen == 'sz' || cityen == 'gz'}">
                <a href="//m.${cityen}.centanet.com/search?type=7" class="search-a">
                    <div class="search-box"><i class="icon-sousuo iconfont"></i>
                        <c:if test="${key != null && key.length() > 0}">
                            ${key}
                        </c:if>
                        <c:if test="${key == null || key.length() < 0}">
                            请输入资讯标题或内容
                        </c:if>
                    </div>
                </a>
            </c:when>
            <c:otherwise>
                <a href="//wap.centanet.com/${cityen}/page/common/search.aspx?type=7" class="search-a">
                    <div class="search-box"><i class="icon-sousuo iconfont"></i>
                        <c:if test="${key != null && key.length() > 0}">
                            ${key}
                        </c:if>
                        <c:if test="${key == null || key.length() < 0}">
                            请输入资讯标题或内容
                        </c:if>
                    </div>
                </a>
            </c:otherwise>
        </c:choose>

    </div>
</div>

<div>
    <div class="wrapper">
        <c:set var="error_image"
               value="https://static.centanet.com/v7p20415/images/error/220x165_loading.gif?v202005111"></c:set>
        <ul class="news-tab" style="width: 593px;
        <c:if test="${hidetab}">
                display: none;
        </c:if>
                ">
            <input type="hidden" id="tabtype" value="${tabtype}"/>
            <%--            来自微信小程序的请求，埋点相关--%>
            <input type="hidden" id="wechat_open_id" value="${wechat_open_id}"/>
            <input type="hidden" id="wechat_union_id" value="${wechat_union_id}"/>
            <input type="hidden" id="wechat_user_id" value="${wechat_user_id}"/>
            <input type="hidden" id="centIO_citycode" value="${centio_citycode}"/>
            <input type="hidden" id="srcm_init_log" value="${is_log_on}"/>
            <input type="hidden" id="srcm_init_dev" value="${is_dev_on}"/>
            <input type="hidden" id="srcm_init_monitor" value="${is_monitor_on}"/>
            <c:forEach items="${types}" var="type" varStatus="status">
                <li class="tab" ref="${type.id}">
                    <a id="tab${type.id}" href="/m/${cityen}/list/c${type.id}/">
                            ${type.columnsName}
                    </a>
                </li>
                <input type="hidden" value="${type.columnsName}" id="stab${type.id}">
            </c:forEach>
        </ul>
    </div>
</div>
<script>
    $(function () {
        $.sendCentaIOData("1", "zx_list_view")
    });
    $(window).scroll(function () {
        if ($('#last_li').text() != null && $('#last_li').text() != "") {
            if ($(window).scrollTop() + $(window).height() > $(document).height() - 100) {
                $(window).unbind("scroll");
                $.sendCentaIOData("3", "zx_list_scroll_down")
            }
        }
    })
    $('.tab').click(function () {
        var title=$('.tab a').text().replace(/\s+/g, "");
        $.sendCentaIOData("4","zx_list_ml_click",title)
        $('.tab').unbind('click');
    })
</script>
<script>
    //centaio埋点发送请求的 全局 方法 ，用$.方法名()调用
    $.extend({
        getBaseInfo: function () {
            localStorage.setItem('monitorProjectId', 'c84630e6-e878-4e6f-9812-bba9db5c2ab2');
            localStorage.setItem('monitorDeptId', 'till now it is empty');
        },
        getCurrentSendObj: function (obj) {
            var wechat_union_id = $("#wechat_union_id").val();
            var wechat_open_id = $("#wechat_open_id").val();
            var wechat_user_id = $("#wechat_user_id").val();
            if (wechat_user_id == null || wechat_user_id == "") {
                if (GetCookie('Y190cmFja2lk') == null || GetCookie('Y190cmFja2lk') == "") {
                    obj.cookies = $.getTestCookie();
                    $.cookie('Y190cmFja2lk', obj.cookies, {expires: 365});
                } else {
                    obj.cookies = GetCookie('Y190cmFja2lk');
                }
                obj.userId = "";
            } else {
                obj.userId = wechat_user_id;
                obj.cookies = "";
            }
            obj.unionId = wechat_union_id;
            obj.openId = wechat_open_id;
            return obj;
        },
        getTestCookie: function () {
            var e = 32;
            var t = "ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz2345678";
            var a = t.length;
            var n = '';
            for (i = 0; i < e; i++) {
                n += t.charAt(Math.floor(Math.random() * a))
            }
            $.cookie('Y190cmFja2lk', n.replace('-', ''), {expires: 7});
            return n.replace('-', '');
        },
        //如果存在，获取前一个点击的tab名称
        getPreTabName: function (obj) {
            var preUrl = document.referrer;
            if (preUrl == !null || !preUrl == "") {
                var preUrlTemp = preUrl.split("/");
                if (preUrlTemp[preUrlTemp.length - 2].charAt(0) == 'c') {
                    var preTabNum = preUrlTemp[preUrlTemp.length - 2].replace('c', '');
                    var preTabId = '#tab' + preTabNum;
                    var preTabName = $(preTabId).text();
                    obj.zx_preTabName = preTabName;
                } else {
                    var tabs = $(".news-tab").children().text().split('\n');
                    var firstTab = tabs[1].replace(/\s+/g, "");
                    obj.zx_preTabName = firstTab;
                }
            } else {
                obj.zx_preTabName = "";
            }
            return obj;
        },
        //获取当前的tabname
        getCurrentTabName: function (obj) {
            var currentTabId = '#tab' + $('#tabtype').val();
            obj.title = $(currentTabId).text().replace("\n", "").replace(/\s+/g, "");
            return obj;
        },
        /**
         * 用于设置当前的pageBuriedData，用于埋点SDK采集页面停留时间和下拉到底事件的自动手机
         * param1：事件Id
         * param2：事件类型，目前两个值①stay表示页面停留②scroll表示页面滚动到底
         * 备注：方便SDK自动采集
         */
        setPageBuriedData: function (channalShort, pageType, eventType,sourceObject) {
            if (!($.paramNotNull(channalShort) && $.paramNotNull(pageType) && $.paramNotNull(eventType))) {
                console.log("参数一个也不能为空");
                return;
            }
           var pageBuriedData = new Object();
           var source = new Object();
            if (eventType == "stay") {
                source.evenStayId= channalShort + "_" + pageType + "_stay";
            } else if (eventType == "scroll") {
                source.evenScrollDownId = channalShort + "_" + pageType + "_scroll_down";
            } else {
                console.log("第三个参数eventType参数输入错误，目前只能为scroll或stay");
            }
            source.sourceObject=sourceObject;
            source.channel='资讯'
            pageBuriedData.source=source;
            window.pageBuriedData=pageBuriedData;
        },
        paramNotNull: function (param) {
            return param != null && param != "";
        },
        /**
         * 用于封装当前的centaIO发送对象
         * param1：action 事件类型// action// 1-进入// 2-停留// 3-底部// 4-点击// 5-搜索
         * param2：eventId 事件Id看蓝湖上产品怎么写
         */
        sendCentaIOData: function (action, eventId,_this) {
            if (!($.paramNotNull(action) && $.paramNotNull(eventId))) {
                console.log("参数一个也不能为空");
                return;
            }
            var sourceObject=new Object();
            sourceObject.completeUrl=window.location.href;
            if(eventId=="zx_list_ml_click"){
                sourceObject.title=_this;
            }
            $.getBaseInfo();
            //封装页面信息对象

            //封装行为对象
            var userBehavior = new Object();
            var source = new Object();
            var centaId = new Object();
            var cityCode = $('#centIO_citycode').val();
            userBehavior.action = action;//解析url获取当前tab标题
            userBehavior.cityCode = cityCode;
            source.eventId = eventId;
            source.channel = "资讯";
            source.sourceId = "c" + $('#tabtype').val();
            source.sourceObject = sourceObject;
            userBehavior.source = source;
            centaId = $.getCurrentSendObj(centaId);
            userBehavior.centaId = centaId;
            sourceObject=$.getCurrentTabName(sourceObject);
            $.setPageBuriedData("zx", "list", "stay",sourceObject);
            var srcm_init_log = JSON.parse($('#srcm_init_log').val());
            var srcm_init_dev = JSON.parse($('#srcm_init_dev').val());
            var srcm_init_monitor = JSON.parse($('#srcm_init_monitor').val());
            //console.log(userBehavior);
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
</script>
<section class="new-houseblock new-houseblock-list">
    <ul class="new-list">
        <c:forEach items="${news}" var="item" varStatus="i">
            <li class="item type${item.TypeID}">
                <a href="/m/${cityen}/detail/${item.ID}.html" class="item-a" id="a_link_${item.ID}">
                    <div class="new-main">
                        <h4 class="title">${item.Title}</h4>
                        <div class="desc">
                            <span>${item.TypeName}</span>
                            <span class="time">
                                <jsp:useBean id="myDate" class="java.util.Date"/>
                                <c:set target="${myDate}" property="time" value="${item.PublishDate*1000}"/>
                                <fmt:formatDate pattern="yyyy-MM-dd" value="${myDate}" type="both"/>
                            </span>

                        </div>
                    </div>
                    <div class="new-img">
                        <c:set var="defaultpic"
                               value="https://static.centanet.com/v7p20415/images/error/220x165_loading.gif?v202005111"></c:set>
                        <c:choose>
                            <c:when test="${item.LitPic != null && item.LitPic.length() >= 10}">
                                <img class="lazy" src="${defaultpic}"
                                     data-original="${fn:substring(item.LitPic, 0 , mfn:lastIndexOf(item.LitPic, "."))}_180x130_c${fn:substring(item.LitPic,mfn:lastIndexOf(item.LitPic, ".") , fn:length(item.LitPic))}"
                                     alt="${item.Title}" onerror="this.src='${defaultpic}'"/>
                            </c:when>
                            <c:otherwise>
                                <img class="lazy" src="${defaultpic}"
                                     data-original="${defaultpic}"
                                     alt="${item.Title}"/>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </a>
            </li>
            <%--           广告业按要求：正文每五条显示一条广告--%>
            <%--           当前的广告序号不能超过广告最大条数--%>
            <%--           如果广告列表为空则不显示--%>
            <c:if test="${(i.index+1) % 5 == 0 && i.index!=0 && (i.index + 1) / 5 - 1<adList.size() && adList.size() > 0}">
                <li class="item type${item.TypeID}">
                    <a href="#" class="item-a">
                        <img style="width:347px;height: 88px;margin: 0 auto;" src="${adList[(i.index+1)/5-1].icon}"/>
                    </a>
                </li>
            </c:if>
        </c:forEach>
    </ul>
    <c:if test="${news == null}">
        <div class="blankPage">
            <img src="${staticurl}/images/question_none.png" alt="" class="center-align" style="width:35%">
            <div class="blankCon">
                <h1 class="fs15 f333 center-align">没有找到相关资讯</h1>
                <p class="fs13 f90 center-align">换个条件试试</p>
            </div>
        </div>
    </c:if>
    <%@include file="/WEB-INF/views/common_footer.jsp" %>
</section>

<%--<script type="text/javascript" src="${staticurl}/js/jquery-2.1.4.min.js"></script>--%>
<script type="text/javascript" src="${staticurl}/js/materialize.min.js"></script>
<script type="text/javascript" src="${staticurl}/js/iscroll-probe.js"></script>
<%--<script type="text/javascript" src="${staticurl}/js/jquery.lazyload.js" language="javascript"></script>--%>
<%--<script src="https://unpkg.com/better-scroll/dist/bscroll.min.js"></script>--%>
<script src="${staticurl}/js/bscroll.min.js"></script>
<script>
    $(function () {
        let sumWidth = 0;
        $(".news-tab").children("li").each(function (item, index) {
            sumWidth += $(this).width() + 36;
            $(this).on("click", function () {
                $(".news-tab").find(".active").removeClass("active");
                $(this).children("a").addClass("active");
                /* //居中
                 let liLeft = $(this).offset().left;
                 let liWidth = $(this).width()/2;
                 let widths = $(window).width()/2;
                 let scrollL = $('.wrapper').scrollLeft();
                 $('.wrapper').animate({
                     scrollLeft: scrollL + (liLeft - widths) + liWidth
                 })*/

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

        //居中
        //let liLeft = $(this).offset().left;
        let liLeft = $(".news-tab  li[ref=" + index + "]").offset().left;
        //let liWidth = $(this).width()/2;
        let liWidth = $(".news-tab  li[ref=" + index + "]").width() / 2;
        let widths = $(window).width() / 2;
        let scrollL = $('.wrapper').scrollLeft();
        $('.wrapper').animate({
            scrollLeft: scrollL + (liLeft - widths) + liWidth
        })
    });
    let wrapper = document.querySelector('.wrapper')
    let scroll = new BScroll(wrapper, {
        scrollX: true,
        click: true,
        startX: 0
    })
    let searchStr = window.location.href;
    var beginShow = 2,//初始化显示的条数，以后作为当前第二页
        perNum = 15,//每次滚动时加载的数量
        pCount = 1;//定义一个总页数，在ajax返回的时候会修改它
    //设置是否继续滚动加载的标志位(0:可以加载 1：不再加载)
    var IS_OVER = 0;
    //刚进页面第一次加载
    $(function () {
        //将标签编号默认设置为0
        $("#labelNumHidden").val(0);
        list(beginShow, perNum);
    });
    //当滚动到屏幕底部时
    $(window).scroll(function () {
        /*let key='{key}';
        if(key){
            return false;
        }*/
        //若当前页大于等于总页数，则不进行翻页
        if (beginShow >= pCount) {
            return false;
        }
        var newScrolltop = document.documentElement.scrollTop || document.body.scrollTop;
        var newScrollHeight = document.documentElement.scrollHeight || document.body.scrollHeight;
        /*newScrolltop>scrolltop是判断滚动方向为向下*/
        if (newScrolltop + window.innerHeight >= (newScrollHeight - 600)) {
            //判断当前情况，如果滚动标志位为0时，表示可加载
            if (IS_OVER == 0) {
                //当前页码数+1
                beginShow++;
                //加载新的页码数
                list(beginShow, perNum);
            }
        }
    });

    //aJax获取分页数据
    function list(currentPage, showCount) {
        //搜索的关键字
        let key = '${key}';
        //需要调用的方法
        let serviceUrl = '';
        let colType = $('#tabtype').val();
        if (${flag >= 1}) {
            serviceUrl = '/m/${cityen}/list/c' + colType + 'p' + currentPage + "/page/?flag=${flag}&key=" + key;
        } else {
            serviceUrl = '/m/${cityen}/list/c' + colType + 'p' + currentPage + "/page/?key=" + key;
        }

        $.ajax({
            type: 'GET',
            url: serviceUrl,
            dataType: 'json',
            cache: false,
            success: function (data) {

                pCount = data.TotalPage;

                let sum = '';
                let defaultpic = 'https://static.centanet.com/v7p20415/images/error/220x165_loading.gif?v202005111';
                if (data.ResultNo == 0 && data.Result != null && data.Result.length > 0) {
                    for (let i = 0; i < data.Result.length; i++) {
                        let content = data.Result[i];
                        let temp = '<li class="item type' + content.TypeID + '">';
                        temp += '<a href="/m/${cityen}/detail/' + content.ID + '.html" class="item-a">';
                        temp += '<div class="new-main">';
                        temp += '<h4 class="title">' + content.Title + '</h4>';
                        temp += '<div class="desc">';
                        temp += ' <span>' + content.TypeName + '</span>&nbsp;&nbsp;';
                        temp += '  <span class="time">' + timestampToTime(content.PublishDate) + '</span>';
                        temp += '   </div>';
                        temp += '  </div>';
                        temp += '  <div class="new-img">';
                        let litPic = content.LitPic;
                        if (litPic != null && litPic.length >= 10) {
                            temp += ' <img src="' + litPic.substring(0, litPic.lastIndexOf(".")) + '_180x130_c.' + litPic.substring(litPic.lastIndexOf(".") + 1, litPic.length) + '"/>';
                        } else {
                            temp += ' <img  src="${staticurl}/images/load_photo.jpg" data-original="${staticurl}/images/load_photo.jpg">';
                        }

                        temp += '  </div>';
                        temp += '  </a>';
                        temp += '  </li>';
                        sum += temp;
                    }
                    $(".new-list").append(sum);

                    //如果现在的页数大于等于最大页码数，不再翻页
                    if (currentPage >= pCount) {
                        //加入等待线
                        let tempLine = '<li class="item" style="text-align: center;">';
                        tempLine += '<br/><div style="color: #000;"><h4 class="title" id="last_li">---------------没有更多数据了--------------</h4></div><br/>';
                        tempLine += '</li>';
                        $(".new-list").append(tempLine);

                        //定义加载标志位，让其不能再加载
                        IS_OVER = 1;
                        $("#waiting").hide();
                    }
                }

            },
            error: function (data) {
            }
        });
    }

    //将时间戳转换成年月日时分秒
    function timestampToTime(timestamp) {
        var date = new Date(timestamp * 1000);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
        var Y = date.getFullYear() + '-';
        var M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
        var D = (date.getDate() < 10 ? '0' + date.getDate() : date.getDate()) + ' ';
        var h = (date.getHours() < 10 ? '0' + date.getHours() : date.getHours()) + ':';
        var m = (date.getMinutes() < 10 ? '0' + date.getMinutes() : date.getMinutes());// + ':';
        var s = (date.getSeconds() < 10 ? '0' + date.getSeconds() : date.getSeconds());
        return Y + M + D;//+s;
    }
</script>
<%--统计代码--%>
<%@include file="/WEB-INF/views/statistics_code.jsp" %>
</body>
</html>
