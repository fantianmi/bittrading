<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

	<div class="subnav">
     <%if(session.getAttribute("isRegister2")==null){ %>
     	<h2>欢迎访问，游客！</h2>
     	<ul>
          <li> 比特币的交易有极高的风险，它没有像中国股市那样的涨跌停限制，同时交易是24小时开放的。比特币由于筹码较少，价格易受到庄家控制，有可能出现一天价格涨几倍的情况，同时也可能出现一天内价格跌去一半的情况！入市须谨慎，一定注意控制好风险！</li>
          <li><a href="#">第一步</a>
            <ul>
			  <li>&nbsp;</li>
              <li><input name="reset" type="reset" id="reset" tabindex="5" value="登陆" onclick="javascript:location.href='index.htm?Login'"/></li>
              <li><input name="reset" type="reset" id="reset" tabindex="5" value="注册" onclick="javascript:location.href='vertify.htm?Register'"/></li>
			  <li>&nbsp;</li>
            </ul>
          </li>
        </ul>
     <%} else {
    	 if(session.getAttribute("isRegister2").toString()=="false"){%>
    	 <h2>欢迎，<%=session.getAttribute("uusername").toString() %></h2>
        <ul>        
          <li><a href="#">账户可用余额</a>
            <ul>
			  <li>&nbsp;</li>
              <li>比特币：฿0.00 BTC</li>
              <li>人民币：¥0.00 元</li>
			  <li>&nbsp;</li>
            </ul>
          </li>
          <li><a href="#">总资产折合人民币</a>
            <ul>
			  <li>&nbsp;</li>
              <li>¥0.00 元</li>
			  <li>&nbsp;</li> 
            </ul>
          </li>
    		 
    	 <%}else if(session.getAttribute("isRegister2").toString()=="true"){%>
    	 	<h2>欢迎，<%=session.getAttribute("uname").toString() %></h2>
    	 	<li>您的手机尾号为 4055，如有误，请立即联系客服。</li>
	        <ul>        
	          <li><a href="#">账户可用余额</a>
	            <ul>
				  <li>&nbsp;</li>
	              <li>比特币：฿<%=session.getAttribute("ab_btc").toString() %>BTC</li>
	              <li>人民币：¥<%=session.getAttribute("ab_cny").toString() %> 元</li>
				  <li>&nbsp;</li>
	            </ul>
	          </li>
	          <li><a href="#">总资产折合人民币</a>
	            <ul>
				  <li>&nbsp;</li>
	              <li>¥0.00 元</li>
				  <li>&nbsp;</li> 
	            </ul>
	          </li>
    	 <%} %>
    	 <li><a href="#">交易</a>
            <ul>
              <li><a href="index.htm?buybtc">买入比特币</a></li>
              <li><a href="#">卖出比特币</a> </li>
              <li><a href="#">委托管理</a> </li>
			  <li><a href="#">交易查询</a> </li>
			  <li><a href="#">全站交易历史</a> </li>
			  <li><a href="#">市场深度</a> </li>
			  <li><a href="#">实时行情一</a> </li>
			  <li><a href="#">实时行情二</a> </li>
			  <li><a href="#">市场深度图表</a> </li>
            </ul>
          </li>
		  <li><a href="#">账户管理</a>
            <ul>
              <li><a href="index.htm?recharge">人民币充值</a></li>
              <li><a href="#">人民币提现</a></li>
			  <li><a href="#">比特币充值</a></li>
              <li><a href="#">比特币提现</a></li>
			  <li><a href="#">API访问</a></li>
            </ul>
          </li>
		  <li><a href="#">安全中心</a>
            <ul>
              <li><a href="#">更新账户信息</a></li>
              <li><a href="#">重置交易密码</a></li>
			  <li><a href="#">双重验证</a></li>
              <li><a href="#">重置双重验证</a></li>
			  <li><a href="#">更改手机号码</a></li>
            </ul>
          </li>
        </ul>
     <%} %>
      </div>
