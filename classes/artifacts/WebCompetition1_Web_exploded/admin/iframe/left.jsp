<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312"%> 
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>��ർ��menu</title>
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
    <span>�û���<%=username %><br> </span>
</div>
    <div style="float: left" id="my_menu" class="sdmenu">
      <div class="collapsed">
      <span>�û���Ϣ����</span>
        <a href="<%=basePath %>admin/system/editpwd.jsp" target="mainFrame" onFocus="this.blur()">������Ϣ����</a>
       <a href="<%=basePath %>admin/system/index2.jsp" target="mainFrame" onFocus="this.blur()">�û���Ϣ����</a>
      </div>
      <%if(sf.equals("����Ա")){ %>
      <div>
        <span>Ա����Ϣ����</span>
        <a href="<%=basePath %>admin/system/index.jsp" target="mainFrame" onFocus="this.blur()">Ա����Ϣ����</a>
        <a href="<%=basePath %>admin/system/add.jsp?method=addm" target="mainFrame" onFocus="this.blur()">Ա����Ϣ����</a>
        <a href="<%=basePath %>admin/system/s.jsp" target="mainFrame" onFocus="this.blur()">Ա����Ϣ��ѯ</a> 
      </div>
      <%} %>
      <div>
        <span>���Ź������</span>
        <a href="<%=basePath %>admin/xw/index.jsp" target="mainFrame" onFocus="this.blur()">���Ź������</a>
        <a href="<%=basePath %>admin/xw/add.jsp?method=addxw" target="mainFrame" onFocus="this.blur()">���Ź��淢��</a>
        <a href="<%=basePath %>admin/xw/s.jsp" target="mainFrame" onFocus="this.blur()">���Ź����ѯ</a> 
      </div>
      <div>
        <span>�û���������</span>
        <a href="<%=basePath %>admin/dh/index.jsp" target="mainFrame" onFocus="this.blur()">������¼����</a>
        <a href="<%=basePath %>admin/dh/add.jsp?method=adddh" target="mainFrame" onFocus="this.blur()">�������ⷢ��</a>
        <a href="<%=basePath %>admin/dh/s.jsp" target="mainFrame" onFocus="this.blur()">������Ϣ��ѯ</a>
      </div> 
      <div>
        <span>ͼ����Ϣ����</span>
        <a href="<%=basePath %>admin/bkxw/index.jsp" target="mainFrame" onFocus="this.blur()">ͼ����Ϣ����</a>
        <a href="<%=basePath %>admin/bkxw/add.jsp?method=addbkxw" target="mainFrame" onFocus="this.blur()">ͼ����Ϣ����</a> 
        <a href="<%=basePath %>admin/bkxw/s.jsp" target="mainFrame" onFocus="this.blur()">ͼ����Ϣ��ѯ</a> 
      </div>
      <div>
        <span>�û��˵�����</span>
        <a href="<%=basePath %>admin/buy/index.jsp" target="mainFrame" onFocus="this.blur()">�˵���Ϣ����</a>
        <a href="<%=basePath %>admin/buy/add.jsp?method=addbuy" target="mainFrame" onFocus="this.blur()">�˵���Ϣ����</a>
        <a href="<%=basePath %>admin/buy/s.jsp" target="mainFrame" onFocus="this.blur()">�˵���Ϣ��ѯ</a><!-- 
        <a href="<%=basePath %>admin/sf/t.jsp" target="mainFrame" onFocus="this.blur()">�շ���Ϣͳ��</a> 
      --></div>
      <div>
        <span>�û����ֹ���</span>
        <a href="<%=basePath %>admin/jf/index.jsp" target="mainFrame" onFocus="this.blur()">������Ϣ����</a>
        <a href="<%=basePath %>admin/jf/add.jsp?method=addjf" target="mainFrame" onFocus="this.blur()">������Ϣ����</a> 
        <a href="<%=basePath %>admin/jf/s.jsp" target="mainFrame" onFocus="this.blur()">������Ϣ��ѯ</a> 
      </div>
      <div>
        <span>ע���û�����</span>
        <a href="<%=basePath %>admin/member/index.jsp" target="mainFrame" onFocus="this.blur()">ע���û�����</a>
        <a href="<%=basePath %>admin/member/s.jsp" target="mainFrame" onFocus="this.blur()">ע���û���ѯ</a> 
      </div> 
      <div>
        <span>����Ͷ�߹���</span>
        <a href="<%=basePath %>admin/jy/index.jsp" target="mainFrame" onFocus="this.blur()">����Ͷ�߹���</a>
        <a href="<%=basePath %>admin/jy/s.jsp" target="mainFrame" onFocus="this.blur()">����Ͷ�߲�ѯ</a> 
      </div>
    </div>
</body>
<%} %>
</html>