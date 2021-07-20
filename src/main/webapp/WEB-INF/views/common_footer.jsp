<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="d_foot">
    <div data-v-c631e254="" class="appinfo" >
        <div data-v-c631e254="">
            <p data-v-c631e254="">开发者：中原（中国）房地产代理有限公司</p>
            <p data-v-c631e254="">版本：7.2.93</p></div>
        <p data-v-c631e254="">更新时间：2021年06月09日
            <span data-v-c631e254="" class="btn-blue">权限详情</span>
            <span data-v-c631e254="" class="btn-blue" onclick="zhengce()">隐私政策</span></p></div></div>
</div>

<div data-v-427b8ec9 class="role-dialog van-popup van-popup--bottom" style="z-index: 2002;display: none;">
    <div data-v-427b8ec9="" class="role-dialog van-popup van-popup--bottom" style="z-index: 2002;">
        <div data-v-427b8ec9="" class="title">权限详情</div>
        <div data-v-427b8ec9="" class="wrapper">
            <div data-v-427b8ec9="">
                <p data-v-427b8ec9="" class="first">读写系统设置</p>
                <p data-v-427b8ec9="" class="second">允许读写系统设置项</p>
                <p data-v-427b8ec9="" class="first">拍照权限</p>
                <p data-v-427b8ec9="" class="second">允许访问摄像头进行拍照</p>
                <p data-v-427b8ec9="" class="first">使用蓝牙</p>
                <p data-v-427b8ec9="" class="second">允许程序连接配对过的蓝牙设备</p>
                <p data-v-427b8ec9="" class="first">蓝牙管理</p>
                <p data-v-427b8ec9="" class="second">允许程序进行发现和配对新的蓝牙设备</p>
                <p data-v-427b8ec9="" class="first">修改声音设置</p>
                <p data-v-427b8ec9="" class="second">修改声音设置信息</p>
                <p data-v-427b8ec9="" class="first">连续广播</p>
                <p data-v-427b8ec9="" class="second">允许一个程序收到广播后快速收到下一个广播</p>
                <p data-v-427b8ec9="" class="first">读取电话状态</p>
                <p data-v-427b8ec9="" class="second">访问电话状态</p>
                <p data-v-427b8ec9="" class="first">改变网络状态</p>
                <p data-v-427b8ec9="" class="second">改变网络状态如是否能联网</p>
                <p data-v-427b8ec9="" class="first">访问网络</p>
                <p data-v-427b8ec9="" class="second">访问网络连接,可能产生GPRS流量</p>
                <p data-v-427b8ec9="" class="first">获取网络状态</p>
                <p data-v-427b8ec9="" class="second">获取网络信息状态,如当前的网络连接是否有效</p>
                <p data-v-427b8ec9="" class="first">获取WiFi状态</p>
                <p data-v-427b8ec9="" class="second">获取当前WiFi接入的状态以及WLAN热点的信息</p>
                <p data-v-427b8ec9="" class="first">使用振动</p>
                <p data-v-427b8ec9="" class="second">允许振动</p>
                <p data-v-427b8ec9="" class="first">写入外部存储</p>
                <p data-v-427b8ec9="" class="second">允许程序写入外部存储,如SD卡上写文件</p>
                <p data-v-427b8ec9="" class="first">获取错略位置</p>
                <p data-v-427b8ec9="" class="second">通过WiFi或移动基站的方式获取用户错略的经纬度信息,定位精度大概误差在30~1500米</p>
                <p data-v-427b8ec9="" class="first">访问定位额外命令</p>
                <p data-v-427b8ec9="" class="second">允许程序访问额外的定位提供者指令</p>
                <p data-v-427b8ec9="" class="first">获取精确位置</p><p data-v-427b8ec9="" class="second">通过GPS芯片接收卫星的定位信息,定位精度达10米以内</p><p data-v-427b8ec9="" class="first">改变WiFi状态</p><p data-v-427b8ec9="" class="second">改变WiFi状态</p><p data-v-427b8ec9="" class="first">拨打电话</p><p data-v-427b8ec9="" class="second">允许程序从非系统拨号器里输入电话号码</p><p data-v-427b8ec9="" class="first">录音</p><p data-v-427b8ec9="" class="second">录制声音通过手机或耳机的麦克</p><p data-v-427b8ec9="" class="first">使用闪光灯</p><p data-v-427b8ec9="" class="second">允许访问闪光灯</p><p data-v-427b8ec9="" class="first">获取任务信息</p><p data-v-427b8ec9="" class="second">允许程序获取当前或最近运行的应用</p><p data-v-427b8ec9="" class="first">唤醒锁定</p><p data-v-427b8ec9="" class="second">允许程序在手机屏幕关闭后后台进程仍然运行</p><p data-v-427b8ec9="" class="first">显示系统窗口</p><p data-v-427b8ec9="" class="second">显示系统窗口</p><p data-v-427b8ec9="" class="first">挂载文件系统</p><p data-v-427b8ec9="" class="second">挂载、反挂载外部文件系统</p><p data-v-427b8ec9="" class="first">开机自动允许</p><p data-v-427b8ec9="" class="second">允许程序开机自动运行</p></div></div>
        <i role="button" tabindex="0" class="van-icon van-icon-cross van-popup__close-icon van-popup__close-icon--top-right"><!----></i></div>

