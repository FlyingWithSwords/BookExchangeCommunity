<%@ page language="java" import="java.util.*"  contentType="text/html;charset=utf-8" %> 
<%@ include file="iframe/head.jsp" %>   

<%   
	String id=request.getParameter("id");
	List list2 = cb.get1Com("select * from news where nid='"+id+"'",7); 
%>
<style type="text/css">
strong,h1,h2,h3,h4,h5{
	line-height:40px;
}
</style>
<div class="helpBox"> 
  <div class="helpRight">
   <div class="helpPar">
     <ol> 
       <li>
         <div align="center"><strong><%=list2.get(5).toString() %><br /></strong>
		作者：<%=list2.get(2).toString() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		信息来源：<%=list2.get(3).toString() %><br/><br/>
		发布时间：<%=list2.get(4).toString().substring(0,list2.get(4).toString().length()-5) %><br><br><%-- <img src="<%=basePath+list2.get(6).toString() %>"  style="margin-bottom:50px;max-width:200px;myimg:expression_r(onload=function(){this.style.width=(this.offsetWidth > 200)?"200px":"auto"}/> --%></div>
		<div style="width:950px;word-wrap:break-word;"><p class="content"><%=list2.get(1).toString() %></p></div>
       </li>
     </ol>
     <br />
   </div> 
  </div> 
  <div class="clears"></div>
 </div>
<%@ include file="iframe/foot.jsp" %>