<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean"/> 
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="<%=basePath%>css/layui.css"  media="all">
<link rel="stylesheet" href="<%=basePath%>css/modules/code.css"  media="all">
<link rel="stylesheet" href="<%=basePath%>css/modules/laydate/default/laydate.css"  media="all">
<link rel="stylesheet" href="<%=basePath%>css/modules/layer/default/layer.css"  media="all">
<script src="<%=basePath%>js/layui.js" charset="utf-8"></script>
<style>
.layui-nav-tree{vertical-align: top;}
.iframe{
	line-height: 1.6;
	color: rgba(0,0,0,.85);
	font: 14px Helvetica Neue, Helvetica, PingFang SC, Tahoma, Arial, sans-serif;
	-webkit-tap-highlight-color: rgba(0,0,0,0);
	border-top-width: 0px;
	border-right-width: 0px;
	border-bottom-width: 0px;
	border-left-width: 0px;
	position: absolute;
	width: 100%;
	height: -webkit-fill-available;
	left: 0;
	box-sizing: border-box;
	right: 0;
	bottom: 0;}
.layui-nav-tree .layui-nav-child dd.layui-this, .layui-nav-tree .layui-nav-child dd.layui-this a, .layui-nav-tree .layui-this, .layui-nav-tree .layui-this>a, .layui-nav-tree .layui-this>a:hover {
    background-color: #cfefff;
    color: #333;
    font-weight: bold;
    
	cursor: pointer;
	transition: all 0.3s;
	-ms-transition: all 0.3s;
}
.layui-nav-tree .layui-nav-child a:hover{
	transform: scale(1.03);
    -ms-transform: scale(1.03);
    font-size:15px;
}
.layui-nav-tree .layui-nav-bar {
    width: 5px;
    height: 0;
    background-color: #00a2ff;
}
</style>
<script>
layui.use('element', function(){
  var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
  
  //监听导航点击
  element.on('nav(demo)', function(elem){
    //console.log(elem)
    layer.msg(elem.text());
  });
});
</script>
<title>在线交流界面</title>
</head>
<body>
<%
	String mine=(String)session.getAttribute("user");
	String id=request.getParameter("bkxwid");
%>

   <div class="layui-side layui-bg-black" style="box-shadow: #666 1px 1px 20px 1px;">
    <div class="layui-side-scroll">
     
    <ul class="layui-nav layui-nav-tree layui-inline" lay-filter="test">
      <!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
      <li class="layui-nav-item layui-nav-itemed"> <a href="javascript:;"><img src="<%=basePath%>images/menu.png" class="layui-nav-img">系统管理员</a>
        <dl class="layui-nav-child">
        <%List flist=cb.getCom("select * from user where owner!='用户'",10);if(!flist.isEmpty()){for(int ai=0;ai<flist.size();ai++){List list2=(List)flist.get(ai);%>
          <dd><a href="<%=basePath%>comcontent.jsp?id=<%=list2.get(0).toString() %>" target="menuFrame"><img src="<%=basePath %>pic/nobody.jpg" width="30" height="30" style="border-radius:50%; margin:0 12px;" /><%=list2.get(1).toString() %></a></dd>
          <%}} %>
        </dl>
      </li>
      <li class="layui-nav-item"> <a href="javascript:;"><img src="<%=basePath%>images/menu.png"  class="layui-nav-img">用户</a>
        <dl class="layui-nav-child">
         <%List flist1=cb.getCom("select * from user where owner='用户' and username!='"+mine+"'",10);if(!flist1.isEmpty()){for(int ai=0;ai<flist1.size();ai++){List list21=(List)flist1.get(ai);%>
          <dd><a href="<%=basePath%>comcontent.jsp?id=<%=list21.get(0).toString() %>" target="menuFrame"><img src="<%=basePath+list21.get(9).toString() %>" width="30" height="30" style="border-radius:50%;  margin:0 12px;" /><%=list21.get(1).toString() %></a></dd>
          <%}} %>
        </dl>
      </li>
      </ul>
      
    </div>
    </div>
    <%	if(id==null){ %>
    <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
    <iframe src="<%=basePath%>comcontent.jsp" frameborder="0" id="demoAdmin" name="menuFrame" class="iframe"></iframe>
    </div>
    </div>
    <%}
    else{
    	List flist2=cb.getCom("select id from user where id='"+id+"'",1);if(!flist2.isEmpty()){for(int ai=0;ai<flist2.size();ai++){List list22=(List)flist2.get(ai);
    %>
    <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
    <iframe src="<%=basePath%>comcontent.jsp?id=<%=list22.get(0).toString() %>" frameborder="0" id="demoAdmin" name="menuFrame" class="iframe"></iframe>
    </div>
    </div>
    <%}}} %>
</body>
</html>