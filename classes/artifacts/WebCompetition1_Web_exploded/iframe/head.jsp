<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=utf-8"%>
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
	request.setCharacterEncoding("utf-8");
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
String user = (String) session.getAttribute("user");
String com = session.getAttribute("coms") == null ? "" : session.getAttribute("coms").toString();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>图书交流网</title>
<link type="text/css" href="<%=basePath%>css/css.css" rel="stylesheet" />
<link type="text/css" rel="stylesheet"
	href="<%=basePath%>css/layui.css" media="all">
<link type="text/css" rel="stylesheet"
	href="<%=basePath%>css/modules/code.css" media="all">
<link type="text/css" rel="stylesheet"
	href="<%=basePath%>css/modules/layer/default/layer.css" media="all">
<link type="text/css" rel="stylesheet"
	href="<%=basePath%>css/modules/laydate/default/laydate.css"
	media="all">
<script type="text/javascript"
	src="<%=basePath%>js/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/js.js"></script>
<script type="text/javascript" src="<%=basePath%>js/payfor.js"></script>
<script type="text/javascript" src="<%=basePath%>js/layui.js"></script>
<style type="text/css">
.search{
	position: fixed;
	z-index: 12;
	text-align: center;
}
.search form {
	position: relative;
	margin: 0px auto;
	top: -30px;
}

.search form p>* {
	display: inline-block;
	vertical-align: middle;
}

.search input {
	outline: none;
	float: left;
}

.search input[type=search] {
	-webkit-appearance: textfield;
	-webkit-box-sizing: content-box;
	font-size: 100%;
}

.search input::-webkit-search-decoration, .search input::-webkit-search-cancel-button
	{
	display: none;
}

.search input[type=submit] {
	background: #ededed
		url(http://webdesignerwall.com/demo/expandable-search-form/images/search-icon.png)
		no-repeat 8px;
	border: solid 1px #ccc;
	width: 36px;
	height: 36px;
	border-radius: 10em;
}

.search input[type=search] {
	/* 	background: #ededed url(http://webdesignerwall.com/demo/expandable-search-form/images/search-icon.png) no-repeat 9px; */
	border: solid 1px #ccc;
	padding: 9px 22px 9px 15px;
	width: 180px;
	margin-right: 320px;
	-webkit-border-radius: 10em;
	-moz-border-radius: 10em;
	border-radius: 10em;
	-webkit-transition: all .5s;
	-moz-transition: all .5s;
	transition: all .5s;
	/* margin: 0 400px 0 0; */
}

.search input[type=search]:focus {
	width: 418px;
	background-color: #fff;
	border-color: #6dcff6;
	margin: 0 82px 0 0;
	-webkit-box-shadow: 0 0 5px rgba(109, 207, 246, .5);
	-moz-box-shadow: 0 0 5px rgba(109, 207, 246, .5);
	box-shadow: 0 0 5px rgba(109, 207, 246, .5);
}

.search scan {
	margin-left: 0px;
}

.search scan select {
	/* 	background: #ededed url(http://webdesignerwall.com/demo/expandable-search-form/images/search-icon.png) no-repeat 9px; */
	border: solid 1px #ccc;
	padding: 9px 22px 9px 15px;
	width: 100px;
	-webkit-border-radius: 10em;
	-moz-border-radius: 10em;
	border-radius: 10em;
	margin-right: 60px;
}

.iframe {
	line-height: 1.6;
	color: rgba(0, 0, 0, .85);
	font: 14px Helvetica Neue, Helvetica, PingFang SC, Tahoma, Arial,
		sans-serif;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	border-top-width: 0px;
	border-right-width: 0px;
	border-bottom-width: 0px;
	border-left-width: 0px;
	position: fixed;
	width: 100%;
	height: 100%;
	left: 0;
	box-sizing: border-box;
	top: 63px;
	right: 0;
	bottom: 0;
}

.layui-nav .layui-this:after, .layui-nav-bar, .layui-nav-tree .layui-nav-itemed:after
	{
	background-color: #00a2ff;
}

.layui-panel {
	cursor: pointer;
	transition: all 0.3s;
	-ms-transition: all 0.3s;
}

.layui-panel:hover {
	transform: scale(1.03);
	-ms-transform: scale(1.03);
}
.layui-nav .layui-nav-child a:hover {
    background-color: #F6F6F6;
    color: #00a2ff;
}
.layui-nav .layui-nav-child dd.layui-this a, .layui-nav-child dd.layui-this {
    background-color: #00a2ff;
    color: #fff;
}
.layui-nav .layui-nav-more {
	    border-color: #707070 transparent transparent;
}
.layui-nav .layui-nav-mored, .layui-nav-itemed>a .layui-nav-more {
    border-color: transparent transparent #707070;
}

#userWin{
    left: 25%;
    top: 25%;
    position: fixed;
    z-index: 18;
    clear: both;
    border: 0;
    display: none;
}
.u_view{
	animation: greater .5s cubic-bezier(.075, .82, .165, 1);
    display: block!important;
}
@keyframes greater {
    0% {
        -webkit-transform: scale(0);
        transform: scale(0)
    }

    to {
        -webkit-transform: scale(1);
        transform: scale(1)
    }
}
.qx img{
	filter:brightness(80%);
    margin-top: 12px;
    transition:width 0.5s, height 0.5s;
    -moz-transition:width 0.5s, height 0.5s, -moz-transform 0.5s; /* Firefox 4 */
    -webkit-transition:width 0.5s, height 0.5s, -webkit-transform 0.5s; /* Safari and Chrome */
    -o-transition:width 0.5s, height 0.5s, -o-transform 0.5s; /* Opera */
}
.qx img:hover{
    filter:brightness(70%);
    transform:rotate(90deg);
    -moz-transform:rotate(90deg); /* Firefox 4 */
    -webkit-transform:rotate(90deg); /* Safari and Chrome */
    -o-transform:rotate(90deg); /* Opera */
}
</style>
</head>

