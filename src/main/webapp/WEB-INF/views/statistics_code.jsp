<%--
  Created by IntelliJ IDEA.
  User: wbyuhai
  Date: 2020/6/2
  Time: 18:03
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <c:choose>

        <%-- 北京城市百度和piwik统计代码 --%>
        <c:when test="${cityen == 'bj'}">
            <div style="display: none">
                <script>
                    var _hmt = _hmt || [];
                    (function () {
                        var hm = document.createElement("script");
                        hm.src = "//hm.baidu.com/hm.js?219872fb6de637cac5884769682da5ad";
                        var s = document.getElementsByTagName("script")[0];
                        s.parentNode.insertBefore(hm, s);
                    })();
                </script>
            </div>
            <script type="text/javascript">
                var pkBaseURL = (("https:" == document.location.protocol) ? "https://statistics.centanet.com/stat/" : "//statistics.centanet.com/stat/");
                document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
            </script>

            <script type="text/javascript">
                try {
                    var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 16);
                    piwikTracker.trackPageView();
                    piwikTracker.enableLinkTracking();
                }
                catch (err) { }
            </script>
            <noscript>
                <p>
                    <img src="//statistics.centanet.com/stat/piwik.php?idsite=16" style="border:0" alt="" />
                </p>
            </noscript><!-- End Piwik Tracking Code -->
        </c:when>

        <%-- 广州城市百度和piwik统计代码 --%>
        <c:when test="${cityen == 'gz'}">

            <div style="display: none">
                <script>
                    var _hmt = _hmt || [];
                    (function () {
                        var hm = document.createElement("script");
                        hm.src = "//hm.baidu.com/hm.js?d3af5bf07cfbbe72e667fafc6599a52c";
                        var s = document.getElementsByTagName("script")[0];
                        s.parentNode.insertBefore(hm, s);
                    })();
                </script>
            </div>
            <script type="text/javascript">
                var pkBaseURL = (("https:" == document.location.protocol) ? "https://statistics.centanet.com/stat/" : "//statistics.centanet.com/stat/");
                document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
            </script>

            <script type="text/javascript">
                try {
                    var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 16);
                    piwikTracker.trackPageView();
                    piwikTracker.enableLinkTracking();
                }
                catch (err) { }
            </script>
            <noscript>
                <p>
                    <img src="//statistics.centanet.com/stat/piwik.php?idsite=16" style="border:0" alt="" />
                </p>
            </noscript><!-- End Piwik Tracking Code -->
        </c:when>

        <%-- 武汉城市百度和piwik统计代码 --%>
        <c:when test="${cityen == 'wh'}">

            <div style="display: none">
                <script>
                    var _hmt = _hmt || [];
                    (function () {
                        var hm = document.createElement("script");
                        hm.src = "//hm.baidu.com/hm.js?4e7fa5ad81abe58a299a64870b79c27d";
                        var s = document.getElementsByTagName("script")[0];
                        s.parentNode.insertBefore(hm, s);
                    })();
                </script>
            </div>
            <script type="text/javascript">
                var pkBaseURL = (("https:" == document.location.protocol) ? "https://statistics.centanet.com/stat/" : "//statistics.centanet.com/stat/");
                document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
            </script>

            <script type="text/javascript">
                try {
                    var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 16);
                    piwikTracker.trackPageView();
                    piwikTracker.enableLinkTracking();
                }
                catch (err) { }
            </script>
            <noscript>
                <p>
                    <img src="//statistics.centanet.com/stat/piwik.php?idsite=16" style="border:0" alt="" />
                </p>
            </noscript><!-- End Piwik Tracking Code -->
        </c:when>

        <%-- 南京城市百度和piwik统计代码 --%>
        <c:when test="${cityen == 'nj'}">
            <div style="display: none">
                <script>
                    var _hmt = _hmt || [];
                    (function () {
                        var hm = document.createElement("script");
                        hm.src = "//hm.baidu.com/hm.js?8f3de1327dc48d80678dc34da6755856";
                        var s = document.getElementsByTagName("script")[0];
                        s.parentNode.insertBefore(hm, s);
                    })();
                </script>
            </div>
            <script type="text/javascript">
                var pkBaseURL = (("https:" == document.location.protocol) ? "https://statistics.centanet.com/stat/" : "//statistics.centanet.com/stat/");
                document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
            </script>

            <script type="text/javascript">
                try {
                    var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 16);
                    piwikTracker.trackPageView();
                    piwikTracker.enableLinkTracking();
                }
                catch (err) { }
            </script>
            <noscript>
                <p>
                    <img src="//statistics.centanet.com/stat/piwik.php?idsite=16" style="border:0" alt="" />
                </p>
            </noscript><!-- End Piwik Tracking Code -->

        </c:when>

        <%-- 东莞城市百度和piwik统计代码 --%>
        <c:when test="${cityen == 'dg'}">
            <div style="display: none">
                <script>
                    var _hmt = _hmt || [];
                    (function () {
                        var hm = document.createElement("script");
                        hm.src = "//hm.baidu.com/hm.js?2f6d616e8e52a77d771d325d2647cf4c";
                        var s = document.getElementsByTagName("script")[0];
                        s.parentNode.insertBefore(hm, s);
                    })();
                </script>
            </div>
            <script type="text/javascript">
                var pkBaseURL = (("https:" == document.location.protocol) ? "https://statistics.centanet.com/stat/" : "//statistics.centanet.com/stat/");
                document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
            </script>

            <script type="text/javascript">
                try {
                    var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 16);
                    piwikTracker.trackPageView();
                    piwikTracker.enableLinkTracking();
                }
                catch (err) { }
            </script>
            <noscript>
                <p>
                    <img src="//statistics.centanet.com/stat/piwik.php?idsite=16" style="border:0" alt="" />
                </p>
            </noscript><!-- End Piwik Tracking Code -->
        </c:when>

        <%-- 佛山城市百度和piwik统计代码 --%>
        <c:when test="${cityen == 'fs'}">
            <div style="display: none">
                <script>
                    var _hmt = _hmt || [];
                    (function () {
                        var hm = document.createElement("script");
                        hm.src = "//hm.baidu.com/hm.js?9d140f7f31673e85dd833d039c5e064f";
                        var s = document.getElementsByTagName("script")[0];
                        s.parentNode.insertBefore(hm, s);
                    })();
                </script>
            </div>
            <script type="text/javascript">
                var pkBaseURL = (("https:" == document.location.protocol) ? "https://statistics.centanet.com/stat/" : "//statistics.centanet.com/stat/");
                document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
            </script>

            <script type="text/javascript">
                try {
                    var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 16);
                    piwikTracker.trackPageView();
                    piwikTracker.enableLinkTracking();
                }
                catch (err) { }
            </script>
            <noscript>
                <p>
                    <img src="//statistics.centanet.com/stat/piwik.php?idsite=16" style="border:0" alt="" />
                </p>
            </noscript><!-- End Piwik Tracking Code -->
        </c:when>



        <%-- 珠海城市百度和piwik统计代码 --%>
        <c:when test="${cityen == 'zh'}">
            <div style="display: none">
                <script>
                    var _hmt = _hmt || [];
                    (function () {
                        var hm = document.createElement("script");
                        hm.src = "//hm.baidu.com/hm.js?4fbbbc8d2c74eb9c962bfba45954967a";
                        var s = document.getElementsByTagName("script")[0];
                        s.parentNode.insertBefore(hm, s);
                    })();
                </script>
            </div>
            <script type="text/javascript">
                var pkBaseURL = (("https:" == document.location.protocol) ? "https://statistics.centanet.com/stat/" : "//statistics.centanet.com/stat/");
                document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
            </script>

            <script type="text/javascript">
                try {
                    var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 16);
                    piwikTracker.trackPageView();
                    piwikTracker.enableLinkTracking();
                }
                catch (err) { }
            </script>
            <noscript>
                <p>
                    <img src="//statistics.centanet.com/stat/piwik.php?idsite=16" style="border:0" alt="" />
                </p>
            </noscript><!-- End Piwik Tracking Code -->
        </c:when>

        <%-- 长沙城市百度和piwik统计代码 --%>
        <c:when test="${cityen == 'cs'}">
            <div style="display: none">
                <script>
                    var _hmt = _hmt || [];
                    (function () {
                        var hm = document.createElement("script");
                        hm.src = "//hm.baidu.com/hm.js?d1253c256287c312b64e372be0f329e9";
                        var s = document.getElementsByTagName("script")[0];
                        s.parentNode.insertBefore(hm, s);
                    })();
                </script>
            </div>
            <script type="text/javascript">
                var pkBaseURL = (("https:" == document.location.protocol) ? "https://statistics.centanet.com/stat/" : "//statistics.centanet.com/stat/");
                document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
            </script>

            <script type="text/javascript">
                try {
                    var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 16);
                    piwikTracker.trackPageView();
                    piwikTracker.enableLinkTracking();
                }
                catch (err) { }
            </script>
            <noscript>
                <p>
                    <img src="//statistics.centanet.com/stat/piwik.php?idsite=16" style="border:0" alt="" />
                </p>
            </noscript><!-- End Piwik Tracking Code -->
        </c:when>

        <%-- 长春城市百度和piwik统计代码 --%>
        <c:when test="${cityen == 'cc'}">
            <div style="display: none">
                <script>
                    var _hmt = _hmt || [];
                    (function () {
                        var hm = document.createElement("script");
                        hm.src = "//hm.baidu.com/hm.js?9e60d61e23f8fd34caec6dc214596e61";
                        var s = document.getElementsByTagName("script")[0];
                        s.parentNode.insertBefore(hm, s);
                    })();
                </script>
            </div>
            <script type="text/javascript">
                var pkBaseURL = (("https:" == document.location.protocol) ? "https://statistics.centanet.com/stat/" : "//statistics.centanet.com/stat/");
                document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
            </script>

            <script type="text/javascript">
                try {
                    var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 16);
                    piwikTracker.trackPageView();
                    piwikTracker.enableLinkTracking();
                }
                catch (err) { }
            </script>
            <noscript>
                <p>
                    <img src="//statistics.centanet.com/stat/piwik.php?idsite=16" style="border:0" alt="" />
                </p>
            </noscript><!-- End Piwik Tracking Code -->
        </c:when>

        <%-- 沈阳城市百度和piwik统计代码 --%>
        <c:when test="${cityen == 'sy'}">
            <div style="display: none">
                <script>
                    var _hmt = _hmt || [];
                    (function () {
                        var hm = document.createElement("script");
                        hm.src = "//hm.baidu.com/hm.js?9b3fcfcc3867810b024107e15ec07060";
                        var s = document.getElementsByTagName("script")[0];
                        s.parentNode.insertBefore(hm, s);
                    })();
                </script>
            </div>
            <script type="text/javascript">
                var pkBaseURL = (("https:" == document.location.protocol) ? "https://statistics.centanet.com/stat/" : "//statistics.centanet.com/stat/");
                document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
            </script>

            <script type="text/javascript">
                try {
                    var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 16);
                    piwikTracker.trackPageView();
                    piwikTracker.enableLinkTracking();
                }
                catch (err) { }
            </script>
            <noscript>
                <p>
                    <img src="//statistics.centanet.com/stat/piwik.php?idsite=16" style="border:0" alt="" />
                </p>
            </noscript><!-- End Piwik Tracking Code -->
        </c:when>

        <%-- 大连城市百度和piwik统计代码 --%>
        <c:when test="${cityen == 'dl'}">
            <div style="display: none">
                <script>
                    var _hmt = _hmt || [];
                    (function () {
                        var hm = document.createElement("script");
                        hm.src = "//hm.baidu.com/hm.js?d7e057980a269e00ba70794666dd0ae4";
                        var s = document.getElementsByTagName("script")[0];
                        s.parentNode.insertBefore(hm, s);
                    })();
                </script>
            </div>
            <script type="text/javascript">
                var pkBaseURL = (("https:" == document.location.protocol) ? "https://statistics.centanet.com/stat/" : "//statistics.centanet.com/stat/");
                document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
            </script>

            <script type="text/javascript">
                try {
                    var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 16);
                    piwikTracker.trackPageView();
                    piwikTracker.enableLinkTracking();
                }
                catch (err) { }
            </script>
            <noscript>
                <p>
                    <img src="//statistics.centanet.com/stat/piwik.php?idsite=16" style="border:0" alt="" />
                </p>
            </noscript><!-- End Piwik Tracking Code -->
        </c:when>

        <%-- 哈尔滨城市百度和piwik统计代码 --%>
        <c:when test="${cityen == 'hrb'}">
            <div style="display: none">
                <script>
                    var _hmt = _hmt || [];
                    (function () {
                        var hm = document.createElement("script");
                        hm.src = "//hm.baidu.com/hm.js?9b3fcfcc3867810b024107e15ec07060";
                        var s = document.getElementsByTagName("script")[0];
                        s.parentNode.insertBefore(hm, s);
                    })();
                </script>
            </div>
            <script type="text/javascript">
                var pkBaseURL = (("https:" == document.location.protocol) ? "https://statistics.centanet.com/stat/" : "//statistics.centanet.com/stat/");
                document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
            </script>

            <script type="text/javascript">
                try {
                    var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 16);
                    piwikTracker.trackPageView();
                    piwikTracker.enableLinkTracking();
                }
                catch (err) { }
            </script>
            <noscript>
                <p>
                    <img src="//statistics.centanet.com/stat/piwik.php?idsite=16" style="border:0" alt="" />
                </p>
            </noscript><!-- End Piwik Tracking Code -->
        </c:when>



        <%-- 福州城市百度和piwik统计代码 --%>
        <c:when test="${cityen == 'fz'}">
            <div style="display: none">
                <script>
                    var _hmt = _hmt || [];
                    (function () {
                        var hm = document.createElement("script");
                        hm.src = "//hm.baidu.com/hm.js?3ed153a3c40ce29250ffbd4617651da0";
                        var s = document.getElementsByTagName("script")[0];
                        s.parentNode.insertBefore(hm, s);
                    })();
                </script>
            </div>
            <script type="text/javascript">
                var pkBaseURL = (("https:" == document.location.protocol) ? "https://statistics.centanet.com/stat/" : "//statistics.centanet.com/stat/");
                document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
            </script>

            <script type="text/javascript">
                try {
                    var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 16);
                    piwikTracker.trackPageView();
                    piwikTracker.enableLinkTracking();
                }
                catch (err) { }
            </script>
            <noscript>
                <p>
                    <img src="//statistics.centanet.com/stat/piwik.php?idsite=16" style="border:0" alt="" />
                </p>
            </noscript><!-- End Piwik Tracking Code -->
        </c:when>

        <%--&lt;%&ndash; 中山城市百度和piwik统计代码 &ndash;%&gt;
        <c:when test="${cityen == 'zs'}">

        </c:when>

        &lt;%&ndash; 厦门城市百度和piwik统计代码 &ndash;%&gt;
        <c:when test="${cityen == 'xm'}">

        </c:when>

        &lt;%&ndash; 杭州城市百度和piwik统计代码 &ndash;%&gt;
        <c:when test="${cityen == 'zj'}">

        </c:when>

        &lt;%&ndash; 肇庆城市百度和piwik统计代码 &ndash;%&gt;
        <c:when test="${cityen == 'zq'}">

        </c:when>--%>
    </c:choose>

