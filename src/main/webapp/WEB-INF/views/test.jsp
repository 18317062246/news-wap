<%--
  Created by yuhai.
  Date: 2020/5/11
  Time: 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.*,java.util.*" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Title</title>
</head>
<body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"></script>
<img src="${pageContext.request.contextPath}/images/zhongyuan.png"/>
<table border="1" align="center" width="50%">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Age</th>
    </tr>
    <c:forEach items="${list }" var="user">
        <tr>
            <td>${user.userid }</td>
            <td>${user.username }</td>
            <td>${user.userage }</td>
        </tr>
    </c:forEach>
    <%
        String str = (String) request.getAttribute("name");

    %>
    城市简拼:<%=str%>
    <a onclick="clickMe('<%=str%>','<%=str%>')">点击我</a>

    <p>
        今天的日期是: <%= (new java.util.Date()).toLocaleString()%>
    </p>



</table>
<ul>
    <li>1</li>
    <img src="${pageContext.request.contextPath}/images/person.png" style="width: 288px;height: 216px;" name="person">
    <li>2</li>
    <img src="${pageContext.request.contextPath}/images/person.png" style="width: 288px;height: 216px;" name="person">
    <li>3</li>
    <img src="${pageContext.request.contextPath}/images/person.png" style="width: 288px;height: 216px;" name="person">
    <li>4</li>
    <img src="${pageContext.request.contextPath}/images/person.png" style="width: 288px;height: 216px;" name="person">
    <li>5</li>
    <img src="${pageContext.request.contextPath}/images/person.png" style="width: 288px;height: 216px;" name="person">
</ul>

<div>
    <h2>畅销书排行</h2>
    <ul>
        <li id="firstLi"><a href="#"><span>1</span>不抱怨的世界</a></li>
        <li id="secondLi"><a href="#"><span>2</span>遇见未知的世界</a></li>
        <li id="threeLi"><a href="#"><span>3</span>活法</a></li>
        <li id="fourLi"><a href="#"><span>4</span>高效能人士的七个习惯</a></li>
        <li id="fiveLi"><a href="#"><span>5</span>被迫强大</a></li>
        <li id="sixLi"><a href="#"><span>6</span>遇见心想事成的自己</a></li>
    </ul></div>

</body>
<script type="text/javascript">
    function clickMe(data,obj) {
        alert(data);
    }
    var li = document.getElementsByTagName("li");
    var person = document.getElementsByName("person");
    $("img[name='person']:gt(2)").css('display' , 'block');
    $("img[name='person']:lt(2)").css('display' , 'block');
</script>
<style type="text/css">
    ul img {
        display: none;
    }
    /*li {
        background: #f87047;
        border-radius: 50em;
        color: #fff;

    }*/




    #firstLi span{
        text-align: center;
        display:inline-block;
        background-color:#f87047;
        width: 25px;
        height: 25px;
        border-radius: 50%;
        line-height: 25px;
        font-size: 18px;
        color: #fff;
        margin-right: 10px;
        font-style: italic;
        font-weight: bolder;

    }

    #secondLi span{
        text-align: center;
        display:inline-block;
        background-color:#ffc80a;
        width: 25px;
        height: 25px;
        border-radius: 50%;
        line-height: 25px;
        font-size: 18px;
        color: #fff;
        margin-right: 10px;
        font-style: italic;
        font-weight: bolder;
    }

    #threeLi span{
        text-align: center;
        display:inline-block;
        background-color:#29b6f6;
        width: 25px;
        height: 25px;
        border-radius: 50%;
        line-height: 25px;
        font-size: 18px;
        color: #fff;
        margin-right: 10px;
        font-style: italic;
        font-weight: bolder;
    }

    #fourLi span{
        text-align: center;
        display:inline-block;
        width: 25px;
        height: 25px;
        border-radius: 50%;
        line-height: 25px;
        font-size: 18px;
        color: #c9c9c9;
        margin-right: 10px;
        font-style: italic;
        font-weight: bolder;
    }

    li{list-style-type: none;
        font-size: 12px;
        line-height: 35px;  }
    a{
        text-decoration: none;
        color:black;

    }
    a:hover{text-decoration:none;color: deepskyblue; }

</style>
</html>
