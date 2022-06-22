<%@ page language="java" import="java.util.*,com.util.*" contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean"/>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>��Ҫ������main</title>
    <link href="<%=basePath %>admin/css/css.css" type="text/css" rel="stylesheet"/>
    <link href="<%=basePath %>admin/css/main.css" type="text/css" rel="stylesheet"/>
    <style>
        body {
            overflow-x: hidden;
            background: #f2f0f5;
            padding: 15px 0px 10px 5px;
        }

        #searchmain {
            font-size: 12px;
        }

        #search {
            font-size: 12px;
            background: #548fc9;
            margin: 10px 10px 0 0;
            display: inline;
            width: 100%;
            color: #FFF;
            float: left
        }

        #search form span {
            height: 40px;
            line-height: 40px;
            padding: 0 0px 0 10px;
            float: left;
        }

        #search form input.text-word {
            height: 24px;
            line-height: 24px;
            width: 180px;
            margin: 8px 0 6px 0;
            padding: 0 0px 0 10px;
            float: left;
            border: 1px solid #FFF;
        }

        #search form input.text-but {
            height: 24px;
            line-height: 24px;
            width: 55px;
            background: url(<%=basePath %>admin/images/main/list_input.jpg) no-repeat left top;
            border: none;
            cursor: pointer;
            font-family: "Microsoft YaHei", "Tahoma", "Arial", '����';
            color: #666;
            float: left;
            margin: 8px 0 0 6px;
            display: inline;
        }

        #search a.add {
            background: url(<%=basePath %>admin/images/main/add.jpg) no-repeat -3px 7px #548fc9;
            padding: 0 10px 0 26px;
            height: 40px;
            line-height: 40px;
            font-size: 14px;
            font-weight: bold;
            color: #FFF;
            float: right
        }

        #search a:hover.add {
            text-decoration: underline;
            color: #d2e9ff;
        }

        #main-tab {
            border: 1px solid #eaeaea;
            background: #FFF;
            font-size: 12px;
        }

        #main-tab th {
            font-size: 12px;
            background: url(<%=basePath %>admin/images/main/list_bg.jpg) repeat-x;
            height: 32px;
            line-height: 32px;
        }

        #main-tab td {
            font-size: 12px;
            line-height: 40px;
        }

        #main-tab td a {
            font-size: 12px;
            color: #548fc9;
        }

        #main-tab td a:hover {
            color: #565656;
            text-decoration: underline;
        }

        .bordertop {
            border-top: 1px solid #ebebeb
        }

        .borderright {
            border-right: 1px solid #ebebeb
        }

        .borderbottom {
            border-bottom: 1px solid #ebebeb
        }

        .borderleft {
            border-left: 1px solid #ebebeb
        }

        .gray {
            color: #dbdbdb;
        }

        td.fenye {
            padding: 10px 0 0 0;
            text-align: right;
        }

        .bggray {
            background: #f9f9f9
        }
    </style>
</head>
<script language="javascript">
    function top2() {
        form3.action = "<%=basePath%>admin/jf/sinfo.jsp?page=1";
        form3.submit();
    }

    function last2() {
        if (form3.pageCount.value == 0) {//�����ҳ��Ϊ0����ô���һҳΪ1��Ҳ���ǵ�һҳ�������ǵ�0ҳ
            form3.action = "<%=basePath%>admin/jf/sinfo.jsp?page=1";
            form3.submit();
        } else {
            form3.action = "<%=basePath%>admin/jf/sinfo.jsp?page=" + form3.pageCount.value;
            form3.submit();
        }
    }

    function pre2() {
        var page = parseInt(form3.page.value);
        if (page <= 1) {
            alert("������һҳ");
        } else {
            form3.action = "<%=basePath%>admin/jf/sinfo.jsp?page=" + (page - 1);
            form3.submit();
        }
    }

    function next2() {
        var page = parseInt(form3.page.value);
        var pageCount = parseInt(form3.pageCount.value);
        if (page >= pageCount) {
            alert("�������һҳ");
        } else {
            form3.action = "<%=basePath%>admin/jf/sinfo.jsp?page=" + (page + 1);
            form3.submit();
        }
    }

    function bjump2() {
        var pageCount = parseInt(form3.pageCount.value);
        if (fIsNumber(form3.busjump.value, "1234567890") != 1) {
            alert("��ת�ı�����ֻ����������!");
            form3.busjump.select();
            form3.busjump.focus();
            return false;
        }
        if (form3.busjump.value > pageCount) {//�����ת�ı����������ҳ���������һҳ���������������һҳ
            if (pageCount == 0) {
                form3.action = "<%=basePath%>admin/jf/sinfo.jsp?page=1";
                form3.submit();
            } else {
                form3.action = "<%=basePath%>admin/jf/sinfo.jsp?page=" + pageCount;
                form3.submit();
            }
        } else if (form3.busjump.value <= pageCount) {
            var page = parseInt(form3.busjump.value);
            if (page == 0) {
                page = 1;//������������0����ô����������1
                form3.action = "<%=basePath%>admin/jf/sinfo.jsp?page=" + page;
                form3.submit();
            } else {
                form3.action = "<%=basePath%>admin/jf/sinfo.jsp?page=" + page;
                form3.submit();
            }

        }

    }

    //****�ж��Ƿ���Number.
    function fIsNumber(sV, sR) {
        var sTmp;
        if (sV.length == 0) {
            return (false);
        }
        for (var i = 0; i < sV.length; i++) {
            sTmp = sV.substring(i, i + 1);
            if (sR.indexOf(sTmp, 0) == -1) {
                return (false);
            }
        }
        return (true);
    }

    function del() {
        pageform.submit();
    }
