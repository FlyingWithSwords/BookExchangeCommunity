<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %>
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean"/>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="<%=basePath%>css/layui.css" media="all">
    <link rel="stylesheet" href="<%=basePath%>css/modules/code.css"
          media="all">
    <link rel="stylesheet"
          href="<%=basePath%>css/modules/laydate/default/laydate.css" media="all">
    <link rel="stylesheet"
          href="<%=basePath%>css/modules/layer/default/layer.css" media="all">
    <script src="<%=basePath%>js/layui.js" charset="utf-8"></script>
    <style>
        .layui-nav-tree {
            vertical-align: top;
        }

        .layim-chat-main {
            line-height: 24px;
            font: 14px Helvetica Neue, Helvetica, PingFang SC, Tahoma, Arial,
            sans-serif;
            pointer-events: auto;
            color: #333;
            font-family: \5FAE\8F6F\96C5\9ED1;
            margin: 0;
            -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
            box-sizing: content-box;
            height: 100px;
            padding: 15px 15px 5px;
            overflow-x: hidden;
            overflow-y: auto;
        }

        .layim-chat-main ul li {
            line-height: 24px;
            font: 14px Helvetica Neue, Helvetica, PingFang SC, Tahoma, Arial,
            sans-serif;
            pointer-events: auto;
            color: #333;
            font-family: \5FAE\8F6F\96C5\9ED1;
            margin: 0;
            padding: 0;
            -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
            list-style: none;
            box-sizing: content-box;
            position: relative;
            font-size: 0;
            margin-bottom: 10px;
            padding-left: 60px;
            min-height: 68px;
        }

        .layim-chat-user {
            line-height: 24px;
            font: 14px Helvetica Neue, Helvetica, PingFang SC, Tahoma, Arial,
            sans-serif;
            pointer-events: auto;
            color: #333;
            font-family: \5FAE\8F6F\96C5\9ED1;
            list-style: none;
            margin: 0;
            padding: 0;
            -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
            box-sizing: content-box;
            display: inline-block;
            vertical-align: top;
            font-size: 14px;
            position: absolute;
            left: 3px;
        }

        .layim-chat-user img {
            line-height: 24px;
            font: 14px Helvetica Neue, Helvetica, PingFang SC, Tahoma, Arial,
            sans-serif;
            pointer-events: auto;
            color: #333;
            font-family: \5FAE\8F6F\96C5\9ED1;
            list-style: none;
            -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
            font-size: 14px;
            display: inline-block;
            vertical-align: middle;
            border: none;
            box-sizing: content-box;
            width: 40px;
            height: 40px;
            border-radius: 100%;
        }

        .layim-chat-user cite {
            position: absolute;
            left: 60px;
            top: -2px;
            width: 500px;
            line-height: 24px;
            font-size: 12px;
            white-space: nowrap;
            color: #999;
            text-align: left;
            font-style: normal;
        }

        .layim-chat-user cite i {
            padding-left: 15px;
            font-style: normal;
        }

        .layim-chat-text {
            position: relative;
            line-height: 22px;
            margin-top: 25px;
            padding: 8px 15px;
            background-color: #e2e2e2;
            border-radius: 3px;
            color: #333;
            word-break: break-all;
            max-width: 462px \9;
        }

        .layim-chat-text:after {
            content: '';
            position: absolute;
            left: -10px;
            top: 13px;
            width: 0;
            height: 0;
            border-style: solid dashed dashed;
            border-color: #e2e2e2 transparent transparent;
            overflow: hidden;
            border-width: 10px;
        }

        .layim-chat-main ul .layim-chat-mine {
            text-align: right;
            padding-left: 0;
            padding-right: 60px;
        }

        .layim-chat-main ul li {
            position: relative;
            font-size: 0;
            margin-bottom: 10px;
            padding-left: 60px;
            min-height: 68px;
        }

        .layim-chat-mine .layim-chat-user {
            left: auto;
            right: 3px;
        }

        .layim-chat-user {
            position: absolute;
            left: 3px;
        }

        .layim-chat-text, .layim-chat-user {
            display: inline-block;
            *display: inline;
            *zoom: 1;
            vertical-align: top;
            font-size: 14px;
        }

        .layim-chat-user img {
            width: 40px;
            height: 40px;
            border-radius: 100%;
        }

        .layim-chat-mine .layim-chat-user cite {
            left: auto;
            right: 60px;
            text-align: right;
        }

        .layim-chat-user cite {
            position: absolute;
            left: 60px;
            top: -2px;
            width: 500px;
            line-height: 24px;
            font-size: 12px;
            white-space: nowrap;
            color: #999;
            text-align: left;
            font-style: normal;
        }

        .layim-chat-mine .layim-chat-user cite i {
            padding-left: 0;
            padding-right: 15px;
        }

        .layim-chat-mine .layim-chat-text {
            margin-left: 0;
            text-align: left;
            background-color: #00a2ff;
            color: #fff;
        }

        .layim-chat-mine .layim-chat-text:after {
            left: auto;
            right: -10px;
            border-top-color: #00a2ff;
        }
    </style>
    <script>
        layui.use('element', function () {
            var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

            //监听导航点击
            element.on('nav(demo)', function (elem) {
                //console.log(elem)
                layer.msg(elem.text());
            });
        });
    </script>
    <script language="javascript">
        window.location = "#bottom";//自动跳转到锚点处
    </script>
    <title>聊天界面</title>
