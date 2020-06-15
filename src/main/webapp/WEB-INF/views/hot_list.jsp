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
    <title>热门专题</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
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
    <script type="text/javascript" src="${staticurl}/js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="${staticurl}/js/jquery.lazyload.js" language="javascript"></script>
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
        <a href="//wap.centanet.com/${cityen}/page/common/search.aspx?type=7" class="search-a">
            <div class="search-box"><i class="icon-sousuo iconfont"></i>请输入资讯标题或内容</div>
        </a>
    </div>
</div>
<div>
    <div class="wrapper">
        <ul class="news-tab" style="width: 593px;">
            <input type="hidden" id="tabtype" value="${tabtype}"/>
            <c:forEach items="${types}" var="type" varStatus="status" begin="0" end="6">
                <li class="tab" ref="${type.id}"><a href="/m/${cityen}/list/c${type.id}">${type.columnsName}</a></li>
            </c:forEach>
          <%--  <li class="tab fs12"><a href="#test2" class="active">中原资讯</a></li>
            <li class="tab fs12"><a href="#test3">地方楼市</a></li>
            <li class="tab fs12"><a href="#test4">专题</a></li>
            <li class="tab fs12"><a href="#test1">最新</a></li>
            <li class="tab fs12"><a href="#test4">专题</a></li>
            <li class="tab fs12"><a href="#test1">热门专题</a></li>--%>
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
                        <img class="lazy" src="${item.LitPic}?x-oss-process=style/180x130"
                             data-original="${item.LitPic}?x-oss-process=style/180x130" alt="${item.Title}" onerror="this.src='${defaultpic}'"/>
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
     <%--   <li class="item">
            <a class="item-a" href="61_资讯详情.html?rand=1">
                <div class="img-box">
                    <img src="./images/ad1.jpg">
                </div>
                <div class="content">
                    <h4 class="title">壹线国际 适合你的实用精品房</h4>
                    <div class="desc">
                        <span class="txt">全国楼市</span>
                        <span>2020-05-30</span>
                    </div>
                </div>
            </a>
        </li>
        <li class="item">
            <a class="item-a" href="61_资讯详情.html?rand=1">
                <div class="img-box">
                    <img src="./images/ad1.jpg">
                </div>
                <div class="content">
                    <h4 class="title">壹线国际 适合你的实用精品房</h4>
                    <div class="desc">
                        <span class="txt">全国楼市</span>
                        <span>2020-05-30</span>
                    </div>
                </div>
            </a>
        </li>--%>
    </ul>
</div>
<div class="news-project-list">
    <ul class="project-list" id="project_list">

    </ul>
</div>
<%--统计代码--%>
<%@include file="/WEB-INF/views/statistics_code.jsp" %>
<%--<script type="text/javascript" src="${staticurl}/js/jquery-2.1.4.min.js"></script>--%>
<script type="text/javascript" src="${staticurl}/js/materialize.min.js?v=${ver}"></script>
<script type="text/javascript" src="${staticurl}/js/iscroll-probe.js?v=${ver}"></script>
<%--<script type="text/javascript" src="${staticurl}/js/jquery.lazyload.js" language="javascript"></script>--%>
<script src="${staticurl}/js/bscroll.min.js"></script>
<%--<script>
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
    });
    let wrapper = document.querySelector('.wrapper')
    let scroll = new BScroll(wrapper, {
        scrollX: true,
        click: true,
        startX: 0
    })
</script>--%>
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
 /*   let searchStr = window.location.href;
    var beginShow=1,//初始化显示的条数，以后作为当前第二页
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
        if ($(window).scrollTop() == $(document).height() - $(window).height()) {
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
        console.log('当前页:'+currentPage);
        var year='2020';
        var month='5';
        var cityId='021';
        var COURSE_CATEGORY_ID='20';
        let serviceUrl = '';
        let searchStrTemp = searchStr.substr(searchStr.lastIndexOf("c") + 1);
        let array = searchStrTemp.split('p');
        console.log('array[0]='+array[0]);
        serviceUrl = '/m/${cityen}/list/c'+ array[0] +'p' + currentPage + "/page/";

        console.log(serviceUrl);
        $.ajax({
            type:'GET',
            url: serviceUrl,
            /!*data:{currentPage:currentPage,showCount:showCount,SECTION_ID:'3',
                STATUS:'0',TYPE:'3',year:year,month:month,
                COURSE_CITY_ID:cityId,COURSE_CATEGORY_ID:COURSE_CATEGORY_ID},*!/
            dataType:'json',
            cache:false,
            success:function(data){
                console.log(data);
                pCount=data.TotalPage;
                // var myList=data.Result.length;
                //如果现在处在第一页，且获取到的课程数量为空时，给用户显示的内容
                if(currentPage==1&&data.Result == null){
                    $(".new_list").html('<li class="item">这里暂无数据</li>');
                    IS_OVER=1;
                    //隐藏等待图标
                    $("#waiting").hide();
                }else {
                    //如果现在的页数大于等于最大页码数，不再翻页
                    if (currentPage >= pCount) {
                        //定义加载标志位，让其不能再加载
                        IS_OVER = 1;
                        $("#waiting").hide();
                    }
                }
                let sum = '';
                if(data.ResultNo == 0 && data.Result != null && data.Result != null){

                    for(let i = 0 ; i < data.Result.length ; i++){
                        let content = data.Result[i];
                        let temp = '<li class="item">';
                        temp += '<a href="/m/${cityen}/detail/'+content.ID+'.html" class="item-a">';
                        temp += '<div class="img-box">';
                        temp += '<img src="'+ content.LitPic +'" onerror="this.src=\'${error_img}\'">';
                        temp += '</div>';
                        temp += ' <div class="content">';
                        temp += '<h4 class="title">'+ content.Title +'</h4>';
                        temp += '<div class="desc">';
                        temp += ' <span>' + content.TypeName + '</span>&nbsp;&nbsp;';
                        temp += '<span>'+ timestampToTime(content.PublishDate)  +'</span>';
                        temp += '</div>';
                        temp += ' </div>';
                        temp += '  </a>';
                        temp += '  </li>';
                        sum += temp;
                    }
                    $("#project_list").append(sum);
                }else {
                    pCount=data.TotalPage;
                    var myList=data.Result;
                    //如果现在处在第一页，且获取到的课程数量为空时，给用户显示的内容
                    if(currentPage==1&&myList== null){
                        $(".new_list").html('<li class="item">这里暂无数据</li>');
                        IS_OVER=1;
                        //隐藏等待图标
                        $("#waiting").hide();
                    }else {
                        //如果现在的页数大于等于最大页码数，不再翻页
                        if (currentPage >= pCount) {
                            //定义加载标志位，让其不能再加载
                            IS_OVER = 1;
                            $("#waiting").hide();
                        }
                    }
                }

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
        return Y+M+D+h+m;//+s;
    }*/
</script>
</body>

</html>