<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.math.BigDecimal"%>
<%@ include file="/include/head.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">
<head profile="http://gmpg.org/xfn/11">
<title>比特币交易平台</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="styles/layout.css" type="text/css" />
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<script type="text/javascript" src="scripts/jquery-1.4.1.min.js"></script>
<script type="text/javascript" src="scripts/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="scripts/jquery.timers.1.2.js"></script>
<script type="text/javascript" src="scripts/jquery.galleryview.2.1.1.min.js"></script>
<script type="text/javascript" src="scripts/jquery.galleryview.setup.js"></script>
</head>
<script type="text/javascript">
    function checkFormRecharge(){
        var theForm=document.creator;  
        var flag=false;
              
        if(theForm.buyingRate == "0"){
            alert("买入价不能为0");
            theForm.buyingRate.focus();
            return false;
        }
        if(theForm.buyQuantity.value=="0"){
            alert("买入数量不能为0");
            theForm.buyQuantity.focus();
            return false;
        }
        if(theForm.exchange.value=="0"){
            alert("兑换额不能为0");
            theForm.exchange.focus();
            return false;
        }
    }
    
    function checkFormSell(){
        var theForm=document.creator;  
        var flag=false;
              
        if(theForm.sellingRate == "0"){
            alert("卖出价不能为0");
            theForm.sellingRate.focus();
            return false;
        }
        if(theForm.sellQuantity.value=="0"){
            alert("卖出数量不能为0");
            theForm.sellQuantity.focus();
            return false;
        }
        if(theForm.sexchange.value=="0"){
            alert("兑换额不能为0");
            theForm.sexchange.focus();
            return false;
        }
    }
    
    function caculateEx_BQ_Pound(x){
        document.getElementById("exchange").value = (document.getElementById("buyQuantity").value) * (document.getElementById(x).value);
        document.getElementById("poundage").value = document.getElementById("exchange").value * 0.002;
    }
    
    function caculateEx(x){
        document.getElementById("exchange").value = (document.getElementById("buyingRate").value) * (document.getElementById(x).value);
        document.getElementById("poundage").value = document.getElementById("exchange").value * 0.002;
    }
    function caculateBQ(){
        document.getElementById("buyQuantity").value = document.getElementById("exchange").value / document.getElementById("buyingRate").value;
        document.getElementById("poundage").value = document.getElementById("exchange").value * 0.002;
    }
    
    function scaculateEx_BQ_Pound(x){
    	document.getElementById("sexchange").value = (document.getElementById("sellQuantity").value) * (document.getElementById(x).value);
        document.getElementById("spoundage").value = document.getElementById("sexchange").value * 0.002;
    }
    
    function scaculateEx(x){
        document.getElementById("sexchange").value = (document.getElementById("sellingRate").value) * (document.getElementById(x).value);
        document.getElementById("spoundage").value = document.getElementById("sexchange").value * 0.002;
    }
    function scaculateBQ(){
        document.getElementById("sellQuantity").value = document.getElementById("sexchange").value / document.getElementById("sellingRate").value;
        document.getElementById("spoundage").value = document.getElementById("sexchange").value * 0.002;
    }

