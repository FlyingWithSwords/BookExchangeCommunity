<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8" %>
<%@ include file="iframe/head.jsp" %>

<script language="javascript">
    function top2() {
        form3.action = "<%=basePath%>ts.jsp?page=1";
        form3.submit();
    }

    function last2() {
        if (form3.pageCount.value == 0) {//如果总页数为0，那么最后一页为1，也就是第一页，而不是第0页
            form3.action = "<%=basePath%>ts.jsp?page=1";
            form3.submit();
        } else {
            form3.action = "<%=basePath%>ts.jsp?page=" + form3.pageCount.value;
            form3.submit();
        }
    }

    function pre2() {
        var page = parseInt(form3.page.value);
        if (page <= 1) {
            alert("已至第一页");
        } else {
            form3.action = "<%=basePath%>ts.jsp?page=" + (page - 1);
            form3.submit();
        }
    }

    function next2() {
        var page = parseInt(form3.page.value);
        var pageCount = parseInt(form3.pageCount.value);
        if (page >= pageCount) {
            alert("已至最后一页");
        } else {
            form3.action = "<%=basePath%>ts.jsp?page=" + (page + 1);
            form3.submit();
        }
    }

    function bjump2() {
        var pageCount = parseInt(form3.pageCount.value);
        if (fIsNumber(form3.busjump.value, "1234567890") != 1) {
            alert("跳转文本框中只能输入数字!");
            form3.busjump.select();
            form3.busjump.focus();
            return false;
        }
        if (form3.busjump.value > pageCount) {//如果跳转文本框中输入的页数超过最后一页的数，则跳到最后一页
            if (pageCount == 0) {
                form3.action = "<%=basePath%>ts.jsp?page=1";
                form3.submit();
            } else {
                form3.action = "<%=basePath%>ts.jsp?page=" + pageCount;
                form3.submit();
            }
        } else if (form3.busjump.value <= pageCount) {
            var page = parseInt(form3.busjump.value);
            if (page == 0) {
                page = 1;//如果你输入的是0，那么就让它等于1
                form3.action = "<%=basePath%>ts.jsp?page=" + page;
                form3.submit();
            } else {
                form3.action = "<%=basePath%>ts.jsp?page=" + page;
                form3.submit();
            }

        }

    }

    //****判断是否是Number.
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
</script>

<div class="proBox">
    <!--proSelect/-->
    <div class="sells">
        <%
            cb.setEVERYPAGENUM(15);
            int cou = cb.getMessageCount("select count(*) from useradvise ");//得到信息总数
            String page1 = request.getParameter("page");
            if (page1 == null) {
                page1 = "1";
            }
            session.setAttribute("busMessageCount", cou + "");
            session.setAttribute("busPage", page1);
            List pagelist1 = cb.getMessage(Integer.parseInt(page1), "select * from useradvise order by id desc", 5);
            session.setAttribute("qqq", pagelist1);
            int pageCount = cb.getPageCount(); //得到页数
            session.setAttribute("busPageCount", pageCount + "");
            List pagelist3 = (ArrayList) session.getAttribute("qqq");
            if (!pagelist3.isEmpty()) {
                for (int i = 0; i < pagelist3.size(); i++) {
                    List pagelist2 = (ArrayList) pagelist3.get(i);
                    String pic = cb.getString("select imgsrc from user where username='" + pagelist2.get(1).toString() + "'");
        %>
        <div class="layui-row layui-col-space15">
            <div class="layui-col-md12">
                <div class="layui-panel">
                    <div style="padding: 30px; height:150px;">
                        <dt><img src="<%=basePath+pic %>" width="140" height="140"/></dt>
                        <dd>
                            <h3>用户：<%=pagelist2.get(1).toString() %>
                            </h3>
                            <h4><%=pagelist2.get(2).toString() %>
                            </h4>
                            <h5>
                                时间：<span><%=pagelist2.get(3).toString().substring(0, pagelist2.get(3).toString().length() - 5) %></span>
                            </h5>
                            <div class="tishi">
                                <span>回复：<%=pagelist2.get(4).toString() %></span>
                            </div>
                        </dd>
                    </div>
                </div>
            </div>
        </div>
        <%-- <dl>
         <dt><img src="<%=basePath+pic %>" width="140" height="140" /></dt>
         <dd>
          <h3>用户：<%=pagelist2.get(1).toString() %></h3>
          <h4><%=pagelist2.get(2).toString() %></h4>
          <h5>时间：<span><%=pagelist2.get(3).toString() %></span></h5>
          <div class="tishi">
           <span>回复：<%=pagelist2.get(4).toString() %></span>
          </div></dd>
         <div class="clears"></div>
        </dl> --%>
        <% }
        } %>

        <br/><br/>
        <div class="badoo">
            <form action="" method="post" name="form3">
                <input type="hidden" name="pageCount" value="<%= session.getAttribute("busPageCount").toString()%>"/>
                <!--//用于给上面javascript传值-->
                <input type="hidden" name="page" value="<%=session.getAttribute("busPage").toString()%>"/>
                <!--//用于给上面javascript传值-->
                <a href="#" onClick="top2()">首页</a>&nbsp;&nbsp;&nbsp;
                <a href="#" onClick="pre2()">上一页</a>&nbsp;&nbsp;&nbsp;
                共<%=session.getAttribute("busMessageCount").toString()%>
                条记录,共计<%=session.getAttribute("busPageCount").toString()%>
                页,当前第<%=session.getAttribute("busPage").toString()%>页&nbsp;&nbsp;&nbsp;
                <a href="#" onClick="next2()">下一页</a>&nbsp;&nbsp;&nbsp;
                <a href="#" onClick="last2()">尾页</a>
                第<input name="busjump" type="text" size="3"/>页 <a href="#" onClick="bjump2()">转到</a>
            </form>
            <div align="center">
                <%
                    String member2 = (String) session.getAttribute("user");
                    if (member2 == null) {
                %>
                <br>
                留言请登录！
                <br>
                <%} else { %>
                <form name="form1" action="<%=basePath %>ComServlet?method=addjy" method="post" class="regFormtwo">
                    <div class="loginBuyListtwo">
                        <label for="name">建议内容：</label>
                        <textarea style="border-radius:1em;" name="content" cols="100" rows="6" required></textarea>
                    </div>
                    <div class="regSubstwo">
                        <input type="submit" value="提交建议"/>
                    </div>
                </form>
                <%} %>
            </div>
        </div>
    </div>

</div>

<%@ include file="iframe/foot.jsp" %>