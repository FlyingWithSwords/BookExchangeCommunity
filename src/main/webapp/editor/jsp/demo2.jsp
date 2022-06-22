<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         import="java.text.SimpleDateFormat,java.util.Calendar" %>
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean"/>
<%
    request.setCharacterEncoding("UTF-8");
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "";
    String sub = request.getParameter("sub");/*
String content=request.getParameter("content1");
htmlData=((content==null)?htmlData:content); */
%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>KindEditor JSP</title>
    <link rel="stylesheet" href="../themes/default/default.css"/>
    <link rel="stylesheet" href="../plugins/code/prettify.css"/>
    <style type="text/css">
        .control {
            margin: 0 0 0 400px;
        }

        .control input {
            border-radius: 5px;
            background-color: #5fbfff;
            border: 2px solid #5fbfff;
            color: white;
            padding: 5px 10px;
            font-size: 12px;
            margin: 0 150px 0 0;
        }

        .control input:hover {
            background-color: #4fafff;
            border: 2px solid #5fbfff;
            color: white;
        }
    </style>
    <script charset="utf-8" src="../kindeditor.js"></script>
    <script charset="utf-8" src="../lang/zh_CN.js"></script>
    <script charset="utf-8" src="../plugins/code/prettify.js"></script>
    <script>
        KindEditor.ready(function (K) {
            var editor1 = K.create('textarea[name="content1"]', {
                cssPath: '../plugins/code/prettify.css',
                uploadJson: '../jsp/upload_json.jsp',
                fileManagerJson: '../jsp/file_manager_json.jsp',
                allowFileManager: true,
                afterCreate: function () {
                    var self = this;
                    K.ctrl(document, 13, function () {
                        self.sync();
                        document.forms['example'].submit();
                    });
                    K.ctrl(self.edit.doc, 13, function () {
                        self.sync();
                        document.forms['example'].submit();
                    });
                }
            });
            prettyPrint();
        });/*
		function goBack(){
			console.log('现在回论坛啦！')
			window.top.location.href='../../yq.html';

			} */
    </script>
</head>
<body>
<% String mine = (String) session.getAttribute("user");
    String id = request.getParameter("id");
    String caller = request.getParameter("caller").toString();
    if (!htmlData.equals("") && sub.length() != 0) {
        int flag = cb.comUp("insert into communicate(username,content,time,becaller) values('" + mine + "','" + htmlData + "','" + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime()) + "','" + caller + "' )");
        if (flag == 1) {
            request.getRequestDispatcher("demo2.jsp?sub=&caller=" + caller).forward(request, response);
        }
    }
%>
<form name="example" method="post" action="demo2.jsp?sub=enter&caller=<%=caller %>">
    <textarea name="content1" cols="200" rows="700" class="text"
              style="width:860px;height:210px;visibility:hidden;"><%=htmlspecialchars(htmlData)%></textarea>
    <br/>
    <div class="control">
        <input type="submit" name="sub" onclick="breakout()" value="发送"/>
        <!-- <input type="button" name="btn" value="返回" onclick="goBack()"/>  -->
        <scan style="font-size:10px; margin:0 0 0 100px;">(提交快捷键: Ctrl + Enter)</scan>
    </div>
</form>
</body>
</html>
<%!
    private String htmlspecialchars(String str) {
        str = str.replaceAll("&", "&amp;");
        str = str.replaceAll("<", "&lt;");
        str = str.replaceAll(">", "&gt;");
        str = str.replaceAll("\"", "&quot;");
        return str;
    }
%>
<script type="text/javascript">
    function breakout() {
        if (window.top != window.self) {
            setTimeout(window.parent.location = "<%=basePath %>comcontent.jsp?id=<%=id %>", 3000);
        }
    }
</script>