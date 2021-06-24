<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="icon" href="${staticurl}/images/favicon.ico" type="image/x-icon"/>
		<meta name="viewport" content="width=device-width,  maximum-scale=1.0, minimum-scale=1.0" />
		<title>${citycn}房地产资讯_${citycn}最新房产新闻_${citycn}楼市政策-${citycn}中原地产</title>
		<meta name="keywords" content="${citycn}最新房产新闻,${citycn}房产资讯,${citycn}房地产资讯,${citycn}楼市政策,${citycn}楼市新闻" />
		<meta name="description" content="${citycn}房产新闻,${citycn}中原地产提供最及时${citycn}房产新闻、${citycn}房地产资讯，为您解读${citycn}房产最新政策，预测${citycn}房价走势，分析${citycn}楼市成交数据。中原地产最资深最可靠的房地产网站" />
		<meta http-equiv="Expires" content="0">
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Cache-control" content="no-cache">
		<meta http-equiv="Cache" content="no-cache">
		<link rel="stylesheet" href="${staticurl}/css/style1.css" />
		<script type="text/javascript" src="${staticurl}/js/jquery.min.js"></script>
		<script type="text/javascript" src="${staticurl}/js/comemt.js"></script>
		<script type="text/javascript" src="${staticurl}/js/sale_house_cookie.js" language="javascript"></script>
	</head>

	<body>
		<aside>
			<ul class="tablist">
				<%--<c:set var="imgArr" value="${fn:split('buyHouse.png,collectHouse.png,goTop-1.png
														 ,loanDeal.png,propertyRight.png,seeHouse.png,subscription.png',','}"></c:set>--%>
				<c:set var="arr" value="${fn:split('buy_house.png,see_house.png,subscription.png,loan_deal.png,collect_house.png,property_right.png,go_top-1.png,property_right.png,subscription.png',',')}">
				</c:set>
				<c:forEach items="${types}" var="t" varStatus="status">
					<a href="/m/${cityen}/baike?channel=${t.id}">
						<li ref="${t.id}" class="${tabtype == t.id ?'active':''}">

								<img src="${staticurl}/images/${arr[status.index]}" />

							<p>${t.columnsName}</p>
						</li>
					</a>
				</c:forEach>

			</ul>
		</aside>
		<div class="scroll ying">
			<div id="toTop"><img src="${staticurl}/images/go_top-1.png" /></div>
		</div>
		<div class="scrollss">
			<c:forEach items="${news}" var="n">
			<article class="column${n.TypeID}">
				<ul>
					<li class="column">
						<a href="/m/${cityen}/detail/${n.ID}.html">${n.Title}</a>
					</li>
				</ul>
			</article>
			</c:forEach>
			<%@include file="/WEB-INF/views/common_footer.jsp" %>
		</div>
		<script>
			$(function () {
				// tab切换
				//默认第一个tabtype
				let tabType = $('.tablist .active').attr('ref');
				//默认第一个栏目名
				/*let colName=$('.programa .active').text();
				$('.colName').text(colName);*/
				//隐藏全部列表
				// $('.scrollss > article').hide();
				//显示第一个列表
				$('.scrollss > .column' + tabType).show();
				let cityen = '${cityen}';
				$(".tablist li").click(function () {
					$(this).addClass("active").siblings().removeClass("active");
					let tabindex = $(this).attr('ref');
					$('.scrollss > article').hide().filter('.column'+tabindex).show();
				})
			})
		</script>
		<script>
			var _hmt = _hmt || [];
			(function() {
				var hm = document.createElement("script");
				hm.src = "//hm.baidu.com/hm.js?9b3fcfcc3867810b024107e15ec07060";
				var s = document.getElementsByTagName("script")[0];
				s.parentNode.insertBefore(hm, s);
			})();
		</script>
	</body>
	<%--统计代码--%>
	<%@include file="/WEB-INF/views/statistics_code.jsp" %>

</html>