<body style="min-width: 1200px; margin: 0 auto;">
	<div class="hrader" id="header" style="margin-bottom:35px;">
		<div class="top">

			<div class="layui-layout layui-layout-admin site-demo-fixed" style="margin:0 auto; width:100%;">
				<div class="layui-header header header-demo layui-bg-gray" summer>
					<ul class="layui-nav layui-bg-gray">
						<li class="layui-nav-item"><a href="<%=basePath%>index.jsp"
							target="menuFrame" style="color: #303030;"> <img
								src="<%=basePath%>images/logo.png" width="152" height="63" />
						</a></li>
						<li class="layui-nav-item"><a href="<%=basePath%>index.jsp"
							style="color: #707070;">&nbsp;&nbsp;&nbsp;首页&nbsp;&nbsp;&nbsp;</a></li>
						<li class="layui-nav-item"><a href="<%=basePath%>xw.jsp"
							style="color: #707070;">&nbsp;&nbsp;新闻资讯&nbsp;&nbsp;</a></li>
						<li class="layui-nav-item"><a href="<%=basePath%>jl.jsp"
							style="color: #707070;">&nbsp;&nbsp;在线交流&nbsp;&nbsp;</a></li>
						<li class="layui-nav-item"><a href="<%=basePath%>jf.jsp"
							style="color: #707070;">&nbsp;&nbsp;积分&nbsp;&nbsp;</a></li>
						<div style="float: right;height:63px;line-height:63px;">
							<li class="layui-nav-item"><a
								target="menuFrame"><img src="<%=basePath%>pic/nobody.jpg"
									class="layui-nav-img" /><i
									class="layui-icon layui-icon-down layui-nav-more"></i></a>
								<dl class="layui-nav-child">
									<%
										if (user == null) {
									%>
									<dd>
										<a id="loginWin">登录</a>
									</dd>
									<dd>
										<a id="regWin">注册</a>
									</dd>
									<dd>
										<a id="lostWin">忘记密码</a>
									</dd>
									<%
										} else {
									%>
									<dd>
										<a href="<%=basePath+com%>/index.jsp" target="_parent">个人中心</a>
									</dd>
									<dd>
										<%
											if (com.equals("member")) {
										%>
										<a href="<%=basePath%>MemberServlet?method=memberexit">退出</a>
										<%
											} else {
										%>
										<a href="<%=basePath%>AdminServlet?method=adminexit">退出</a>
										<%
											}
										%>
									</dd>
									<%
										}
									%>
								</dl></li>
							<li class="layui-nav-item"><a href="<%=basePath%>ts.jsp"
								rel="nofollow" style="color: #707070;">反馈</a></li>
						</div>
					</ul>
				</div>

				<%-- <%
					String member = (String) session.getAttribute("member");
				if (member == null) {
				%>
				<a href="<%=basePath%>login.jsp" style="color: #C94E13;">请登录</a> <a
					href="<%=basePath%>reg.jsp">注册</a> <a
					href="<%=basePath%>lost.jsp">忘记密码</a>
				<%
					} else {
				%>
				欢迎：<%=member%>
				<a href="<%=basePath%>member/index.jsp" style="color: #C94E13;">用户中心</a>
				<a href="<%=basePath%>MemberServlet?method=memberexit">退出</a>
				<%
					}
				%> --%>
				<ul class="topNav">
					<li><a href="#"> </a></li>

					</li>

					<li class="kefus"></li>
					<div class="clears"></div>
				</ul>
				<!--topNav/-->
				</div>
			</div>
			<!--top/-->
		</div>
		<!--hrader/-->
		<%-- <div class="mid">
  <h1 class="logo" style="text-align:left;"><img src="<%=basePath %>images/logo.png" width="304" height="126" /></h1>
   
  <div class="ding-gou">
   <div class="ding">
    <a href="#"></a>
   </div><!--ding/-->
   <div class="gou">
    <div class="search">
    <form action="<%=basePath %>index.jsp?s=y" method="post">
	     <input type="submit" value=""/>
	     <input type="search" name="search" placeholder="搜索"/><br/><br/><br/>
	     <scan>查询类型：<select name="choose" required>
    		  <option value="title">书名</option>
    		  <option value="bkwriter">作者</option>
    		  <option value="saleway">付费方式</option>
        </select></scan>
        <scan>价格区间：<select name="price" required>
        	<option value="all">无</option>
    		  <option value="1">10元以下</option>
    		  <option value="2">10-50元</option>
    		  <option value="3">50-100元</option>
    		  <option value="4">100元以上</option>
        </select></scan>
	</form>
    </div>
   </div><!--gou/-->
   <div class="clears"></div>
  </div><!--ding-gou/-->
 </div><!--mid--> --%>
		<%-- <div class="layui-layout layui-layout-admin site-demo-fixed" style="margin:0 auto; width:100%">
