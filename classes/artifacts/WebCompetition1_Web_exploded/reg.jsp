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
	margin-top:-150px;
}
</style>
<body>
<% request.setCharacterEncoding("utf-8"); %>
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
</SCRIPT>
<br> 
<div class="bg">
<center>
<form name="form1" action="<%=basePath%>MemberServlet?method=mreg" method="post" class="regForm">
    <div class="loginBuyList">
     <label for="name">登录帐号：</label>
     <input type="text" name="username" required/>
    </div> 
    <div class="loginBuyList">
     <label for="name">登录密码：</label>
     <input type="password" name="password" required/>
    </div>
    <div class="loginBuyList">
     <label for="name">用户性别：</label>
     <select name="sex" style="width:150px;height:50px; background:rgba(255,255,255,0);" required>  
    	<option value="男">男</option>
    	<option value="女">女</option>  
     </select>
    </div> 
    <div class="loginBuyList" style="border:#666 1px solid;">
     <label for="name">用户年龄：</label>
     <input type="number" name="age" min="18" max="100" required/>
    </div> 
    <div class="loginBuyList" style="border:#666 1px solid;">
     <label for="name">联系电话：</label>
     <input type="text" name="tel" pattern="[0-9]{11}" title="11位手机号码" required/>
    </div> 
    <div class="loginBuyList" style="border:#666 1px solid;">
     <label for="name">居住地：</label>
     <input type="text" name="address" required/>
    </div>  
     
    <div class="regSubs">
     <input type="submit" value="注册" /> <input type="button" value="登录" onclick="login()"/>
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
<%-- <%@ include file="iframe/foot.jsp" %> --%>
</body>
</html>
