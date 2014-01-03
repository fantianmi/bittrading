<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">
<head profile="http://gmpg.org/xfn/11">
<title>比特币交易平台</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="styles/layout.css" type="text/css" />
<script type="text/javascript" src="scripts/jquery-1.4.1.min.js"></script>
<script type="text/javascript" src="scripts/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="scripts/jquery.timers.1.2.js"></script>
<script type="text/javascript" src="scripts/jquery.galleryview.2.1.1.min.js"></script>
<script type="text/javascript" src="scripts/jquery.galleryview.setup.js"></script>
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
   <div id="hpage_cats">
	 <!--************buy fence**************-->
		<div class="fl_right">
		  <h2><a href="#">买入BTC &raquo;</a></h2>
		  <table summary="Summary Here" cellpadding="0" cellspacing="0">
			<tbody>
			  <tr class="dark">
				<td>最佳买价</td>
				<td>5662.20</td>
				<td>CNY/BTC</td>
			  </tr>
			  <tr class="dark">
				<td>当前余额</td>
				<td>0.0000</td>
				<td>BTC</td>
			  </tr>
			  <tr class="dark">
				<td>可兑换额</td>
				<td>0.00</td>
				<td>CNY</td>
			  </tr>
			  <tr class="dark">
				<td>买入价</td>
				<td>Value 14</td>
				<td>CNY/BTC</td>
			  </tr>
			  <tr class="dark">
				<td>买入量</td>
				<td>Value 14</td>
				<td>BTC</td>
			  </tr>
			  <tr class="dark">
				<td>兑换额</td>
				<td>Value 14</td>
				<td>CNY</td>
			  </tr>
			  <tr class="dark">
				<td>手续费</td>
				<td>0</td>
				<td>BTC(0%)</td>
			  </tr>
			  <tr class="dark">
				<td>.</td>
				<td>.</td>
				<td>.</td>
			  </tr>
			</tbody>
		  </table>
    </div>
     <!--************/buy fence**************-->
	 <!--************sale fence*************-->
	<div class="fl_right">
      <h2><a href="#">卖出BTC &raquo;</a></h2>
      <table summary="Summary Here" cellpadding="0" cellspacing="0">
        <tbody>
          <tr class="dark">
            <td>最佳卖价</td>
            <td>5662.20</td>
            <td>CNY/BTC</td>
          </tr>
          <tr class="dark">
            <td>当前余额</td>
            <td>0.0000</td>
            <td>BTC</td>
          </tr>
          <tr class="dark">
            <td>可兑换额</td>
            <td>0.00</td>
            <td>CNY</td>
          </tr>
          <tr class="dark">
            <td>卖出价</td>
            <td>Value 14</td>
            <td>CNY/BTC</td>
          </tr>
		  <tr class="dark">
            <td>卖出量</td>
            <td>Value 14</td>
            <td>BTC</td>
          </tr>
		  <tr class="dark">
            <td>兑换额</td>
            <td>Value 14</td>
            <td>CNY</td>
          </tr>
		  <tr class="dark">
            <td>手续费</td>
            <td>0</td>
            <td>BTC(0%)</td>
          </tr>
		  <tr class="dark">
            <td>.</td>
            <td>.</td>
            <td>.</td>
          </tr>
        </tbody>
      </table>
    </div>
     <!--************/sale fence*************-->
	 <br class="clear" />
	 <!--************buy order list*********--> 
    <div class="fl_right">
      <h2><a href="#">买单 &raquo;</a></h2>
      <table summary="Summary Here" cellpadding="0" cellspacing="0">
        <thead>
          <tr>
            <th width="26%">买入价</th>
            <th width="37%">买入量（BTC）</th>
            <th width="37%">兑换额（CNY)</th>
          </tr>
        </thead>
        <tbody>
          <tr class="light">
            <td>Value 1</td>
            <td>Value 2</td>
            <td>Value 3</td>
          </tr>
          <tr class="dark">
            <td>Value 5</td>
            <td>Value 6</td>
            <td>Value 7</td>
          </tr>
          <tr class="light">
            <td>Value 9</td>
            <td>Value 10</td>
            <td>Value 11</td>
          </tr>
          <tr class="dark">
            <td>Value 13</td>
            <td>Value 14</td>
            <td>Value 15</td>
          </tr>
		  <tr class="light">
            <td>Value 9</td>
            <td>Value 10</td>
            <td>Value 11</td>
          </tr>
          <tr class="dark">
            <td>Value 13</td>
            <td>Value 14</td>
            <td>Value 15</td>
          </tr>
		  <tr class="light">
            <td>Value 9</td>
            <td>Value 10</td>
            <td>Value 11</td>
          </tr>
          <tr class="dark">
            <td>Value 13</td>
            <td>Value 14</td>
            <td>Value 15</td>
          </tr>
		  <tr class="light">
            <td>Value 9</td>
            <td>Value 10</td>
            <td>Value 11</td>
          </tr>
          <tr class="dark">
            <td>Value 13</td>
            <td>Value 14</td>
            <td>Value 15</td>
          </tr>
        </tbody>
      </table>
    </div>
     <!--************/buy order list*********--> 
	 <!--************sale order list*********-->
	<div class="fl_right">
      <h2><a href="#">卖单&raquo;</a></h2>
      <table summary="Summary Here" cellpadding="0" cellspacing="0">
        <thead>
          <tr>
            <th>卖出价</th>
            <th>卖出量（BTC)</th>
            <th>兑换额（CNY）</th>
          </tr>
        </thead>
        <tbody>
          <tr class="light">
            <td>Value 1</td>
            <td>Value 2</td>
            <td>Value 3</td>
          </tr>
          <tr class="dark">
            <td>Value 5</td>
            <td>Value 6</td>
            <td>Value 7</td>
          </tr>
          <tr class="light">
            <td>Value 9</td>
            <td>Value 10</td>
            <td>Value 11</td>
          </tr>
          <tr class="dark">
            <td>Value 13</td>
            <td>Value 14</td>
            <td>Value 15</td>
          </tr>
		  <tr class="light">
            <td>Value 9</td>
            <td>Value 10</td>
            <td>Value 11</td>
          </tr>
          <tr class="dark">
            <td>Value 13</td>
            <td>Value 14</td>
            <td>Value 15</td>
          </tr>
		  <tr class="light">
            <td>Value 9</td>
            <td>Value 10</td>
            <td>Value 11</td>
          </tr>
          <tr class="dark">
            <td>Value 13</td>
            <td>Value 14</td>
            <td>Value 15</td>
          </tr>
		  <tr class="light">
            <td>Value 9</td>
            <td>Value 10</td>
            <td>Value 11</td>
          </tr>
          <tr class="dark">
            <td>Value 13</td>
            <td>Value 14</td>
            <td>Value 15</td>
          </tr>
		  
        </tbody>
      </table>
    </div>
     <!--************/sale order list********--> 
	 <br class="clear" />
  </div>
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
