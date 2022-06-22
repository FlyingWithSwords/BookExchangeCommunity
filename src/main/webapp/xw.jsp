<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8" %>
<%@ include file="iframe/head.jsp" %>

<script language="javascript">
    function top2() {
        form3.action = "<%=basePath%>xw.jsp?page=1";
        form3.submit();
    }

    function last2() {
        if (form3.pageCount.value == 0) {//如果总页数为0，那么最后一页为1，也就是第一页，而不是第0页
            form3.action = "<%=basePath%>xw.jsp?page=1";
            form3.submit();
        } else {
            form3.action = "<%=basePath%>xw.jsp?page=" + form3.pageCount.value;
            form3.submit();
        }
    }

    function pre2() {
        var page = parseInt(form3.page.value);
        if (page <= 1) {
            alert("已至第一页");
        } else {
            form3.action = "<%=basePath%>xw.jsp?page=" + (page - 1);
            form3.submit();
        }
    }

    function next2() {
        var page = parseInt(form3.page.value);
        var pageCount = parseInt(form3.pageCount.value);
        if (page >= pageCount) {
            alert("已至最后一页");
        } else {
            form3.action = "<%=basePath%>xw.jsp?page=" + (page + 1);
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
                form3.action = "<%=basePath%>xw.jsp?page=1";
                form3.submit();
            } else {
                form3.action = "<%=basePath%>xw.jsp?page=" + pageCount;
                form3.submit();
            }
        } else if (form3.busjump.value <= pageCount) {
            var page = parseInt(form3.busjump.value);
            if (page == 0) {
                page = 1;//如果你输入的是0，那么就让它等于1
                form3.action = "<%=basePath%>xw.jsp?page=" + page;
                form3.submit();
            } else {
                form3.action = "<%=basePath%>xw.jsp?page=" + page;
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
            int cou = cb.getMessageCount("select count(*) from news");//得到信息总数
            String page1 = request.getParameter("page");
            if (page1 == null) {
                page1 = "1";
            }
            session.setAttribute("busMessageCount", cou + "");
            session.setAttribute("busPage", page1);
            List pagelist1 = cb.getMessage(Integer.parseInt(page1), "select * from news order by nid desc", 7);
            session.setAttribute("qqq", pagelist1);
            int pageCount = cb.getPageCount(); //得到页数
            session.setAttribute("busPageCount", pageCount + "");
            List pagelist3 = (ArrayList) session.getAttribute("qqq");
            if (!pagelist3.isEmpty()) {
                for (int i = 0; i < pagelist3.size(); i++) {
                    List pagelist2 = (ArrayList) pagelist3.get(i);
        %>
        <div class="layui-row layui-col-space15">
            <div class="layui-col-md12">
                <div class="layui-panel">
                    <div style="padding: 30px;height:120px;">
                        <dd>
                            <h3 style="word-break:break-all; white-space:nowrap; text-overflow:ellipsis; overflow:hidden;">
                                <a href="<%=basePath %>xwinfo.jsp?id=<%=pagelist2.get(0).toString() %>"><%=pagelist2.get(5).toString() %>
                                </a></h3>
                            <div style="margin-right:-125px;margin-top:-62px; float:right; width:180px; height:120px; border:0.1px solid #dfdfdf; background:url(<%=basePath+pagelist2.get(6).toString() %>) center center no-repeat; background-size:cover;"></div>
                            <%--
                                 <div style="margin-right:-100px;margin-top:-50px;float:right;"><img src="<%=basePath+pagelist2.get(6).toString() %>" style="max-width:200px;myimg:expression_r(onload=function(){this.style.width=(this.offsetWidth > 200)?"200px":"auto"});"/></div> --%>
                            <div class="tishi">
      <span><p>信息来源：<%=pagelist2.get(3).toString() %></p>
		<p>发布时间：<%=pagelist2.get(4).toString().substring(0, pagelist2.get(4).toString().length() - 5) %></p></span>
                            </div>
                        </dd>
                    </div>
                </div>
            </div>
        </div>
        <%-- <dl>
         <dd>
          <h3 style="word-break:break-all; white-space:nowrap; text-overflow:ellipsis; overflow:hidden;"><a href="<%=basePath %>xwinfo.jsp?id=<%=pagelist2.get(0).toString() %>"><%=pagelist2.get(5).toString() %></a></h3>
          <div style="margin-right:-145px;margin-top:-62px; float:right; width:180px; height:120px; border:0.1px solid #dfdfdf; background:url(<%=basePath+pagelist2.get(6).toString() %>) center center no-repeat; background-size:cover;"></div>
          <div style="margin-right:-100px;margin-top:-50px;float:right;"><img src="<%=basePath+pagelist2.get(6).toString() %>" style="max-width:200px;myimg:expression_r(onload=function(){this.style.width=(this.offsetWidth > 200)?"200px":"auto"});"/></div>
          <div class="tishi">
           <span><p>信息来源：<%=pagelist2.get(3).toString() %></p>
             <p>发布时间：<%=pagelist2.get(4).toString() %></p></span>
          </div>
         </dd>
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
                第<input name="busjump" type="text" size="3"/>页 <a href="#" onClick="bjump2()">转到</a></span>
            </form>

        </div>
    </div>

</div>

<%@ include file="iframe/foot.jsp" %>