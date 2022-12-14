<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8" %>
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean"/>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String member = (String) session.getAttribute("user");
%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>主要内容区main</title>
    <link href="<%=basePath %>admin/css/css.css" type="text/css" rel="stylesheet"/>
    <link href="<%=basePath %>admin/css/main.css" type="text/css" rel="stylesheet"/>
    <style>
        body {
            overflow-x: hidden;
            background: #f2f0f5;
            padding: 15px 0px 10px 5px;
        }

        #main {
            font-size: 12px;
        }

        #main span.time {
            font-size: 14px;
            color: #00a2ff;
            width: 100%;
            padding-bottom: 10px;
            float: left
        }

        #main div.top {
            width: 100%;
            background: url(<%=basePath %>admin/images/main/main_r2_c2.jpg) no-repeat 0 10px;
            padding: 0 0 0 15px;
            line-height: 35px;
            float: left
        }

        #main div.sec {
            width: 100%;
            background: url(<%=basePath %>admin/images/main/main_r2_c2.jpg) no-repeat 0 15px;
            padding: 0 0 0 15px;
            line-height: 35px;
            float: left
        }

        .left {
            float: left
        }

        #main div a {
            float: left
        }

        #main span.num {
            font-size: 30px;
            color: #538ec6;
            font-family: "Georgia", "Tahoma", "Arial";
        }

        .left {
            float: left
        }

        div.main-tit {
            font-size: 14px;
            font-weight: bold;
            color: #4e4e4e;
            background: url(<%=basePath %>admin/images/main/main_r4_c2.jpg) no-repeat 0 33px;
            width: 100%;
            padding: 30px 0 0 20px;
            float: left
        }

        div.main-con {
            width: 100%;
            float: left;
            padding: 10px 0 0 20px;
            line-height: 36px;
        }

        div.main-corpy {
            font-size: 14px;
            font-weight: bold;
            color: #4e4e4e;
            background: url(<%=basePath %>admin/images/main/main_r6_c2.jpg) no-repeat 0 33px;
            width: 100%;
            padding: 30px 0 0 20px;
            float: left
        }

        div.main-order {
            line-height: 30px;
            padding: 10px 0 0 0;
        }
    </style>
</head>
<body>
<!--main_top-->
<table width="99%" border="0" cellspacing="0" cellpadding="0" id="main">
    <tr>
        <td colspan="2" align="left" valign="top">
            <span class="time"><strong>欢迎：<%=member %>   </strong></span>
            <div class="top"><span class="left"></div>
            <div class="sec"></div>
        </td>
    </tr>


</table>
</body>
</html>