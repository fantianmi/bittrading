<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head profile="http://gmpg.org/xfn/11">
    <title>比特币充值</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="imagetoolbar" content="no" />
    <link rel="stylesheet" href="styles/layout.css" type="text/css" />
    <link rel="icon" href="favicon.ico" type="image/x-icon" />
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
	 <h3>比特币  充值</h3>
	  <div id="respond">
        <strong>请将BTC汇入如下地址：</strong>
      </div>
      <h2 style="color:#F00">1F58RPrwND5uDMejQA4oW89UkCjuftTird </h2>
	  <p>请通过 BTC 客户端或在线钱包将您需要充值的BTC数目发送到该地址。发送完成后，系统会自动在此交易获得 1 个确认后将该笔虚拟币充值到您在本站的账户，1 个确认需要大约 0.5 到 1 小时时间，请耐心等待。 同一个地址可多次充值，不影响到账。 </p>
	  <p>注意: 如果您的一次发送数量<span style="color:#F00">少于0.005 BTC</span>，系统将累积到0.005 BTC后入账。</p>
      <p>注意: 从矿池发送或者发送挖矿产生的虚拟币转账确认时间可能出现较长的情况，请尽量从您的钱包(Wallet)发送充值虚拟币。 </p>
      <h2>最近充值记录</h2>
      <table summary="Summary Here" cellpadding="0" cellspacing="0">
        <thead>
          <tr>
            <th>时间</th>
            <th>充值金额</th>
            <th>状态</th>
          </tr>
        </thead>
        <tbody>
       
          <tr>
            <td>暂无记录</td>
            <td>暂无记录</td>
            <td>暂无记录</td>       
          </tr>
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
