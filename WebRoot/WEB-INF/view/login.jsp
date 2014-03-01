<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">
<head profile="http://gmpg.org/xfn/11">
<title>现在登录注册成为我们的客户</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="styles/layout.css" type="text/css" />
<link rel="icon" href="favicon.ico" type="image/x-icon" />
</head>
<body id="top">
<jsp:include page="/include/headhtml.jsp"></jsp:include>
<!-- ####################################################################################################### -->
<div class="wrapper">
  <div id="breadcrumb">
    <ul>
      <li class="first">您的位置</li>
      <li>&#187;</li>
      <li><a href="#">登录/注册比特币交易中心</a></li>  
    </ul>
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper">
  <div class="container">
    <div class="content-login">
      <h2>欢迎登录比特币交易中心</h2>
      <div id="respond">
      <p><c:out value="${error}"></c:out></p>
        <form method="post" action="<%=request.getContextPath() %>/vertify.htm">
          <p>
            <label for="name"><small>用户名 </small></label>
			<input type="text" name="uusername" id="name" value="" size="22" />
          </p>
          <p>
		    <label for="email"><small>密&nbsp;&nbsp;码</small></label>
            <input type="password" name="upassword" id="email" value="" size="22" />
          </p>
		  <p>
            <input type="checkbox" name="remuname" value="true"><small><span>一周内记住密码</span></small>
          </p>
          <p>
            <input name="submit" type="submit" id="submit" value="登录" />
            &nbsp;
          </p>
        </form>
		<p><h5>还不是比特币交易中心用户？</h5></p>
		<p>现在免费注册成为比特币用户，便能立刻享受快捷方面的比特币交易服务,快来加入吧。</p>
		<input name="reset" type="reset" id="reset" tabindex="5" value="注册" onClick="javascript:location.href='vertify.htm?Register'"/>
      </div>
    </div>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<jsp:include page="/include/foothtml.jsp"></jsp:include>
</body>
</html>