</div>
<script>
    $(".btn-blue").click(function () {
        $(".van-popup--bottom").css('display','block');
        $("body").css('background','gray');
        document.documentElement.style.overflow='hidden';
    });

    $(".van-popup__close-icon").click(function () {
        $(".van-popup--bottom").css('display','none');
        $("body").css('background','#fff');
        document.documentElement.style.overflow='scroll';
    });

    function zhengce() {
        window.location.href='//cftweb.3g.qq.com/privacy/agreement?appid=10890163';
    }
</script>
<style>
    .d_foot {
        margin-top: 10px;
        height: 80px;
    }
    .d_foot .appinfo {
        font-size: 12px;
        color: #939393;
        padding: 0 15px 15px;
        margin-top: -5px;
        buttom:0;
        left: 0;
        width: 100%;
    }
    div {
        font-style: normal;
        margin: 0;
        padding: 0;
        vertical-align: baseline;
        border: 0;
        outline: 0;
        background: transparent;
    }
    p {
        font-style: normal;
        margin: 0;
        padding: 0;
        vertical-align: baseline;
        border: 0;
        outline: 0;
        background: transparent;
    }

    .appinfo .btn-blue {
        margin-left: 10px;
        color: #4f7fba;
    }

    .role-dialog[data-v-427b8ec9] {
        width: 100%;
        height: 50%;
        position: fixed;
    }

    .van-popup--bottom {
        bottom: 0;
        left: 0;
        width: 100%;
    }

    .van-popup {
        position: fixed;
        max-height: 100%;
        overflow-y: auto;
        background-color: #fff;
        -webkit-transition: -webkit-transform .3s;
        transition: -webkit-transform .3s;
        transition: transform .3s;
        transition: transform .3s,-webkit-transform .3s;
        -webkit-overflow-scrolling: touch;
    }

    abbr, address, article, aside, audio, b, blockquote, body, canvas, caption, cite, code, dd, del, details, dfn, div, dl, dt, em, fieldset, figcaption, figure, footer, form, h1, h2, h3, h4, h5, h6, header, html, i, iframe, img, ins, kbd, label, legend, li, mark, menu, nav, object, ol, p, pre, q, samp, section, small, span, strong, sub, summary, sup, table, tbody, td, tfoot, th, thead, time, tr, ul, var, video {
        font-style: normal;
        margin: 0;
        padding: 0;
        vertical-align: baseline;
        border: 0;
        outline: 0;
        background: transparent;
    }

    *, :after, :before {
        box-sizing: border-box;
        touch-action: manipulation;
    }

    body {
        font-size: 14px!important;
        color: #474a4f;
        font-family: MicroSoft YaHei,PingFang-SC-Regular,Helvetica,"sans-serif"!important;

    }

    body {
        font-weight: 400;
        -webkit-tap-highlight-color: rgba(0,0,0,0);
    }

    .role-dialog .title[data-v-427b8ec9] {
        font-size: 20px;
        font-weight: 500;
        line-height: 30px;
        padding: 15px;
    }

    ::-webkit-scrollbar {
        width: 0;
        height: 0;
        background-color: transparent;
    }

    .role-dialog .wrapper[data-v-427b8ec9] {
        padding: 15px;
        height: calc(100% - 60px);
        overflow-y: scroll;
    }

    .role-dialog .wrapper .first[data-v-427b8ec9] {
        font-size: 15px;
        font-weight: 600;
        color: #333;
        margin-top: 15px;
    }

    .role-dialog .wrapper .second[data-v-427b8ec9] {
        font-size: 12px;
        color: #666;
        word-wrap: break-word;
        word-break: normal;
        white-space: pre-wrap;
    }

    .van-icon-cross {
        position: relative;
        width: 20px;
        height: 20px;
        margin-right: 2rem;
    }

    .van-icon-cross::before,
    .van-icon-cross::after
    {
        position: absolute;
        content: ' ';
        background-color: #c8c9cc;
        left: 20px;
        width: 1px;
        height: 20px;
    }
    .van-icon-cross::before {
        transform: rotate(45deg);
    }

    .van-icon-cross::after {
        transform: rotate(-45deg);
    }
    .van-icon::before {
        display: inline-block;
    }
    *, :after, :before {
        box-sizing: border-box;
        touch-action: manipulation;
    }

    .van-popup__close-icon--top-right {
        top: 16px;
        right: 16px;
    }

    .van-popup__close-icon {
        position: absolute;
        z-index: 1;
        color: #c8c9cc;
        font-size: 22px;
        cursor: pointer;
    }

    .van-icon::before {
        display: inline-block;
    }

    .van-popup__close-icon {
        position: absolute;
        z-index: 1;
        color: #c8c9cc;
        font-size: 22px;
        cursor: pointer;
    }
    .van-popup__close-icon--top-right {
        top: 16px;
        right: 16px;
    }

    .van-icon {
        position: relative;
        display: inline-block;
        font: normal normal normal 14px/1 vant-icon;
        font-size: inherit;
        text-rendering: auto;
        -webkit-font-smoothing: antialiased;
    }

    .van-popup__close-icon {
        position: absolute;
        z-index: 1;
        color: #c8c9cc;
        font-size: 22px;
        cursor: pointer;
    }
</style>