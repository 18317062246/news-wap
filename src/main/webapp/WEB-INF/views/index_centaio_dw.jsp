<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="mfn" uri="/WEB-INF/mfn.tld"%>
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
    <div class="wrapper" style="overflow: scroll !important;">
        <c:set var="error_image" value="https://static.centanet.com/v7p20415/images/error/220x165_loading.gif?v202005111"></c:set>
        <ul class="news-tab" style="width: 593px;
            <c:if test="${hidetab}">
                    display: none;
            </c:if>
        ">
            <input type="hidden" id="tabtype" value="${tabtype}"/>
            <input type="hidden" id="tabChildrenType" value="${childrenId}"/>
            <input type="hidden" id="entry" value="${entry}"/>
            <input type="hidden" id="cityCode" value="${cityCode}"/>
            <input type="hidden" id="sendUrl" value="${sendUrl}"/>
            <c:forEach items="${types}" var="type" varStatus="status">
                    <li class="tab" ref="${type.id}"><a id="a${type.id}" href="/m/${cityen}/list/c${type.id == 41 ? type.id : fn:length(type.childList) > 0 ? type.childList[0].id : type.id}/">${type.columnsName}</a></li>
            </c:forEach>
        </ul>
        <script>
            //神策埋点，获取当前tab页的名称
            $(document).ready(function(){
                var tabId=$('#tabtype').val();
                var currentTab=$('#a'+tabId).text();
                var cityCode=$('#cityCode').val();
                var entry=$('#entry').val();
                var sendUrl=$('#sendUrl').val();
                localStorage.setItem("currentTab",currentTab);
                localStorage.setItem("cityCode",cityCode);
                localStorage.setItem("entry",entry);
                localStorage.setItem("sendUrl",sendUrl);
            })
        </script>
    </div>
</div>
<c:if test="${fn:length(childrenTypeList) > 0}">
    <section class="secondary-tabtype-list">
        <ul class="secondary-tabtype-ul-list">
            <c:forEach items="${types}" var="type" >
                <c:if test="${type.id == childrenId}">
                    <c:forEach items="${type.childList}" var="child" >
                        <li class="${child.id == childrenTypeId ? 'curr' : ''}" >
                            <a href="/m/${cityen}/list/c${child.id}/" class="${child.id == childrenTypeId ? 'curr' : ''}">${child.columnsName}
                            </a>
                        </li>
                    </c:forEach>
                </c:if>
            </c:forEach>
        </ul>
    </section>
