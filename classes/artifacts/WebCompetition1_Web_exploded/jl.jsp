<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="iframe/head.jsp" %> 
  <%
  	String id=request.getParameter("bkxwid");
  if(id==null){
  %>
  <iframe frameborder="0" scrolling="no" class="iframe" src="<%=basePath%>jlwindow.jsp"></iframe>
  <%}
  else{
  %>
  <iframe frameborder="0" scrolling="no" class="iframe" src="<%=basePath%>jlwindow.jsp?bkxwid=<%=id%>"></iframe>
  <%} %>
 </body>
 </html>