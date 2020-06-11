<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
	</head>

	<body>
		<aside>
			<ul class="tablist">
				<%--<c:set var="imgArr" value="${fn:split('buyHouse.png,collectHouse.png,goTop-1.png
														 ,loanDeal.png,propertyRight.png,seeHouse.png,subscription.png',','}"></c:set>--%>
				<c:set var="arr" value="${fn:split('buyHouse.png,collectHouse.png,goTop-1.png,loanDeal.png,propertyRight.png,seeHouse.png,subscription.png',',')}"></c:set>
				<c:forEach items="${types}" var="t" varStatus="status">
					<li ref="${t.id}" class="${status.index==0?'active':''}">
						<img src="${staticurl}/images/${arr[status.index]}" />
						<p><a href="javacript:void(0);"></a></p>
					</li>
				</c:forEach>

			</ul>
		</aside>
		<div class="scroll ying">
			<div id="toTop"><img src="${staticurl}/images/goTop-1.png" /></div>
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
		<%--	<article class="column2" style="display: none;">
				<ul>
					<li>
						<a href="/m/sy/baike/goufangliuchen/kfxf/12110.html">3分钟看懂开发商所说的“赠送面积”</a>
					</li>
				</ul>
				<ul>
					<li>
						<a href="/m/sy/baike/goufangliuchen/kfxf/12105.html">高层和小高层 一字之差区别大！</a>
					</li>
				</ul>
				<ul>
					<li>
						<a href="/m/sy/baike/goufangliuchen/kfxf/12101.html">买毛坯房好 还是精装房好？</a>
					</li>
				</ul>
				<ul>
					<li>
						<a href="/m/sy/baike/goufangliuchen/kfxf/12094.html">什么是公寓式住宅，它和普通住宅的区别是什么</a>
					</li>
				</ul>
				<ul>
					<li>
						<a href="/m/sy/baike/goufangliuchen/kfxf/12092.html">小户型住房应该如何选择？</a>
					</li>
				</ul>
				<ul>
					<li>
						<a href="/m/sy/baike/goufangliuchen/kfxf/12091.html">这些房再便宜也不能买!装修时才发现亏大了</a>
					</li>
				</ul>

			</article>
			<article class="column3" style="display: none;">
				<ul>
					<li>
						<a href="/m/sy/baike/goufangliuchen/qyrg/12120.html">不看后悔！房产证名字写谁的好？</a>
					</li>
				</ul>
				<ul>
					<li>
						<a href="/m/sy/baike/goufangliuchen/qyrg/12117.html">房产证办理需要多久？记好这些办理注意事项不吃亏</a>
					</li>
				</ul>
				<ul>
					<li>
						<a href="/m/sy/baike/goufangliuchen/qyrg/12116.html">六步教你学会新房的认购流程</a>
					</li>
				</ul>
				<ul>
					<li>
						<a href="/m/sy/baike/goufangliuchen/qyrg/12115.html">新房认购签约时需要注意哪些事项</a>
					</li>
				</ul>

			</article>
			<article class="column4" style="display: none;">
				<ul>
					<li>
						<a href="/m/sy/baike/goufangliuchen/dkbl/12237.html">注意！${citycn}提取公积金有新变化！</a>
					</li>
				</ul>
				<ul>
					<li>
						<a href="/m/sy/baike/goufangliuchen/dkbl/12130.html">房屋贷款主要的3种类型</a>
					</li>
				</ul>
				<ul>
					<li>
						<a href="/m/sy/baike/goufangliuchen/dkbl/12129.html">公积金可以在异地买房吗？</a>
					</li>
				</ul>
				<ul>
					<li>
						<a href="/m/sy/baike/goufangliuchen/dkbl/12128.html">快速掌握贷款买房小窍门！让你购房更轻松</a>
					</li>
				</ul>
				<ul>
					<li>
						<a href="/m/sy/baike/goufangliuchen/dkbl/12127.html">买房贷款时间越长越好？怎样选择合适的贷款年限！</a>
					</li>
				</ul>
				<ul>
					<li>
						<a href="/m/sy/baike/goufangliuchen/dkbl/12125.html">全款买房和贷款买房哪个更省钱？贷款买房要小心这些陷阱！</a>
					</li>
				</ul>

			</article>
			<article class="column5" style="display: none;">
				<ul>
					<li>
						<a href="/m/sy/baike/goufangliuchen/sfyf/12068.html">收房时要注意哪些事项？</a>
					</li>
				</ul>
				<ul>
					<li>
						<a href="/m/sy/baike/goufangliuchen/sfyf/12067.html">新房和二手房在收房时有什么区别？</a>
					</li>
				</ul>
				<ul>
					<li>
						<a href="/m/sy/baike/goufangliuchen/sfyf/12066.html">新房入住的交接流程，需要注意什么？</a>
					</li>
				</ul>

			</article>
			<article class="column6" style="display: none;">
				<ul>
					<li>
						<a href="/m/sy/baike/goufangliuchen/cqlz/12064.html">不动产权证、房产证区别</a>
					</li>
				</ul>
				<ul>
					<li>
						<a href="/m/sy/baike/goufangliuchen/cqlz/12063.html">产权证迟迟拿不到？教你这么做！</a>
					</li>
				</ul>
				<ul>
					<li>
						<a href="/m/sy/baike/goufangliuchen/cqlz/12060.html">哪些房子拿不到不动产证？</a>
					</li>
				</ul>

			</article>--%>

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
				$('.scrollss > article').hide();
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

</html>