</c:if>
<section class="new-houseblock new-houseblock-list">
    <ul class="new-list">
        <c:forEach items="${news}" var="item" varStatus="i">
            <li class="item type${item.TypeID}">
                <a href="/m/${cityen}/detail/${item.ID}.html" class="item-a">
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
                        <c:set var="defaultpic" value="https://static.centanet.com/v7p20415/images/error/220x165_loading.gif?v202005111"></c:set>
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
        let index = $("#tabChildrenType").val();
        $(".news-tab  li[ref=" + index + "]").find('a').addClass("active").parent().siblings().children("a").removeClass("active");
        //图片延迟加载
        $("img.lazy").lazyload({effect: "fadeIn"});

        //居中
        //let liLeft = $(this).offset().left;
        let liLeft = $(".news-tab  li[ref=" + index + "]").offset().left;
        //let liWidth = $(this).width()/2;
        let liWidth = $(".news-tab  li[ref=" + index + "]").width()/2;
        let widths = $(window).width()/2;
        let scrollL = $('.wrapper').scrollLeft();
        $('.wrapper').animate({
           scrollLeft: scrollL + (liLeft - widths) + liWidth
        })

    });
    let wrapper = document.querySelector('.tab')
    let scroll = new BScroll(wrapper, {
        scrollX: true,
        click: true,
        startX: 0
    })
    let searchStr = window.location.href;
    var beginShow=2,//初始化显示的条数，以后作为当前第二页
        perNum = 15,//每次滚动时加载的数量
        pCount = 1;//定义一个总页数，在ajax返回的时候会修改它
    //设置是否继续滚动加载的标志位(0:可以加载 1：不再加载)
    var IS_OVER=0;
    //刚进页面第一次加载
    $(function(){
        //将标签编号默认设置为0
        $("#labelNumHidden").val(0);
        list(beginShow,perNum);
    });
    //当滚动到屏幕底部时
    $(window).scroll(function () {
        /*let key='{key}';
        if(key){
            return false;
        }*/
        //若当前页大于等于总页数，则不进行翻页
        if(beginShow >= pCount){
            return false;
        }
        var newScrolltop = document.documentElement.scrollTop || document.body.scrollTop;
        var newScrollHeight = document.documentElement.scrollHeight || document.body.scrollHeight;
        /*newScrolltop>scrolltop是判断滚动方向为向下*/
        if (newScrolltop + window.innerHeight >= (newScrollHeight-600)){
            //判断当前情况，如果滚动标志位为0时，表示可加载
            if(IS_OVER==0){
                //当前页码数+1
                beginShow++;
                //加载新的页码数
                list(beginShow,perNum);
            }
        }
    });

    //aJax获取分页数据
    function list(currentPage,showCount){
        //搜索的关键字
        let key='${key}';
        //需要调用的方法
        let serviceUrl = '';
        let colType=$('#tabtype').val();
        if(${flag >= 1}){
            serviceUrl = '/m/${cityen}/list/c'+ colType +'p' + currentPage + "/page/?flag=${flag}&key="+key;
        }else {
            serviceUrl = '/m/${cityen}/list/c'+ colType +'p' + currentPage + "/page/?key="+key;
        }

        $.ajax({
            type:'GET',
            url: serviceUrl,
            dataType:'json',
            cache:false,
            success:function(data){

                pCount=data.TotalPage;

                let sum = '';
                let defaultpic='https://static.centanet.com/v7p20415/images/error/220x165_loading.gif?v202005111';
                if(data.ResultNo == 0 && data.Result != null && data.Result.length>0){
                    for(let i = 0 ; i < data.Result.length ; i++){
                        let content = data.Result[i];
                        let temp = '<li class="item type'+content.TypeID+'">';
                        temp += '<a href="/m/${cityen}/detail/'+content.ID+'.html" class="item-a">';
                        temp += '<div class="new-main">';
                        temp += '<h4 class="title">'+content.Title+'</h4>';
                        temp += '<div class="desc">';
                        temp += ' <span>' + content.TypeName + '</span>&nbsp;&nbsp;';
                        temp += '  <span class="time">'+ timestampToTime(content.PublishDate) +'</span>';
                        temp += '   </div>';
                        temp += '  </div>';
                        temp += '  <div class="new-img">';
                        let litPic = content.LitPic;
                        if(litPic != null && litPic.length >= 10){
                            temp += ' <img src="'+litPic.substring(0 ,litPic.lastIndexOf(".") )+'_180x130_c.'+ litPic.substring(litPic.lastIndexOf(".") + 1 , litPic.length)  +'"/>';
                        }else {
                            temp += ' <img  src="${staticurl}/images/load_photo.jpg" data-original="${staticurl}/images/load_photo.jpg">';
                        }

                        temp += '  </div>';
                        temp += '  </a>';
                        temp += '  </li>';
                        sum += temp;
                    }
                    $(".new-list").append(sum);
                    $(".secondary-tabtype-list").height($(".new-list").height() + 284);

                    //如果现在的页数大于等于最大页码数，不再翻页
                    if (currentPage >= pCount) {
                        //加入等待线
                        let tempLine = '<li class="item" style="text-align: center;">';
                        tempLine += '<br/><div style="color: #000;"><h4 class="title">---------------没有更多数据了--------------</h4></div><br/>';
                        tempLine += '</li>';
                        $(".new-list").append(tempLine);

                        //定义加载标志位，让其不能再加载
                        IS_OVER = 1;
                        $("#waiting").hide();
                    }
                }

            },
            error:function (data) {
            }
        });
    }
    //将时间戳转换成年月日时分秒
    function timestampToTime(timestamp) {
        var date = new Date(timestamp * 1000);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
        var Y = date.getFullYear() + '-';
        var M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
        var D = (date.getDate() < 10 ? '0'+date.getDate() : date.getDate()) + ' ';
        var h = (date.getHours() < 10 ? '0'+date.getHours() : date.getHours()) + ':';
        var m = (date.getMinutes() < 10 ? '0'+date.getMinutes() : date.getMinutes());// + ':';
        var s = (date.getSeconds() < 10 ? '0'+date.getSeconds() : date.getSeconds());
        return Y+M+D;//+s;
    }
</script>
<script>
<%--    2233--%>

</script>

<%--统计代码--%>
<%@include file="/WEB-INF/views/statistics_code.jsp" %>
</body>
</html>
