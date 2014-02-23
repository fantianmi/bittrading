<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.mvc.entity.*" %>
<%if(request.getAttribute("msg")==null){
}else{
String msg = request.getAttribute("msg").toString();
String href = null;
%>
<script type="text/javascript">
 alert("<%=msg%>");
 <%if(request.getAttribute("href")!=null){ href = request.getAttribute("href").toString();%>
	 location.href="<%=request.getContextPath() %>/<%=href%>";
 <%}%>
</script>
<%} %>
<div class="wrapper col0">
  <div id="topline">
  <%if(session.getAttribute("uusername")==null){%>
  	<p><a href="index.htm?Login">登陆/注册</a></p>
  <%}else{ %>
    <p>欢迎回来：<a href="index.htm?Login"><%=session.getAttribute("uusername").toString()%></a>
    &nbsp;&nbsp;<a href="index.htm?logout">log out</a></p>
    <%} %>
    <ul>
      <li><a href="#">交易</a></li>
	  <li><a href="#">账户管理</a></li>
	  <li><a href="#">帮助</a></li>
      <li><a href="#">联系我们</a></li>
      <li><a href="#">API</a></li>
      <li class="last"><a href="#">推广佣金</a></li>
    </ul>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper">
  <div id="header">
    <div class="fl_left">
      <h1><a href="index.htm"><strong>比</strong>特币 <strong>交</strong>易中心</a></h1>
      <p>比特币，莱特币，山寨币交易平台 - 即时充值，实时取币，值得信赖</p>
    </div>
    <div class="fl_right"></div>
    <br class="clear" />
  </div>
  
<!-- ####################################################################################################### -->
<div class="wrapper col2">
  <div id="topbar">
    <div id="topnav">
      <ul>
        <li><a href="#">BTC</a>
          <ul>
            <li><a href="#">Link 1</a></li>
            <li><a href="#">Link 2</a></li>
            <li><a href="#">Link 3</a></li>
          </ul>
        </li>
		<li><a href="#">CNY</a>
          <ul>
            <li><a href="#">Link 1</a></li>
            <li><a href="#">Link 2</a></li>
            <li><a href="#">Link 3</a></li>
          </ul>
        </li>
		<li><a href="#">LTC</a>
          <ul>
            <li><a href="#">Link 1</a></li>
            <li><a href="#">Link 2</a></li>
            <li><a href="#">Link 3</a></li>
          </ul>
        </li>
		<li><a href="#">BQC</a>
          <ul>
            <li><a href="#">Link 1</a></li>
            <li><a href="#">Link 2</a></li>
            <li><a href="#">Link 3</a></li>
          </ul>
        </li>
		<li><a href="#">YAC</a>
          <ul>
            <li><a href="#">Link 1</a></li>
            <li><a href="#">Link 2</a></li>
            <li><a href="#">Link 3</a></li>
          </ul>
        </li>
		<li><a href="#">FTC</a>
          <ul>
            <li><a href="#">Link 1</a></li>
            <li><a href="#">Link 2</a></li>
            <li><a href="#">Link 3</a></li>
          </ul>
        </li>
		<li><a href="#">IFC</a>
          <ul>
            <li><a href="#">Link 1</a></li>
            <li><a href="#">Link 2</a></li>
            <li><a href="#">Link 3</a></li>
          </ul>
        </li>
		<li><a href="#">BTC</a>
          <ul>
            <li><a href="#">Link 1</a></li>
            <li><a href="#">Link 2</a></li>
            <li><a href="#">Link 3</a></li>
          </ul>
        </li>
		<li><a href="#">CNY</a>
          <ul>
            <li><a href="#">Link 1</a></li>
            <li><a href="#">Link 2</a></li>
            <li><a href="#">Link 3</a></li>
          </ul>
        </li>
		<li><a href="#">LTC</a>
          <ul>
            <li><a href="#">Link 1</a></li>
            <li><a href="#">Link 2</a></li>
            <li><a href="#">Link 3</a></li>
          </ul>
        </li>
		<li><a href="#">BQC</a>
          <ul>
            <li><a href="#">Link 1</a></li>
            <li><a href="#">Link 2</a></li>
            <li><a href="#">Link 3</a></li>
          </ul>
        </li>
		<li><a href="#">YAC</a>
          <ul>
            <li><a href="#">Link 1</a></li>
            <li><a href="#">Link 2</a></li>
            <li><a href="#">Link 3</a></li>
          </ul>
        </li>
      </ul>
    </div>
    <br class="clear" />
  </div>
</div>