</script>
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
		<%
		BigDecimal bestBid = null;
		if(session.getAttribute("sellOders")!=null){
			ArrayList<Btc_sellBTC_order> toGetBestOffer = (ArrayList<Btc_sellBTC_order>)session.getAttribute("sellOders");
			bestBid = toGetBestOffer.get(0).getBso_btc_sellRate();
		}else{
			bestBid = new BigDecimal(session.getAttribute("latestDealOrder").toString());
			} %>
		  <form action="<%=request.getContextPath() %>/recharge.htm?recharge_BTC" method="post" onSubmit="JavaScript:return checkFormRecharge();">
		  <h2><a href="#">买入BTC &raquo;</a></h2>
		  <table summary="Summary Here" cellpadding="0" cellspacing="0">
			<tbody>
			  <tr class="dark">
				<td>最佳买价</td>
				<td><%=bestBid %></td>
				<td>CNY/BTC</td>
			  </tr>
			  <tr class="dark">
				<td>当前余额</td>
				<%if(session.getAttribute("ab_btc")!=null){%>
				<td>฿<%=session.getAttribute("ab_btc").toString() %></td>
				<%}else{%>
				<td>฿ 0.0000</td>	
				<%} %>
				<td>BTC</td>
			  </tr>
			  <tr class="dark">
				<td>可兑换额</td>
				<%if(session.getAttribute("ab_cny")!=null){%>
				<td>¥<%=session.getAttribute("ab_cny").toString() %>元整</td>
				<%}else{%>
				<td>¥0.00元整</td>
				<%}%>
				<td>CNY</td>
			  </tr>
			  <tr class="dark">
				<td>买入价</td>
				<td><input type="text" name="buyingRate" id="buyingRate" value="<%=bestBid %>" onkeyup="caculateEx_BQ_Pound(this.id);"></td>
				<td>CNY/BTC</td>
			  </tr>
			  <tr class="dark">
				<td>买入量</td>
				<td><input type="text" name="buyQuantity" id="buyQuantity" value="0" onkeyup="caculateEx(this.id);"></td>
				<td>BTC</td>
			  </tr>
			  <tr class="dark">
				<td>兑换额</td>
				<td><input type="text" name="exchange" id="exchange" value="0" onkeyup="caculateBQ();"></td>
				<td>CNY</td>
			  </tr>
			  <tr class="dark">
				<td>手续费</td>
				<td><input type="text" name="poundage" id="poundage" readonly="readonly" value="0"></td>
				<td>BTC(0.2%)</td>
			  </tr>
			  <tr class="dark">
				<td colspan="3"><input type="submit" value="买入（CNY->BTC）"></td>
			  </tr>
			</tbody>
		  </table>
		  </form>
    </div>
     <!--************/buy fence**************-->
	 <!--************sale fence*************-->
	<div class="fl_right">
	<%
	BigDecimal bestOffer = null;
	if(session.getAttribute("buyingOders")!=null){
		ArrayList<Btc_rechargeBTC_order> toGetBestBid = (ArrayList<Btc_rechargeBTC_order>)session.getAttribute("buyingOders");
		bestOffer = toGetBestBid.get(0).getBro_btc_buyingRate();
	}else{
		bestOffer = new BigDecimal(session.getAttribute("latestDealOrder").toString());
	}%>
	<form action="<%=request.getContextPath() %>/sell.htm?sell_BTC" method="post" onSubmit="JavaScript:return checkFormSell();">
      <h2><a href="#">卖出BTC &raquo;</a></h2>
      <table summary="Summary Here" cellpadding="0" cellspacing="0">
        <tbody>
          <tr class="dark">
            <td>最佳卖价</td>
            <td><%=bestOffer %></td>
            <td>CNY/BTC</td>
          </tr>
          <tr class="dark">
            <td>当前余额</td>
            <%if(session.getAttribute("ab_btc")!=null){%>
            <td>฿<%=session.getAttribute("ab_btc").toString() %></td>
            <%}else{%>
            <td>฿0.0000</td>
            <%} %>
            <td>BTC</td>
          </tr>
          <tr class="dark">
            <td>可兑换额</td>
            <%if(session.getAttribute("ab_cny")!=null){%>
            <td>¥<%=session.getAttribute("ab_cny").toString() %>元整</td>
            <%}else{%>
            <td>¥0.00元整</td>	
            <%} %>
            <td>CNY</td>
          </tr>
          <tr class="dark">
			<td>卖出价</td>
			<td><input type="text" name="sellingRate" id="sellingRate" value="<%=bestOffer %>"></td>
			<td>CNY/BTC</td>
		  </tr>
		  <tr class="dark">
			<td>卖出量</td>
			<td><input type="text" name="sellQuantity" id="sellQuantity" value="0" onkeyup="scaculateEx(this.id);"></td>
			<td>BTC</td>
		  </tr>
		  <tr class="dark">
			<td>兑换额</td>
			<td><input type="text" name="sexchange" id="sexchange" value="0" onkeyup="scaculateBQ();"></td>
			<td>CNY</td>
		  </tr>
		  <tr class="dark">
			<td>手续费</td>
			<td><input type="text" name="spoundage" id="spoundage" readonly="readonly" value="0"></td>
			<td>BTC(0.2%)</td>
		  </tr>
		  <tr class="dark">
           <td colspan="3"><input type="submit" value="卖出（BTC->CNY）"></td>
          </tr>
        </tbody>
      </table>
      </form>
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
        <%if(session.getAttribute("buyingOders")!=null){
          ArrayList<Btc_rechargeBTC_order> btc_rechargeBTC_order_Lists = (ArrayList<Btc_rechargeBTC_order>)session.getAttribute("buyingOders");
          for(int i=0;i<btc_rechargeBTC_order_Lists.size();i++){
          	Btc_rechargeBTC_order btc_rechargeBTC_order = btc_rechargeBTC_order_Lists.get(i);
          	if(i%2==0){%>
          	<tr class="light">
              <td><%=btc_rechargeBTC_order.getBro_btc_buyingRate()%></td>
              <td><%=btc_rechargeBTC_order.getBro_btc_buyQuantity() %></td>
              <td><%=btc_rechargeBTC_order.getBro_btc_exchange() %></td>
            </tr>
          <%		
          	}else{%>
          	<tr class="dark">
              <td><%=btc_rechargeBTC_order.getBro_btc_buyingRate()%></td>
              <td><%=btc_rechargeBTC_order.getBro_btc_buyQuantity() %></td>
              <td><%=btc_rechargeBTC_order.getBro_btc_exchange() %></td>
            </tr>
          <%}
          }
         }else{%>
        	<tr class="light">
              <td>暂无记录</td>
              <td>暂无记录</td>
              <td>暂无记录</td>
            </tr>
         <%}%>
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
          <%if(session.getAttribute("sellOders")!=null){
          ArrayList<Btc_sellBTC_order> btc_sellBTC_order_Lists = (ArrayList<Btc_sellBTC_order>)session.getAttribute("sellOders");
          for(int i=0;i<btc_sellBTC_order_Lists.size();i++){
          	Btc_sellBTC_order btc_sellBTC_order = btc_sellBTC_order_Lists.get(i);
          	if(i%2==0){%>
          	<tr class="light">
              <td><%=btc_sellBTC_order.getBso_btc_sellRate()%></td>
              <td><%=btc_sellBTC_order.getBso_btc_sellQuantity() %></td>
              <td><%=btc_sellBTC_order.getBso_btc_exchange() %></td>
            </tr>
          <%		
          	}else{%>
          	<tr class="dark">
              <td><%=btc_sellBTC_order.getBso_btc_sellRate()%></td>
              <td><%=btc_sellBTC_order.getBso_btc_sellQuantity() %></td>
              <td><%=btc_sellBTC_order.getBso_btc_exchange() %></td>
            </tr>
          <%}
          }
         }else{%>
        	<tr class="light">
              <td>暂无记录</td>
              <td>暂无记录</td>
              <td>暂无记录</td>
            </tr>
         <%}%>
		  
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