<ul class="layui-nav" style="text-align:center;">
  <li class="layui-nav-item"><a href="<%=basePath %>index.jsp">&nbsp;&nbsp;&nbsp;首页&nbsp;&nbsp;&nbsp;</a></li>
  <li class="layui-nav-item"><a href="<%=basePath %>xw.jsp">&nbsp;&nbsp;新闻资讯&nbsp;&nbsp;</a></li>
  <li class="layui-nav-item"><a href="<%=basePath %>jl.jsp">&nbsp;&nbsp;在线交流&nbsp;&nbsp;</a></li>
  <li class="layui-nav-item"><a href="<%=basePath %>jf.jsp">&nbsp;&nbsp;积分排行榜&nbsp;&nbsp;</a></li>
  <li class="layui-nav-item"><a href="<%=basePath %>ts.jsp">&nbsp;&nbsp;投诉建议&nbsp;&nbsp;</a></li>
</ul>
</div> --%>
		<%
			String message = (String) request.getAttribute("message");
		if (message == null) {
			message = "";
		}
		if (!message.trim().equals("")) {
			out.println("<script language='javascript'>");
			out.println("alert('" + message + "');");
			out.println("</script>");
		}
		request.removeAttribute("message");
		%>
		<div id="userWin" class="">
        <iframe src="<%=basePath%>login.jsp" id="iframe1" width="900px" height="600px" style="max-width:900px;max-height:600px;border-radius: 1em; border: 0; background: #0005;"></iframe>
        <div align="center" class="qx" onclick="qxiframe();"><img src="<%=basePath %>images/qx.png" style="width: 36px; height: auto;"></div>
        <script type="text/javascript">
            var i1 = document.getElementById("iframe1");
            var a1 = document.getElementById("search");
            var uw = document.getElementById("userWin");
            var loginWin = document.getElementById("loginWin");
            var regWin = document.getElementById("regWin");
            var lostWin = document.getElementById("lostWin");

            function searchcheck() {
                document.onclick = function(event) {
                    event = event || window.event || frames.event;
                    console.log(event.target.id);
                    if (event.target.id == "loginWin") {
                        uw.className = "u_view";
                        i1.src = '<%=basePath%>login.jsp';
                    }
                    if (event.target.id == "regWin") {
                        uw.className = "u_view";
                        i1.src = '<%=basePath%>reg.jsp';
                    }
                    if (event.target.id == "lostWin") {
                        uw.className = "u_view";
                        i1.src = '<%=basePath%>lost.jsp';
                    }
                }
                var bodyx = window.innerWidth;
                var bodyy = window.innerHeight;
                document.getElementById("userWin").style.top = (bodyy - 700) / 2 + "px";
                document.getElementById("userWin").style.left = (bodyx - 900) / 2 + "px";
            }
            searchcheck();

            function qxiframe() {
                uw.className = "";
            }
        </script>
    </div>
		<script>
layui.use('element', function(){
  var element = layui.element;    //导航的hover效果、二级菜单等功能，需要依赖element模块
  
  //监听导航点击
  element.on('nav(demo)', function(elem){
    //console.log(elem)
    layer.msg(elem.text());
  });
});
</script>
		<script>
//JS 
layui.use(['element', 'layer', 'util'], function(){
  var element = layui.element
  ,layer = layui.layer
  ,util = layui.util
  ,$ = layui.$;
  
  //头部事件
  util.event('lay-header-event', {
    //左侧菜单事件
    menuLeft: function(othis){
      layer.msg('展开左侧菜单的操作', {icon: 0});
    }
    ,menuRight: function(){
      layer.open({
        type: 1
        ,content: '<div style="padding: 15px;">处理右侧面板的操作</div>'
        ,area: ['260px', '100%']
        ,offset: 'rt' //右上角
        ,anim: 5
        ,shadeClose: true
      });
    }
  });
  
});
</script>