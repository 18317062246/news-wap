<%--
  Created by IntelliJ IDEA.
  User: wbyuhai
  Date: 2020/07/15
  Time: 14:28
  错误页面展示
--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.*,java.util.*" %>
<html>
<head>
    <c:set var="errorurl" value="https://static.centanet.com/news/2020071434/m"></c:set>
    <link rel="icon" href="${errorurl}/images/favicon.ico" type="image/x-icon"/>

    <title>404</title>
    <style>
        html,
        body {
            width: 100%;
            height: 100%;
            margin: 0;
            padding: 0;
        }

        .wrap {
            width: 550px;
            height: 350px;
            margin: 0 auto;
            /*水平居中*/
            position: relative;
            top: 50%;
            /*偏移*/
            margin-top: -150px;
        }

        .wrap img {
            width: 100%;
            height: 100%;
            position: absolute;
            top: 50%;
            left: 50%;
            margin-top: -200px;
            margin-left: -250px;
        }

        .wrap p {
            text-align: center;
        }

        .wrap .text {
            font-size: 30px;
            color: #567792;
            margin: auto;
            width: 600px;
            bottom: -15px;
            position: absolute;
        }

        .wrap .go-back {
            font-size: 18px;
            color: #333;
            line-height: 26px;
        }

        .wrap .go-back span {
            color: #138bca;
        }

        #goBack {
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="wrap">
    <img src="${errorurl}/images/error.png" />
    <p class="text">资讯处于下架状态,暂时无法访问～</p>
</div>
</body>
</html>