</head>
<body style="background: #efefef;width: 88.6%;min-width: 1020px;">
<div style="margin-top:50px;"></div>
<%
    request.setCharacterEncoding("utf-8");
    String id = "";
    String mine = (String) session.getAttribute("user");
    if (request.getParameter("id") == null) {
%>
<div align="center" style="margin-top: 250px; opacity: 0.5;">
    <img src="<%=basePath%>pic/nobody.png" width="300px" height="300px"/>
</div>
<% } else if (mine == null) {%>
<div align="center" style="margin-top:50px"><h3 style="color:#7f7f7f;">请先登录！</h3></div>
<%
} else {
    id = request.getParameter("id");
    List flist = cb.getCom("select * from user where id='" + id + "'", 10);
    if (!flist.isEmpty()) {
        for (int ai = 0; ai < flist.size(); ai++) {
            List list2 = (List) flist.get(ai);
            String caller = list2.get(1).toString();
            List flist1 = cb.getCom("select * from communicate where username='" + mine + "' and becaller='" + caller + "' or username='" + caller + "' and becaller='" + mine + "' order by time asc", 5);
            if (!flist1.isEmpty()) {
                for (int bi = 0; bi < flist1.size(); bi++) {
                    List list3 = (List) flist1.get(bi);
%>
<div class="layim-chat-main">
    <ul>
        <%if (list3.get(1).toString().equals(caller)) {%>
        <li data-cid="<%=bi %>">
            <div class="layim-chat-user">
                <img src="<%=basePath+list2.get(9).toString()%>"><cite><%=caller %><i><%=list3.get(3).toString().substring(0, list3.get(3).toString().length() - 2) %>
            </i></cite>
            </div>
            <div class="layim-chat-text"><%=list3.get(2).toString() %>
            </div>
        </li>
        <%
        } else if (list3.get(1).toString().equals(mine)) {
        %>
        <li class="layim-chat-mine">
            <div class="layim-chat-user">
                <img src="<%=basePath+list2.get(9).toString()%>"><cite><i><%=list3.get(3).toString().substring(0, list3.get(3).toString().length() - 2) %>
            </i><%=mine %>
            </cite>
            </div>
            <div class="layim-chat-text"><%=list3.get(2).toString() %>
            </div>
        </li>
        <%} %>
    </ul>
</div>
<%
        }
    }
%>
<div style="margin-bottom:35%;"></div>
<div style="background: #fff; padding: 5px; border-radius: 6px; position: fixed; z-index: 2; top: 100%; margin-top: -365px; left: 50%; margin-left: -545px; margin-buttom:100px;box-shadow: #666 5px 5px 10px 1px;">
    <iframe src="<%=basePath%>editor/jsp/demo2.jsp?id=<%=id %>&caller=<%=caller %>" width="900px"
            height="280px" style="border: 0px; position: relative; padding: 0;"
            scrolling="no" frameborder="0"></iframe>
</div>
<%
            }
        }
    }
%>
<a name="bottom"></a><!--锚点处-->
</body>
</html>