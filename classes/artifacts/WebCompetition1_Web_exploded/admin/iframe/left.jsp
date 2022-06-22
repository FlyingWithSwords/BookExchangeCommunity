<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312"%> 
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>左侧导航menu</title>
<link href="<%=basePath %>admin/css/css.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="<%=basePath %>admin/js/sdmenu.js"></script>
<script type="text/javascript">
	// <![CDATA[
	var myMenu;
	window.onload = function() {
		myMenu = new SDMenu("my_menu");
		myMenu.init();
	};
	// ]]>
</script>
<style type=text/css>
html{ SCROLLBAR-FACE-COLOR: #107ed3; SCROLLBAR-HIGHLIGHT-COLOR: #f0f0f0; SCROLLBAR-SHADOW-COLOR: #0089df; SCROLLBAR-3DLIGHT-COLOR: #f0f0f0; SCROLLBAR-ARROW-COLOR: #0089df;  SCROLLBAR-TRACK-COLOR: #f0f0f0;  SCROLLBAR-DARKSHADOW-COLOR: #f0f0f0; overflow-x:hidden;}
body{overflow-x:hidden; background:url(<%=basePath %>admin/images/main/leftbg.jpg) left top repeat-y #f2f0f5; width:194px;}
</style>
</head>

<% 
	String username=(String)session.getAttribute("user");  String sf=(String)session.getAttribute("sf");  
	 
	if(username==null){
		response.sendRedirect(basePath+"admin/login.jsp");
	}
	else{ 
%>
<body onselectstart="return false;" ondragstart="return false;" oncontextmenu="return false;" >
<div id="left-top">
	<div><img src="<%=basePath %>admin/images/main/member.gif" width="44" height="44" /></div>
    <span>用户：<%=username %><br> </span>
</div>
    <div style="float: left" id="my_menu" class="sdmenu">
      <div class="collapsed">
      <span>用户信息管理</span>
        <a href="<%=basePath %>admin/system/editpwd.jsp" target="mainFrame" onFocus="this.blur()">密码信息管理</a>
       <a href="<%=basePath %>admin/system/index2.jsp" target="mainFrame" onFocus="this.blur()">用户信息管理</a>
      </div>
      <%if(sf.equals("管理员")){ %>
      <div>
        <span>员工信息管理</span>
        <a href="<%=basePath %>admin/system/index.jsp" target="mainFrame" onFocus="this.blur()">员工信息管理</a>
        <a href="<%=basePath %>admin/system/add.jsp?method=addm" target="mainFrame" onFocus="this.blur()">员工信息发布</a>
        <a href="<%=basePath %>admin/system/s.jsp" target="mainFrame" onFocus="this.blur()">员工信息查询</a> 
      </div>
      <%} %>
      <div>
        <span>新闻公告管理</span>
        <a href="<%=basePath %>admin/xw/index.jsp" target="mainFrame" onFocus="this.blur()">新闻公告管理</a>
        <a href="<%=basePath %>admin/xw/add.jsp?method=addxw" target="mainFrame" onFocus="this.blur()">新闻公告发布</a>
        <a href="<%=basePath %>admin/xw/s.jsp" target="mainFrame" onFocus="this.blur()">新闻公告查询</a> 
      </div>
      <div>
        <span>用户交流管理</span>
        <a href="<%=basePath %>admin/dh/index.jsp" target="mainFrame" onFocus="this.blur()">交流记录管理</a>
        <a href="<%=basePath %>admin/dh/add.jsp?method=adddh" target="mainFrame" onFocus="this.blur()">交流主题发布</a>
        <a href="<%=basePath %>admin/dh/s.jsp" target="mainFrame" onFocus="this.blur()">交流信息查询</a>
      </div> 
      <div>
        <span>图书信息管理</span>
        <a href="<%=basePath %>admin/bkxw/index.jsp" target="mainFrame" onFocus="this.blur()">图书信息管理</a>
        <a href="<%=basePath %>admin/bkxw/add.jsp?method=addbkxw" target="mainFrame" onFocus="this.blur()">图书信息发布</a> 
        <a href="<%=basePath %>admin/bkxw/s.jsp" target="mainFrame" onFocus="this.blur()">图书信息查询</a> 
      </div>
      <div>
        <span>用户账单管理</span>
        <a href="<%=basePath %>admin/buy/index.jsp" target="mainFrame" onFocus="this.blur()">账单信息管理</a>
        <a href="<%=basePath %>admin/buy/add.jsp?method=addbuy" target="mainFrame" onFocus="this.blur()">账单信息发布</a>
        <a href="<%=basePath %>admin/buy/s.jsp" target="mainFrame" onFocus="this.blur()">账单信息查询</a><!-- 
        <a href="<%=basePath %>admin/sf/t.jsp" target="mainFrame" onFocus="this.blur()">收费信息统计</a> 
      --></div>
      <div>
        <span>用户积分管理</span>
        <a href="<%=basePath %>admin/jf/index.jsp" target="mainFrame" onFocus="this.blur()">积分信息管理</a>
        <a href="<%=basePath %>admin/jf/add.jsp?method=addjf" target="mainFrame" onFocus="this.blur()">积分信息发布</a> 
        <a href="<%=basePath %>admin/jf/s.jsp" target="mainFrame" onFocus="this.blur()">积分信息查询</a> 
      </div>
      <div>
        <span>注册用户管理</span>
        <a href="<%=basePath %>admin/member/index.jsp" target="mainFrame" onFocus="this.blur()">注册用户管理</a>
        <a href="<%=basePath %>admin/member/s.jsp" target="mainFrame" onFocus="this.blur()">注册用户查询</a> 
      </div> 
      <div>
        <span>在线投诉管理</span>
        <a href="<%=basePath %>admin/jy/index.jsp" target="mainFrame" onFocus="this.blur()">在线投诉管理</a>
        <a href="<%=basePath %>admin/jy/s.jsp" target="mainFrame" onFocus="this.blur()">在线投诉查询</a> 
      </div>
    </div>
</body>
<%} %>
</html>