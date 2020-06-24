<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <script type="text/javascript" src="${staticurl}/js/jquery.lazyload.js" language="javascript"></script>
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
        <c:set var="error_image" value="https://static.centanet.com/v7p20415/images/error/220x165_loading.gif?v202005111"></c:set>
        <ul class="news-tab" style="width: 593px;">
            <input type="hidden" id="tabtype" value="${tabtype}"/>
            <c:forEach items="${types}" var="type" varStatus="status" begin="0" end="6">
                    <li class="tab" ref="${type.id}"><a href="/m/${cityen}/list/c${type.id}/">${type.columnsName}</a></li>
            </c:forEach>
        </ul>
    </div>
</div>
<section class="new-houseblock new-houseblock-list">
    <ul class="new-list">
        <c:forEach items="${news}" var="item">
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
                       <%-- <img src="${item.LitPic}">--%>
                        <c:set var="defaultpic" value="https://static.centanet.com/v7p20415/images/error/220x165_loading.gif?v202005111"></c:set>
                        <c:set var="lazyPic" value="${item.LitPic}?x-oss-process=style/180x130"></c:set>
                        <img class="lazy" src="${item.LitPic == ''?defaultpic:lazyPic}"
                             data-original="${item.LitPic == ''?defaultpic:lazyPic}" alt="${item.Title}" onerror="this.src='${defaultpic}'"/>
                    </div>
                </a>
            </li>
        </c:forEach>
    </ul>
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
        let liWidth = $(".news-tab  li[ref=" + index + "]").width()/2;
        let widths = $(window).width()/2;
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
        let key='${key}';
        if(key){
            return false;
        }
        var newScrolltop = document.documentElement.scrollTop || document.body.scrollTop;
        var newScrollHeight = document.documentElement.scrollHeight || document.body.scrollHeight;
        /*newScrolltop>scrolltop是判断滚动方向为向下*/
        if (newScrolltop + window.innerHeight >= (newScrollHeight-600)){
            //判断当前情况，如果滚动标志位为0时，表示可加载
            if(IS_OVER==0){
                //当前页码数+1
                console.log('index++'+IS_OVER);
                beginShow++;
                //加载新的页码数
                list(beginShow,perNum);
            }
        }
    });

    //aJax获取分页数据
    function list(currentPage,showCount){
        let key='${key}';
        var year='2020';
        var month='5';
        var cityId='021';
        var COURSE_CATEGORY_ID='20';
        let serviceUrl = '';
        let colType=$('#tabtype').val();
        if(${flag >= 1}){
            serviceUrl = '/m/${cityen}/list/c'+ colType +'p' + currentPage + "/page/?flag=${flag}&key="+key;
        }else {
            serviceUrl = '/m/${cityen}/list/c'+ colType +'p' + currentPage + "/page/?key="+key;
        }
        console.log(serviceUrl);

        $.ajax({
            type:'GET',
            url: serviceUrl,
            /*data:{currentPage:currentPage,showCount:showCount,SECTION_ID:'3',
                STATUS:'0',TYPE:'3',year:year,month:month,
                COURSE_CITY_ID:cityId,COURSE_CATEGORY_ID:COURSE_CATEGORY_ID},*/
            dataType:'json',
            cache:false,
            success:function(data){
                console.log(data);
                console.log("pcount="+data.TotalPage);
                console.log("currentPage="+data.CurrentPage);
                //console.log('succcess'+JSON.stringify(data));
                //console.log("pcount"+data.TotalPage);
                pCount=data.TotalPage;
                // var myList=data.Result.length;
                //如果现在处在第一页，且获取到的课程数量为空时，给用户显示的内容
                if(currentPage==1&&data.Result == null){
                    $(".new_list").html('<li class="item type'+colType+'">暂无更多数据</li>');
                    IS_OVER=1;
                    //隐藏等待图标
                    $("#waiting").hide();
                }else {
                    //如果现在的页数大于等于最大页码数，不再翻页
                    if (currentPage > pCount) {
                       /* $(".new-list").append('<li class="item type'+colType+'"><a href="" class="item-a"><div class="new-main"><h6 class="title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;已到底部,无更多数据!</h6>' +
                            '<div class="desc"> <span></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <span class="time"></span></div></div>  <div class="new-img"> ' +
                            '<img class="lazy" src="//static.centanet.com/resourcewap/images/loadPhoto.jpg" data-original="static.centanet.com/resourcewap/images/loadPhoto.jpg"></div> </a></li>');*/
                        //定义加载标志位，让其不能再加载
                        IS_OVER = 1;
                        $("#waiting").hide();
                        //return;
                    }
                }
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
                        //temp += '  <img src="'+content.LitPic+'" onerror="this.src=\'${error_img}\'"> ';
                        temp += ' <img class="lazy" src="'+content.LitPic+'?x-oss-process=style/180x130"' +
                            'data-original="'+content.LitPic+'?x-oss-process=style/180x130" onerror="this.src=\'//static.centanet.com/resourcewap/images/load_photo.jpg\'">';
                        temp += '  </div>';
                        temp += '  </a>';
                        temp += '  </li>';
                        sum += temp;
                    }
                    $(".new-list").append(sum);
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

            },
            error:function (data) {
                console.log('error data'+data);
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
<%--统计代码--%>
<%@include file="/WEB-INF/views/statistics_code.jsp" %>
</body>
</html>
