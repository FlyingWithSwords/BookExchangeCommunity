<%@ page language="java" import="java.util.*"  contentType="text/html;charset=utf-8" %> 
<%@ include file="iframe/head.jsp" %> 

<script  language="javascript" >
function top2(){
   	form3.action="<%=basePath%>jf.jsp?page=1";
    form3.submit();
}
function last2(){
    if(form3.pageCount.value==0){//如果总页数为0，那么最后一页为1，也就是第一页，而不是第0页
    form3.action="<%=basePath%>jf.jsp?page=1";
    form3.submit();
	}else{
	form3.action="<%=basePath%>jf.jsp?page="+form3.pageCount.value;
    	form3.submit();
	}
}
function pre2(){
  var page=parseInt(form3.page.value);
  if(page<=1){
    alert("已至第一页");
  }else{
    form3.action="<%=basePath%>jf.jsp?page="+(page-1);
    form3.submit();
  }
}

function next2(){
  var page=parseInt(form3.page.value);
  var pageCount=parseInt(form3.pageCount.value);
  if(page>=pageCount){
    alert("已至最后一页");
  }else{
    form3.action="<%=basePath%>jf.jsp?page="+(page+1);
    form3.submit();
  }
}
function bjump2(){
  	var pageCount=parseInt(form3.pageCount.value);
  	if( fIsNumber(form3.busjump.value,"1234567890")!=1 ){
		alert("跳转文本框中只能输入数字!");
		form3.busjump.select();
		form3.busjump.focus();
		return false;
	}
	if(form3.busjump.value>pageCount){//如果跳转文本框中输入的页数超过最后一页的数，则跳到最后一页
	  if(pageCount==0){	
	  form3.action="<%=basePath%>jf.jsp?page=1";
	  form3.submit();
	}
	else{
		form3.action="<%=basePath%>jf.jsp?page="+pageCount;
		form3.submit();
	}
}
else if(form3.busjump.value<=pageCount){
var page=parseInt(form3.busjump.value);
   if(page==0){
      page=1;//如果你输入的是0，那么就让它等于1
      form3.action="<%=basePath%>jf.jsp?page="+page;
      form3.submit();
   }else{
      form3.action="<%=basePath%>jf.jsp?page="+page;
      form3.submit();
   }

}

}
//****判断是否是Number.
function fIsNumber (sV,sR){
var sTmp;
if(sV.length==0){ return (false);}
for (var i=0; i < sV.length; i++){
sTmp= sV.substring (i, i+1);
if (sR.indexOf (sTmp, 0)==-1) {return (false);}
}
return (true);
}
</script>  

<div class="proBox">
  <!--proSelect/-->
  <div class="sells">
<%   
	cb.setEVERYPAGENUM(15);
	int cou = cb.getMessageCount("select count(*) from jifen");//得到信息总数			        
	String page1=request.getParameter("page");
	if(page1==null){
		page1="1";
	}
	session.setAttribute("busMessageCount", cou + "");
	session.setAttribute("busPage", page1);
	List pagelist1 = cb.getMessage(Integer.parseInt(page1),"SELECT MIN(id),username,SUM(jifen) AS jifen,MAX(TIME) AS TIME FROM jifen GROUP BY username ORDER BY jifen DESC",4);
	session.setAttribute("qqq", pagelist1);
	int pageCount = cb.getPageCount(); //得到页数  
	session.setAttribute("busPageCount", pageCount + ""); 
	List pagelist3=(ArrayList)session.getAttribute("qqq");
		if(!pagelist3.isEmpty()){
		for(int i=0;i<pagelist3.size();i++){
			List pagelist2 =(ArrayList)pagelist3.get(i); 
%>
   <div class="layui-row layui-col-space15">
  <div class="layui-col-md12">
    <div class="layui-panel">
      <div style="padding: 30px;"><h3><%=pagelist2.get(1).toString() %> </h3> 
     <div align="right" style="margin-top:-20px;">
      <span><strong style="font-size:18px;color:#9f9f9f;margin-right:0px;"><%=pagelist2.get(2).toString() %>
      <%if(session.getAttribute("user")!=null){String username=session.getAttribute("user").toString();if(pagelist2.get(1).toString().equals(username)) {%>
      <a href="<%=basePath %>member/index.jsp"> <img src="images/jfstar.png" width="40px" height="40px" style="margin-top:-60px;margin-right:-45px;"/></a> <%}} %></strong></span>
     </div> </div>
    </div>   
  </div>
</div>    
   <%-- <dl> 
    <dd>
    <h3><%=pagelist2.get(1).toString() %> </h3> 
     <div class="tishi" align="right" style="margin-top:-20px;">
      <span><strong style="font-size:18px;color:#9f9f9f;margin-right:-160px;"><%=pagelist2.get(2).toString() %>
      <%if(session.getAttribute("member")!=null){String username=session.getAttribute("member").toString();if(pagelist2.get(1).toString().equals(username)) {%>
      <a href="<%=basePath %>member/index.jsp"> <img src="images/jfstar.png" width="40px" height="40px" style="margin-top:-60px;margin-right:-45px;"/></a> <%}} %></strong></span>
     </div> 
    </dd> --%>
    <div class="clears"></div>
   </dl>
<% }} %> 
    
   <br /><br />
   <div class="badoo">
   <form action="" method="post" name="form3">
  <input type="hidden" name="pageCount" value="<%= session.getAttribute("busPageCount").toString()%>" /><!--//用于给上面javascript传值-->
<input type="hidden" name="page" value="<%=session.getAttribute("busPage").toString()%>" /><!--//用于给上面javascript传值-->         
		<a href="#" onClick="top2()">首页</a>&nbsp;&nbsp;&nbsp;
		<a href="#" onClick="pre2()">上一页</a>&nbsp;&nbsp;&nbsp;
		 共<%=session.getAttribute("busMessageCount").toString()%>条记录,共计<%=session.getAttribute("busPageCount").toString()%>页,当前第<%=session.getAttribute("busPage").toString()%>页&nbsp;&nbsp;&nbsp;
		<a href="#" onClick="next2()">下一页</a>&nbsp;&nbsp;&nbsp;
		<a href="#" onClick="last2()">尾页</a>
	 第<input name="busjump" type="text" size="3"/>页 <a href="#" onClick="bjump2()">转到</a></span>
	</form> 
 
   </div>
  </div> 
  
 </div>

<%@ include file="iframe/foot.jsp" %>