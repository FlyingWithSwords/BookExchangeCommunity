<%@ page language="java" import="java.util.*"  contentType="text/html;charset=utf-8"%> 
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title> </title>
<link href="<%=basePath %>admin/css/css.css" type="text/css" rel="stylesheet" />
<link href="<%=basePath %>admin/css/main.css" type="text/css" rel="stylesheet" /> 
<style>
body{overflow-x:hidden; background:#f2f0f5; padding:15px 0px 10px 5px;}
#searchmain{ font-size:12px;}
#search{ font-size:12px; background:#548fc9; margin:10px 10px 0 0; display:inline; width:100%; color:#FFF}
#search form span{height:40px; line-height:40px; padding:0 0px 0 10px; float:left;}
#search form input.text-word{height:24px; line-height:24px; width:180px; margin:8px 0 6px 0; padding:0 0px 0 10px; float:left; border:1px solid #FFF;}
#search form input.text-but{height:24px; line-height:24px; width:55px; background:url(<%=basePath %>admin/images/main/list_input.jpg) no-repeat left top; 
border:none; cursor:pointer; font-family:"Microsoft YaHei","Tahoma","Arial",'宋体'; color:#666; float:left; margin:8px 0 0 6px; display:inline;}
#search a.add{ background:url(<%=basePath %>admin/images/main/add.jpg) no-repeat 0px 6px; padding:0 10px 0 26px; height:40px; line-height:40px; 
font-size:14px; font-weight:bold; color:#FFF}
#search a:hover.add{ text-decoration:underline; color:#d2e9ff;}
#main-tab{ border:1px solid #eaeaea; background:#FFF; font-size:12px;}
#main-tab th{ font-size:12px; background:url(<%=basePath %>admin/images/main/list_bg.jpg) repeat-x; height:32px; line-height:32px;}
#main-tab td{ font-size:12px; line-height:40px;}
#main-tab td a{ font-size:12px; color:#548fc9;}
#main-tab td a:hover{color:#565656; text-decoration:underline;}
.bordertop{ border-top:1px solid #ebebeb}
.borderright{ border-right:1px solid #ebebeb}
.borderbottom{ border-bottom:1px solid #ebebeb}
.borderleft{ border-left:1px solid #ebebeb}
.gray{ color:#dbdbdb;}
td.fenye{ padding:10px 0 0 0; text-align:right;}
.bggray{ background:#f9f9f9; font-size:14px; font-weight:bold; padding:10px 10px 10px 0; width:120px;}
.main-for{ padding:10px;}
.main-for input.text-word{ width:310px; height:36px; line-height:36px; border:#ebebeb 1px solid; background:#FFF; font-family:"Microsoft YaHei","Tahoma","Arial",'宋体'; padding:0 10px;}
.main-for select{ width:310px; height:36px; line-height:36px; border:#ebebeb 1px solid; background:#FFF; font-family:"Microsoft YaHei","Tahoma","Arial",'宋体'; color:#666;}
.main-for input.text-but{ width:100px; height:40px; line-height:30px; border: 1px solid #0087d5; background:#1b95da; border-radius:0.5em; font-family:"Microsoft YaHei","Tahoma","Arial",'宋体'; color:#fff; 
float:left; margin:0 10px 0 0; display:inline; cursor:pointer; font-size:14px; font-weight:bold;}
#addinfo a{ font-size:14px; font-weight:bold; background:url(<%=basePath %>admin/images/main/addinfoblack.jpg) no-repeat 0 1px; padding:0px 0 0px 20px; line-height:45px;}
#addinfo a:hover{ background:url(<%=basePath %>admin/images/main/addinfoblue.jpg) no-repeat 0 1px;}

textarea{width:310px;height:100px;line-height:36px; border:#ebebeb 1px solid; background:#FFF; font-family:"Microsoft YaHei","Tahoma","Arial",'宋体'; padding:0 10px;}

</style>
	<script charset="utf-8" src="<%=basePath %>editor/kindeditor.js"></script>
	<script charset="utf-8" src="<%=basePath %>editor/lang/zh_CN.js"></script>
	<script charset="utf-8" src="<%=basePath %>editor/plugins/code/prettify.js"></script>
</head>
 
<%
String message = (String)request.getAttribute("message");
	if(message == null){
		message = "";
	}
	if (!message.trim().equals("")){
		out.println("<script language='javascript'>");
		out.println("alert('"+message+"');");
		out.println("</script>");
	}
	request.removeAttribute("message"); 
	
	String member=(String)session.getAttribute("user"); 
	if(member==null){
		response.sendRedirect(basePath+"index.jsp");
	}
	else{
		String method="mupreg";
		String id="",time="",imgsrc="";String sex="";String age="";String tel="";String address=""; 
		List alist=cb.get1Com("select * from user where username='"+member+"'",10); 
		sex=alist.get(5).toString();
		age=alist.get(8).toString();
		tel=alist.get(6).toString();
		address=alist.get(7).toString();
		time=alist.get(3).toString();
		imgsrc=alist.get(9).toString();
%>
<body>
<table width="99%" border="0" cellspacing="0" cellpadding="0" id="searchmain">
  <tr>
    <td align="left" valign="top">
    <form class="form-x" action="<%=basePath %>MemberServlet?method=<%=method%>" method="post" name="form1">  
      <table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">用户头像：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for"> 
        <img src="<%=basePath+imgsrc %>" width="180" height="180" border="0"/>        
        </td>
      </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">上传头像：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for"> 
        <input type="file" name="imgsrc" class="text-word" required/> 
        </td>
      </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">用户名：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" class="text-word" name="username" value="<%=member %>" required/>  
        </td>
      </tr>       
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">性别：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <select name="sex" required> 
              <option value="<%=sex %>"><%=sex %></option> 
              <option value="男">男</option>
              <option value="女">女</option> 
        </select>         
        </td>
      </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">年龄：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="number" class="text-word" name="age" value="<%=age %>" min="18" max="100" required/>  
        </td>
      </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">联系电话：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" class="text-word" name="tel" value="<%=tel %>" pattern="[0-9]{11}" title="11位手机号码" required />  
        </td>
      </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">居住地：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input type="text" class="text-word" name="address" value="<%=address %>" required/>
        </td>
      </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">注册时间：</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <p><%=time %></p>
        </td>
      </tr>
      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
        <td align="right" valign="middle" class="borderright borderbottom bggray">&nbsp;</td>
        <td align="left" valign="middle" class="borderright borderbottom main-for">
        <input name="" type="submit" value="提交" class="text-but"></td>
      </tr>
    </table>
    </form>
    </td>
    </tr>
</table>
</body>
<%} %>