</script>

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
	
	String admin=(String)session.getAttribute("user"); 
	if(admin==null){
		response.sendRedirect(path+"index.jsp");
	}
	else{  
%>
<body>
<form action="" method="post" name="form3">
    <table width="99%" border="0" cellspacing="0" cellpadding="0" id="searchmain">
        <tr>
            <td align="left" valign="top">
                <table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
                    <tr>
                        <th align="center" valign="middle" class="borderright" width="5%">ID</th>
                        <th align="center" valign="middle" class="borderright">�û�</th>
                        <th align="center" valign="middle" class="borderright">����</th>
                        <th align="center" valign="middle" class="borderright">ʱ��</th>
                        <th align="center" valign="middle" width="100">����</th>
                    </tr>
                    <% String word = Common.toChineseAndTrim(request.getParameter("word"));
                        cb.setEVERYPAGENUM(12);
                        int cou = cb.getMessageCount("select count(*) from jifen where username like '%" + word + "%' ");//�õ���Ϣ����
                        String page1 = request.getParameter("page");
                        if (page1 == null) {
                            page1 = "1";
                        }
                        session.setAttribute("busMessageCount", cou + "");
                        session.setAttribute("busPage", page1);
                        List pagelist1 = cb.getMessage(Integer.parseInt(page1), "select * from jifen where username like '%" + word + "%' order by id desc", 4);
                        session.setAttribute("qqq", pagelist1);
                        int pageCount = cb.getPageCount(); //�õ�ҳ��
                        session.setAttribute("busPageCount", pageCount + "");
                        List pagelist3 = (ArrayList) session.getAttribute("qqq");
                        if (!pagelist3.isEmpty()) {
                            for (int i = 0; i < pagelist3.size(); i++) {
                                List pagelist2 = (ArrayList) pagelist3.get(i);
                    %>
                    <tr onMouseOut="this.style.backgroundColor='#ffffff'"
                        onMouseOver="this.style.backgroundColor='#edf5ff'">
                        <td align="center" valign="middle" class="borderright borderbottom"><%=i + 1 %>
                        </td>
                        <td align="center" valign="middle"
                            class="borderright borderbottom"><%=pagelist2.get(1).toString() %>
                        </td>
                        <td align="center" valign="middle"
                            class="borderright borderbottom"><%=pagelist2.get(2).toString() %>
                        </td>
                        <td align="center" valign="middle"
                            class="borderright borderbottom"><%=pagelist2.get(3).toString() %>
                        </td>
                        <td align="center" valign="middle" class="borderbottom">
                            <a onFocus="this.blur()" class="add"
                               href="<%=basePath%>admin/jf/add.jsp?method=addjf&id=<%=pagelist2.get(0).toString()%>">�޸�</a>
                            <a onFocus="this.blur()" class="add"
                               href="<%=basePath%>ComServlet?method=deljf2&id=<%=pagelist2.get(0).toString()%>"
                               onclick="if (confirm('ȷ��Ҫɾ����')) return true; else return false;"> ɾ��</a>
                        </td>
                    </tr>
                    <% }
                    } %>
                </table>
            </td>
        </tr>
        <tr>
            <td valign="top" class="fenye"><input type="hidden" name="word" value="<%=word%>"/>
                <input type="hidden" name="pageCount" value="<%= session.getAttribute("busPageCount").toString()%>"/>
                <!--//���ڸ�����javascript��ֵ-->
                <input type="hidden" name="page" value="<%=session.getAttribute("busPage").toString()%>"/>
                <!--//���ڸ�����javascript��ֵ-->
                <a href="#" onClick="top2()" onFocus="this.blur()">��ҳ</a>&nbsp;&nbsp;&nbsp;
                <a href="#" onClick="pre2()" onFocus="this.blur()">��һҳ</a>&nbsp;&nbsp;&nbsp;
                ��<%=session.getAttribute("busMessageCount").toString()%>
                ����¼,����<%=session.getAttribute("busPageCount").toString()%>
                ҳ,��ǰ��<%=session.getAttribute("busPage").toString()%>ҳ&nbsp;&nbsp;&nbsp;
                <a href="#" onClick="next2()" onFocus="this.blur()">��һҳ</a>&nbsp;&nbsp;&nbsp;
                <a href="#" onClick="last2()" onFocus="this.blur()">βҳ</a>&nbsp;&nbsp;&nbsp;
                ��&nbsp;<input name="busjump" type="text" size="5"/>&nbsp;ҳ&nbsp; <a href="#" onClick="bjump2()"
                                                                                    onFocus="this.blur()">&nbsp;ת��</a>
            </td>
        </tr>
    </table>
</form>
</body>
    <%}%>
