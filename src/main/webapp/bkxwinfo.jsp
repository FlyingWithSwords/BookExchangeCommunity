<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8" %>
<%@ include file="iframe/head.jsp" %>

<%
    String id = request.getParameter("id");
    List list2 = cb.get1Com("select * from booknews where bnid='" + id + "'", 12);
%>
<% List pagelist30 = cb.getCom("select * from user where username='" + list2.get(2).toString() + "'", 2);
    String per = "";
    if (!pagelist30.isEmpty()) {
        for (int i = 0; i < pagelist30.size(); i++) {
            List pagelist20 = (ArrayList) pagelist30.get(i);
%>
<style type="text/css">
    strong, h1, h2, h3, h4, h5 {
        line-height: 40px;
    }

    .helpBox .helpRight .helpPar .buybtn {
        border-radius: 10px;
        border: 0;
        background: #393D49;
        color: #fff; /* width:152px;height:41px; */
        padding: 12px 36px;
        font-size: 14px;
        cursor: pointer;
        transition: all 0.6s;
        -ms-transition: all 0.8s;
    }

    .helpBox .helpRight .helpPar .buybtn:hover {
        background: #191D29;
    }
</style>
<div style="position: relative;">
    <div style="background:url(<%=basePath+list2.get(11).toString() %>) center center no-repeat; width:100%; height:100%; background-size:cover; z-index: 0; background-attachment: fixed; position: absolute; -webkit-filter: blur(10px); filter:alpha(opacity=15); -moz-opacity:0.15; opacity:0.15;"></div>
    <div class="helpBox" style="z-index: 1; position: relative;">
        <div class="helpRight" style="border:0;">
            <div class="helpPar">

                <ol>
                    <li>
                        <div align="center"><strong><%=list2.get(6).toString() %><br/></strong>
                            发布人：<a href="<%=basePath%>jl.jsp?bkxwid=<%=pagelist20.get(0).toString() %>"
                                   target="menuFrame"><%=list2.get(2).toString() %>
                            </a><%
                                    }
                                }
                            %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            书籍作者：<%=list2.get(4).toString() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            信息来源：<%=list2.get(3).toString() %><br/><br/>
                            发布时间：<%=list2.get(5).toString().substring(0, list2.get(5).toString().length() - 5) %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            支付方式：<%=list2.get(10).toString() %><br><br><img
                                    src="<%=basePath+list2.get(11).toString() %>"
                                    style="margin-bottom:50px;max-width:250px;myimg:expression_r(onload=function(){this.style.width=(this.offsetWidth > 250)?"
                                    250px":"auto"}"/>
                        </div>
                        <div style="width:950px;word-wrap:break-word;"><p><%=list2.get(1).toString() %>
                        </p></div>
                    </li>
                    <li>
                        <div style="text-align:right;"><font
                                style="color:red;font-size:24px;">￥<%=list2.get(8).toString() %>
                        </font><br/><br/><font style="text-align:right;color:#909090;"><%=list2.get(9).toString() %>
                        </font></div>
                    </li>
                    <% String mine = (String) session.getAttribute("user");
                        if (session.getAttribute("user") != null) {
                            if (!mine.equals(list2.get(2).toString())) {
                    %>
                    <center><a
                            href="<%=basePath%>ComServlet?inf=1&method=addbuy&username=<%=mine %>&bnid=<%=id %>&price=<%=list2.get(8).toString() %>"
                            class="buybtn">购买</a></center>
                    <%} else {%>
                    <center><a href="<%=basePath %>member/index.jsp" class="buybtn">管理</a></center>
                    <%
                            }
                        }
                    %>
                </ol>
                <br/>

            </div>
        </div>
        <div class="clears"></div>
    </div>
</div>
<%@ include file="iframe/foot.jsp" %>