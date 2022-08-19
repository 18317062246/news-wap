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
            <script src="//static.centanet.com/public/chat/chat-2.0.js?v7.5.21" async defer></script><script type="text/javascript">var _hmt = _hmt || [];
            var pkBaseURL = "//statistics.centanet.com/stat/";
            (function(){
                /* 百度统计代码 */
                var hm = document.createElement("script");
                hm.src = "https://hm.baidu.com/hm.js?46d70d1b009c27274ef4c7bf70a1a581";
                var s = document.getElementsByTagName("script")[0];
                s.parentNode.insertBefore(hm, s);
                /*piwik*/
                var piwikScript = window["document"]["createElement"]("script");
                piwikScript["type"] = "text/javascript";
                piwikScript["charset"] = "utf-8";
                piwikScript["defer"] = "defer";
                piwikScript["onload"] = function(){
                    try {
                        var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 39);
                        piwikTracker.trackPageView();piwikTracker.enableLinkTracking();
                    } catch( err ) {}
                };
                piwikScript["src"] = pkBaseURL + "piwik.js";
                var head = document.head || document.getElementsByTagName('head')[0];
                head.appendChild(piwikScript);
            })();</script><noscript><p><img src="//statistics.centanet.com/stat/piwik.php?idsite=39" style="border:0" alt="" /></p></noscript>
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

        <c:when test="${cityen == 'sz'}">
            <script type="text/javascript">
                var _paq = _paq || [];
                var pkBaseURL  = "//sznewpiwik.centanet.com/stat/";
                (function(){
                    /* 百度统计代码 */
                    var hm = document.createElement("script");
                    hm.src = "https://hm.baidu.com/hm.js?5ba699e44b8a99227ac7a04f91a66196";
                    var s = document.getElementsByTagName("script")[0];
                    s.parentNode.insertBefore(hm, s);

                    var bp = document.createElement('script');
                    var curProtocol = window.location.protocol.split(':')[0];
                    if (curProtocol === 'https') {
                        bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
                    }
                    else {
                        bp.src = 'http://push.zhanzhang.baidu.com/push.js';
                    }
                    var s = document.getElementsByTagName("script")[0];
                    s.parentNode.insertBefore(bp, s);
                    /*piwik*/
                    var piwikScript = window["document"]["createElement"]("script");
                    piwikScript["type"] = "text/javascript";
                    piwikScript["charset"] = "utf-8";
                    piwikScript["defer"] = "defer";
                    piwikScript["onload"] = function(){
                        try {
                            var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 41);
                            piwikTracker.trackPageView();piwikTracker.enableLinkTracking();
                        } catch( err ) {}
                    };
                    piwikScript["src"] = pkBaseURL + "piwik.js";
                    var head = document.head || document.getElementsByTagName('head')[0];
                    head.appendChild(piwikScript);
                })();</script><noscript><p><img src="//sznewpiwik.centanet.com/stat/piwik.php?idsite=41" style="border:0" alt="" /></p></noscript>
        </c:when>

        <c:when test="${cityen == 'tj'}">
            <script type="text/javascript">

                var _hmt = _hmt || [];
                var pkBaseURL = "//statistics.centanet.com/stat/";
                (function(){
                    /* 百度统计代码 */
                    var hm = document.createElement("script");
                    hm.src = "https://hm.baidu.com/hm.js?5355df1cf87f7b87cd509f27a92fc4d7";
                    var s = document.getElementsByTagName("script")[0];
                    s.parentNode.insertBefore(hm, s);
                    /*piwik*/
                    var piwikScript = window["document"]["createElement"]("script");
                    piwikScript["type"] = "text/javascript";
                    piwikScript["charset"] = "utf-8";
                    piwikScript["defer"] = "defer";
                    piwikScript["onload"] = function(){
                        try {
                            var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 12);
                            piwikTracker.trackPageView();piwikTracker.enableLinkTracking();
                        } catch( err ) {}
                    };
                    piwikScript["src"] = pkBaseURL + "piwik.js";
                    var head = document.head || document.getElementsByTagName('head')[0];
                    head.appendChild(piwikScript);
                })();</script><noscript><p><img src="//statistics.centanet.com/stat/piwik.php?idsite=12" style="border:0" alt="" /></p></noscript>
        </c:when>

        <%--        上海百度统计代码--%>
        <c:when test="${cityen == 'sh'}">
            <script>
                var _hmt = _hmt || [];
                (function() {
                    var hm = document.createElement("script");
                    hm.src = "https://hm.baidu.com/hm.js?cca621fa3a3d819c5f22f0cf33e5e2d8";
                    var s = document.getElementsByTagName("script")[0];
                    s.parentNode.insertBefore(hm, s);
                })();
            </script>
        </c:when>

        <c:when test="${cityen == 'xm'}">
            <script type="text/javascript">
                var pkBaseURL = "//statistics.centanet.com/stat/";
                (function(){
                    /* 百度统计代码 */
                    var hm = document.createElement("script");
                    hm.src = "https://hm.baidu.com/hm.js?acbbc78202b4846d4a5831521ccf7c45";
                    var s = document.getElementsByTagName("script")[0];
                    s.parentNode.insertBefore(hm, s);
                    /*piwik*/
                    var piwikScript = window["document"]["createElement"]("script");
                    piwikScript["type"] = "text/javascript";
                    piwikScript["charset"] = "utf-8";
                    piwikScript["defer"] = "defer";
                    piwikScript["onload"] = function(){
                        try {
                            var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 44);
                            piwikTracker.trackPageView();piwikTracker.enableLinkTracking();
                        } catch( err ) {}
                    };
                    piwikScript["src"] = pkBaseURL + "piwik.js";
                    var head = document.head || document.getElementsByTagName('head')[0];
                    head.appendChild(piwikScript);
                })();</script><noscript><p><img src="//statistics.centanet.com/stat/piwik.php?idsite=44" style="border:0" alt="" /></p></noscript>
        </c:when>

        <c:when test="${cityen == 'nb'}">
            <script type="text/javascript">
                var _hmt = _hmt || [];
                var pkBaseURL = "//statistics.centanet.com/stat/";
                (function(){
                    /* 百度统计代码 */
                    var hm = document.createElement("script");
                    hm.src = "https://hm.baidu.com/hm.js?6fb464487d596d8be4d9bdc7a25128e4";
                    var s = document.getElementsByTagName("script")[0];
                    s.parentNode.insertBefore(hm, s);
                    /*piwik*/
                    var piwikScript = window["document"]["createElement"]("script");
                    piwikScript["type"] = "text/javascript";
                    piwikScript["charset"] = "utf-8";
                    piwikScript["defer"] = "defer";
                    piwikScript["onload"] = function(){
                        try {
                            var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 36);
                            piwikTracker.trackPageView();piwikTracker.enableLinkTracking();
                        } catch( err ) {}
                    };
                    piwikScript["src"] = pkBaseURL + "piwik.js";
                    var head = document.head || document.getElementsByTagName('head')[0];
                    head.appendChild(piwikScript);
                })();
            </script>
            <noscript><p><img src="//statistics.centanet.com/stat/piwik.php?idsite=36" style="border:0" alt="" /></p></noscript>
        </c:when>

        <c:when test="${cityen == 'zs'}">
            <script type="text/javascript">
                var _hmt = _hmt || [];
                var pkBaseURL = "//statistics.centanet.com/stat/";
                (function(){
                    /* 百度统计代码 */
                    var hm = document.createElement("script");
                    hm.src = "https://hm.baidu.com/hm.js?1578a27ed0974189bd3a893f9240b0ca";
                    var s = document.getElementsByTagName("script")[0];
                    s.parentNode.insertBefore(hm, s);
                    /*piwik*/
                    var piwikScript = window["document"]["createElement"]("script");
                    piwikScript["type"] = "text/javascript";
                    piwikScript["charset"] = "utf-8";
                    piwikScript["defer"] = "defer";
                    piwikScript["onload"] = function(){
                        try {
                            var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php",43);
                            piwikTracker.trackPageView();piwikTracker.enableLinkTracking();
                        } catch( err ) {}
                    };
                    piwikScript["src"] = pkBaseURL + "piwik.js";
                    var head = document.head || document.getElementsByTagName('head')[0];
                    head.appendChild(piwikScript);
                })();
            </script>
            <noscript><p><img src="//statistics.centanet.com/stat/piwik.php?idsite=43" style="border:0" alt="" /></p></noscript>
        </c:when>

        <c:when test="${cityen == 'zj'}">
            <script type="text/javascript">
                var _hmt = _hmt || [];
                var pkBaseURL = "//statistics.centanet.com/stat/";
                (function(){
                    /* 百度统计代码 */
                    var hm = document.createElement("script");
                    hm.src = "https://hm.baidu.com/hm.js?cc857879870b96422ad7c1a271b2b1b0";
                    var s = document.getElementsByTagName("script")[0];
                    s.parentNode.insertBefore(hm, s);
                    /*piwik*/
                    var piwikScript = window["document"]["createElement"]("script");
                    piwikScript["type"] = "text/javascript";
                    piwikScript["charset"] = "utf-8";
                    piwikScript["defer"] = "defer";
                    piwikScript["onload"] = function(){
                        try {
                            var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 32);
                            piwikTracker.trackPageView();piwikTracker.enableLinkTracking();
                        } catch( err ) {}
                    };
                    piwikScript["src"] = pkBaseURL + "piwik.js";
                    var head = document.head || document.getElementsByTagName('head')[0];
                    head.appendChild(piwikScript);
                })();
            </script>
            <noscript><p><img src="//statistics.centanet.com/stat/piwik.php?idsite=32" style="border:0" alt="" /></p></noscript>
        </c:when>

        <c:when test="${cityen == 'zq'}">
            <script type="text/javascript">
                var _hmt = _hmt || [];
                var pkBaseURL = "//statistics.centanet.com/stat/";
                (function(){
                    /* 百度统计代码 */
                    var hm = document.createElement("script");
                    hm.src = "https://hm.baidu.com/hm.js?ffc3eb618888cc91ba1f77ecabd3edee";
                    var s = document.getElementsByTagName("script")[0];
                    s.parentNode.insertBefore(hm, s);
                    /*piwik*/
                    var piwikScript = window["document"]["createElement"]("script");
                    piwikScript["type"] = "text/javascript";
                    piwikScript["charset"] = "utf-8";
                    piwikScript["defer"] = "defer";
                    piwikScript["onload"] = function(){
                        try {
                            var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 46);
                            piwikTracker.trackPageView();piwikTracker.enableLinkTracking();
                        } catch( err ) {}
                    };
                    piwikScript["src"] = pkBaseURL + "piwik.js";
                    var head = document.head || document.getElementsByTagName('head')[0];
                    head.appendChild(piwikScript);
                })();
            </script>
            <noscript><p><img src="//statistics.centanet.com/stat/piwik.php?idsite=46" style="border:0" alt="" /></p></noscript>
        </c:when>

        <%--&lt;%&ndash; 中山城市百度和piwik统计代码 &ndash;%&gt;
        <c:when test="${cityen == 'zs'}">

        </c:when>



        &lt;%&ndash; 杭州城市百度和piwik统计代码 &ndash;%&gt;
        <c:when test="${cityen == 'zj'}">

        </c:when>

        &lt;%&ndash; 肇庆城市百度和piwik统计代码 &ndash;%&gt;
        <c:when test="${cityen == 'zq'}">

        </c:when>--%>
    </c:choose>

