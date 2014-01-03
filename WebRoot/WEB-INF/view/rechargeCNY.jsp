<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head profile="http://gmpg.org/xfn/11">
    <title>人民币充值</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="imagetoolbar" content="no" />
    <link rel="stylesheet" href="styles/layout.css" type="text/css" />
    <script language="JavaScript" type="text/javascript" src="script/jquery.js"></script>
	<script language="JavaScript" type="text/javascript" src="script/jquery.corner.js"></script>
	<script language="JavaScript" type="text/javascript" src="script/jVal.js"></script>
	<link rel="stylesheet" type="text/css" href="styles/jVal.css">
</head>
  
 <body id="top">
<jsp:include page="/include/headhtml.jsp"></jsp:include>
<!-- #########################wrapper1 area######################################################### -->
<div class="wrapper">
<!--#############container area#################-->
  <div class="container">
  <!--########colum area#########-->
    <div class="column">
	<!--*************user info***************-->
     <jsp:include page="/include/lpanelhtml.jsp"></jsp:include>
    <!--*************/user info**************-->
    </div>
  <!--########/colum area#########-->
  <!--########content area###########-->
    <div class="content-index">
	<!-- ********************** trade area ********************************** -->
	 <h3>人民币 充值</h3>
	  <div id="respond">
        <form action="recharge.htm?CNY" method="post">
          <p>
		    <label for="email">交易密码：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input name="utpassword" id="email" value="" size="22" type="password">
            <label for="email">请输入您的交易密码</label>
          </p>
          <p>
		    <label for="email">充值金额 (￥)：</label>
            <input name="bro_recharge_acount" id="email" value="" size="22" type="text">
            <label for="email">最小200元</label>
          </p>
		  <p>
		    <label for="email">发款人姓名：&nbsp;&nbsp;&nbsp;</label>
            <input name="bro_sname" id="email" value="" size="22" type="text">
            <label for="email">请准确填写发款账号的"姓名"，非账号</label>
          </p>
		  <p>
		    <label for="email">充值方式：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <select name="bro_recharge_way">
			<option value="网银充值">网银充值方式</option>
			</select>
            <label for="email">请您选择充值的方式：网银 或者 财付通。</label>
          </p>
          <p>
            &nbsp;
          </p>
          <p>
            <input name="submit" id="submit" value="充值" type="submit">         
          </p>
        </form>
      </div>
      <p>“网银充值”充值 即时到帐</p>
	  <p>“财付通”充值 1分钟可到账 ( 暂停）</p>
	  <p>“支付宝”充值 1分钟可到账 ( 暂停）</p>
      <p>如果您充值后24小时未到账或未填付款说明，请发付款信息到: support@bter.com 。我们会有专人为您处理。</p>
      <img class="imgl" src="images/demo/tenpay-icon.jpg" alt="" height="25">
      财付通 充值方式需要您通过财付通的 “付款” 功能向指定账户付款，之后由我们人工确认并将人民币充值到您的账户。财付通充值方式手续费为 0%。您可以使用您的 QQ 号和密码直接登录财付通。请您点击这里访问财付通。</p>
	  <p><img class="avatar" src="images/demo/banks.png"></p> 
      <h2>最近充值记录</h2>
      <table summary="Summary Here" cellpadding="0" cellspacing="0">
        <thead>
          <tr>
            <th>单号</th>
            <th>充值方式</th>
            <th>充值金额（元）</th>
            <th>手续费（元）</th>
			<th>充值时间</th>
			<th>备注/回执单</th>
          </tr>
        </thead>
        <tbody>
        <c:forEach items="${listOrder}" var="Btc_rechargeCNY_order" varStatus="status">
          <tr <c:if test="${status.count%2==0}"> class="light" </c:if>>
            <td>${Btc_rechargeCNY_order.bro_id}</td>
            <td>${Btc_rechargeCNY_order.bro_recharge_way}</td>
            <td>${Btc_rechargeCNY_order.bro_recharge_acount}</td>
            <td>${Btc_rechargeCNY_order.bro_factorage}</td>
			<td>${Btc_rechargeCNY_order.bro_recharge_time}</td>
            <td>${Btc_rechargeCNY_order.bro_remark}</td>
          </tr>
          </c:forEach>
        </tbody>
      </table>
	<!-- ********************** /trade area ********************************** -->
</div>
  <!--########/content area###########-->   
	<br class="clear" />
  </div>
<!--#############/container area#################-->
</div>
<!-- #########################/wrapper1 area######################################################### -->
<jsp:include page="/include/foothtml.jsp"></jsp:include>
</body>
</html>
