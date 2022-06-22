<%@ page language="java" import="java.util.*"  contentType="text/html;charset=utf-8" %> 
<%@ include file="iframe/head.jsp" %> 
<script  language="javascript" >
function top2(){
   	form3.action="<%=basePath%>index.jsp?page=1";
    form3.submit();
}
function last2(){
    if(form3.pageCount.value==0){//如果总页数为0，那么最后一页为1，也就是第一页，而不是第0页
    form3.action="<%=basePath%>index.jsp?page=1";
    form3.submit();
	}else{
	form3.action="<%=basePath%>index.jsp?page="+form3.pageCount.value;
    	form3.submit();
	}
}
function pre2(){
  var page=parseInt(form3.page.value);
  if(page<=1){
    alert("已至第一页");
  }else{
    form3.action="<%=basePath%>index.jsp?page="+(page-1);
    form3.submit();
  }
}

function next2(){
  var page=parseInt(form3.page.value);
  var pageCount=parseInt(form3.pageCount.value);
  if(page>=pageCount){
    alert("已至最后一页");
  }else{
    form3.action="<%=basePath%>index.jsp?page="+(page+1);
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
	  form3.action="<%=basePath%>index.jsp?page=1";
	  form3.submit();
	}
	else{
		form3.action="<%=basePath%>index.jsp?page="+pageCount;
		form3.submit();
	}
}
else if(form3.busjump.value<=pageCount){
var page=parseInt(form3.busjump.value);
   if(page==0){
      page=1;//如果你输入的是0，那么就让它等于1
      form3.action="<%=basePath%>index.jsp?page="+page;
      form3.submit();
   }else{
      form3.action="<%=basePath%>index.jsp?page="+page;
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

 <div class="proBox" style="margin-top: 60px;">
  <!--proSelect/-->
  <div class="search">
    <form action="<%=basePath %>index.jsp?s=y" method="post">
	     <input type="submit" value=""/>
	     <input type="search" name="search" placeholder="搜索"/>
	     <scan>查询类型：<select name="choose" required>
    		  <option value="title">书名</option>
    		  <option value="bkwriter">作者</option>
    		  <option value="saleway">付费方式</option>
        </select></scan>
        <scan>价格区间：<select name="price" required>
        	<option value="all">无</option>
    		  <option value="1">10元以下</option>
    		  <option value="2">10-50元</option>
    		  <option value="3">50-100元</option>
    		  <option value="4">100元以上</option>
        </select></scan>
	</form>
    </div>
  <div class="sells">
<%
	if(request.getParameter("s")!=null){
		cb.setEVERYPAGENUM(15);
		List pagelist3 = null;
		String search=request.getParameter("search"), choose=request.getParameter("choose"), price=request.getParameter("price");
		if(price.equals("all")){
			int cou = cb.getMessageCount("select count(*) from booknews where "+choose+" like '%"+search+"%'");//得到信息总数			        
			String page1=request.getParameter("page");
			if(page1==null){
				page1="1";
			}
			session.setAttribute("busMessageCount", cou + "");
			session.setAttribute("busPage", page1);
			List pagelist1 = cb.getMessage(Integer.parseInt(page1),"select * from booknews where "+choose+" like '%"+search+"%' order by bnid desc",12);
			session.setAttribute("qqq", pagelist1);
			int pageCount = cb.getPageCount(); //得到页数  
			session.setAttribute("busPageCount", pageCount + ""); 
			pagelist3 = cb.getCom("select * from booknews where "+choose+" like '%"+search+"%' order by bnid desc limit 10",12); 
		}
		else{
			int a=0,b=0;
			if(price.equals("1")){a=0;b=9;}
			else if(price.equals("2")){a=10;b=50;}
			else if(price.equals("3")){a=51;b=100;}
			else{a=101;b=2147483647;}
			int cou = cb.getMessageCount("select count(*) from booknews where "+choose+" like '%"+search+"%' and price>="+a+" and price<="+b);//得到信息总数			        
			String page1=request.getParameter("page");
			if(page1==null){
				page1="1";
			}
			session.setAttribute("busMessageCount", cou + "");
			session.setAttribute("busPage", page1);
			List pagelist1 = cb.getMessage(Integer.parseInt(page1),"select * from booknews where "+choose+" like '%"+search+"%'  and price>="+a+" and price<="+b+" order by bnid desc",12);
			session.setAttribute("qqq", pagelist1);
			int pageCount = cb.getPageCount(); //得到页数  
			session.setAttribute("busPageCount", pageCount + ""); 
			pagelist3 = cb.getCom("select * from booknews where "+choose+" like '%"+search+"%'  and price>="+a+" and price<="+b+" order by bnid desc limit 10",12); 
		}
			if(!pagelist3.isEmpty()){
			for(int i=0;i<pagelist3.size();i++){
				List pagelist2 =(ArrayList)pagelist3.get(i); 
	%>
<div class="layui-row layui-col-space15">
  <div class="layui-col-md12">
    <div class="layui-panel">
      <div style="padding: 30px; height:250px;">
      <dd><h3 style="word-break:break-all; white-space:nowrap; text-overflow:ellipsis; overflow:hidden;"><a href="<%=basePath %>bkxwinfo.jsp?id=<%=pagelist2.get(0).toString()%>"><%=pagelist2.get(6).toString()%></a></h3>
	      <div style="margin-right:-125px;margin-top:-62px;float:right; width:120px; height:180px; border:0.1px solid #dfdfdf; background:url(<%=basePath+pagelist2.get(11).toString() %>) center center no-repeat; background-size:cover;"></div>
	     <h5>作者：<%=pagelist2.get(4).toString()%></h5>
	     <h5>信息来源：<%=pagelist2.get(3).toString()%></h5>
	     <h5>发布时间：<%=pagelist2.get(5).toString().substring(0,pagelist2.get(5).toString().length()-5)%></h5>
	     <h5>支付方式：<%=pagelist2.get(10).toString()%></h5><br/>
	     <font style="clear:both;margin-left:105%;color:red;font-size:22px;">￥<%=pagelist2.get(8).toString()%></font>
	     <font style="color:#909090;"><%=pagelist2.get(9).toString()%></font>
	     <div class="sellmails">
	      <a href="<%=basePath%>bkxwinfo.jsp?id=<%=pagelist2.get(0).toString()%>">查看详细</a>
	     </div></dd></div>
    </div>   
  </div>
</div>    
	   <%-- <dl>
	    <dd>
	     <h3 style="word-break:break-all; white-space:nowrap; text-overflow:ellipsis; overflow:hidden;"><a href="<%=basePath %>bkxwinfo.jsp?id=<%=pagelist2.get(0).toString()%>"><%=pagelist2.get(6).toString()%></a></h3>
	      <div style="margin-right:-145px;margin-top:-62px;float:right; width:120px; height:180px; border:0.1px solid #dfdfdf; background:url(<%=basePath+pagelist2.get(11).toString() %>) center center no-repeat; background-size:cover;"></div>
	     <h5>作者：<%=pagelist2.get(4).toString()%></h5>
	     <h5>信息来源：<%=pagelist2.get(3).toString()%></h5>
	     <h5>发布时间：<%=pagelist2.get(5).toString()%></h5>
	     <h5>支付方式：<%=pagelist2.get(10).toString()%></h5><br/>
	     <font style="clear:both;margin-left:108%;color:red;font-size:22px;">￥<%=pagelist2.get(8).toString()%></font>
	     <font style="color:#909090;"><%=pagelist2.get(9).toString()%></font>
	     <div class="sellmails">
	      <a href="<%=basePath%>bkxwinfo.jsp?id=<%=pagelist2.get(0).toString()%>">查看详细</a>
	     </div><!--sellmails/-->
	    </dd>
	    <div class="clears"></div>
	   </dl> --%>
	<%}}}
	else{
	cb.setEVERYPAGENUM(15);
	int cou = cb.getMessageCount("select count(*) from booknews ");//得到信息总数			        
	String page1=request.getParameter("page");
	if(page1==null){
		page1="1";
	}
	session.setAttribute("busMessageCount", cou + "");
	session.setAttribute("busPage", page1);
	List pagelist1 = cb.getMessage(Integer.parseInt(page1),"select * from booknews order by bnid desc",12);
	session.setAttribute("qqq", pagelist1);
	int pageCount = cb.getPageCount(); //得到页数  
	session.setAttribute("busPageCount", pageCount + ""); 
	List pagelist3 = cb.getCom("select * from booknews order by bnid desc limit 10",12); 
		if(!pagelist3.isEmpty()){
		for(int i=0;i<pagelist3.size();i++){
			List pagelist2 =(ArrayList)pagelist3.get(i); 
%>
	<div class="layui-row layui-col-space15">
	  <div class="layui-col-md12">
	    <div class="layui-panel">
	      <div style="padding: 30px; height:250px;">
	      <dd><h3 style="word-break:break-all; white-space:nowrap; text-overflow:ellipsis; overflow:hidden;"><a href="<%=basePath %>bkxwinfo.jsp?id=<%=pagelist2.get(0).toString()%>"><%=pagelist2.get(6).toString()%></a></h3>
		      <div style="margin-right:-125px;margin-top:-62px;float:right; width:120px; height:180px; border:0.1px solid #dfdfdf; background:url(<%=basePath+pagelist2.get(11).toString() %>) center center no-repeat; background-size:cover;"></div>
		     <h5>作者：<%=pagelist2.get(4).toString()%></h5>
		     <h5>信息来源：<%=pagelist2.get(3).toString()%></h5>
		     <h5>发布时间：<%=pagelist2.get(5).toString().substring(0,pagelist2.get(5).toString().length()-5)%></h5>
		     <h5>支付方式：<%=pagelist2.get(10).toString()%></h5><br/>
		     <font style="clear:both;margin-left:105%;color:red;font-size:22px;">￥<%=pagelist2.get(8).toString()%></font>
		     <font style="color:#909090;"><%=pagelist2.get(9).toString()%></font>
		     <div class="sellmails">
		      <a href="<%=basePath%>bkxwinfo.jsp?id=<%=pagelist2.get(0).toString()%>">查看详细</a>
		     </div></div></dd>
	    </div>   
	  </div>
	</div>    
   <%-- <dl>
    <dd>
     <h3 style="word-break:break-all; white-space:nowrap; text-overflow:ellipsis; overflow:hidden;"><a href="<%=basePath %>bkxwinfo.jsp?id=<%=pagelist2.get(0).toString()%>"><%=pagelist2.get(6).toString()%></a></h3>
	 <div style="margin-right:-145px;margin-top:-62px; float:right; width:120px; height:180px; border:0.1px solid #dfdfdf; background:url(<%=basePath+pagelist2.get(11).toString() %>) center center no-repeat; background-size:cover;"></div>
     <h5>作者：<%=pagelist2.get(4).toString()%></h5>
     <h5>信息来源：<%=pagelist2.get(3).toString()%></h5>
     <h5>发布时间：<%=pagelist2.get(5).toString()%></h5>
     <h5>支付方式：<%=pagelist2.get(10).toString()%></h5><br/>
     <font style="clear:both;margin-left:108%;color:red;font-size:22px;">￥<%=pagelist2.get(8).toString()%></font>
     <font style="color:#909090;padding:0;"><%=pagelist2.get(9).toString()%></font>
     <div class="sellmails">
      <a href="<%=basePath%>bkxwinfo.jsp?id=<%=pagelist2.get(0).toString()%>">查看详细</a>
     </div><!--sellmails/-->
    </dd>
    <div class="clears"></div>
   </dl> --%>
<%}}} %>
   <br /><br />
<div class="badoo">
 <form action="" method="post" name="form3">
  <input type="hidden" name="pageCount" value="<%=session.getAttribute("busPageCount").toString() %>" />   <!--//用于给上面javascript传值-->
<input type="hidden" name="page" value="<%=session.getAttribute("busPage").toString()%>" />   <!--//用于给上面javascript传值-->         
		<a href="#" onClick="top2()">首页</a>&nbsp;&nbsp;&nbsp;
		<a href="#" onClick="pre2()">上一页</a>&nbsp;&nbsp;&nbsp;
		 共<%=session.getAttribute("busMessageCount").toString()%>条记录,共计<%=session.getAttribute("busPageCount").toString()%>页,当前第<%=session.getAttribute("busPage").toString()%>页&nbsp;&nbsp;&nbsp;
		<a href="#" onClick="next2()">下一页</a>&nbsp;&nbsp;&nbsp;
		<a href="#" onClick="last2()">尾页</a>
	 第<input name="busjump" type="text" size="3"/>页 <a href="#" onClick="bjump2()">转到</a></span>
	</form> 
   </div>
  </div><!--sells/-->
  
 </div>
 
<%@ include file="iframe/foot.jsp" %>
