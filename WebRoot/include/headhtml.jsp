<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.mvc.entity.*" %>
<%if(request.getAttribute("msg")==null){
	
}else if(request.getAttribute("msg").toString() == "registerSucess"){%>
<script type="text/javascript">
 alert("注册成功!点击[确定]回到首页");
 location.href="<%=request.getContextPath() %>/index.htm";
</script>
<%}else if(request.getAttribute("msg").toString() == "loginSucess"){%>
<script type="text/javascript">
 alert("欢迎回来!点击[确定]回到首页");
 location.href="<%=request.getContextPath() %>/index.htm";
</script>
<%}else if(request.getAttribute("msg").toString() == "promotesuccess"){%>
<script type="text/javascript">
 alert("谢谢完善资料，现在您可以开始自由交易了!点击[确定]回到首页");
 location.href="<%=request.getContextPath() %>/index.htm";
</script>
<%}else if(request.getAttribute("msg").toString() == "logoutSucess"){%>
<script type="text/javascript">
 alert("已安全退出");
 location.href="<%=request.getContextPath() %>/index.htm";
</script>
<%}else if(request.getAttribute("msg").toString() == "utpasswordwrong"){%>
<script type="text/javascript">
 alert("交易密码输入错误，请确认后重新输入");
 location.href="<%=request.getContextPath() %>/index.htm";
</script>
<%}else if(request.getAttribute("msg").toString() == "rechargesucess"){%>
<script type="text/javascript">
 alert("恭喜您，充值成功！我们确认收到您的汇款之后会立即给您充入到平台账户中");
 location.href="<%=request.getContextPath() %>/index.htm";
</script>
<%}else if(request.getAttribute("msg").toString() == "loginfirst"){%>
<script type="text/javascript">
 alert("登陆后才能进行此操作！");
 location.href="<%=request.getContextPath() %>/index.htm";
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

