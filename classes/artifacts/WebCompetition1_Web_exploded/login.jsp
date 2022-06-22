<%@ page language="java" import="java.util.*"  contentType="text/html;charset=utf-8" %> 
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
	request.setCharacterEncoding("utf-8");
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
String user = (String) session.getAttribute("user");
String com = session.getAttribute("coms") == null ? "" : session.getAttribute("coms").toString();
%>
<%-- <%@ include file="iframe/head.jsp" %>  --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>图书交流网</title>
</head>
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
<SCRIPT language=javascript>
function reg() {
	window.location="reg.jsp";
}
function lost() {
	window.location="lost.jsp";
}
function login() {
	window.location="login.jsp";
}
function admin() {
	window.location="admin/login.jsp";
}
</SCRIPT>
<style type="text/css">
.bg{
	background: url(<%=basePath %>admin/images/login/bg.jpg) no-repeat;
	background-size:cover;
	background-attachment: fixed;
	padding:180px 0;
	margin-top:-20px;
	height:243px;
	overflow: hidden;
}
.bg center{
	margin-top:-100px;
}
</style>
<body>
<br>
<div class="bg">
<center>
<form name="form1" action="<%=basePath %>MemberServlet?method=mlogin" method="post" class="regForm">
    <p id="image_logo"><img src="<%=basePath %>admin/images/login/fly.png" weight="50px" height="50px" style="margin-bottom:30px;"></p>
    <div class="loginBuyList" style="border:#666 1px solid;">
     <label for="name">用户帐号：</label>
     <input type="text" name="username" required/>
    </div> 
    <div class="loginBuyList" style="border:#666 1px solid;">
     <label for="name">登录密码：</label>
     <input type="password" name="password" required/>
    </div>  
     
    <div class="regSubs">
    <p><input type="submit" value="登录" />&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="注册" onclick="reg()"/></p>
    <div style="margin-top:20px;margin-right: 10%;font-family: 宋体;font-size:13px;text-align: right;"><a onclick="admin()">内部登录</a>&nbsp;&nbsp;&nbsp;<a onclick="lost()">忘记密码？</a></div>
    </div>
   </form>
</center>
</div>
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
</body>
</html>
<%-- <%@ include file="iframe/foot.jsp" %> --%>
