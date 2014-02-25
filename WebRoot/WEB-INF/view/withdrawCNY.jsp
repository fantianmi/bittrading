<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head profile="http://gmpg.org/xfn/11">
    <title>人民币提现</title>
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
	 <h3>人民币 提现</h3>
	  <div id="respond">
        <form action="WEB-INF/recharge.htm?CNY" method="post">
          <p>
		    <label for="email">可用余额：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
             	0 元
          </p>
          <p>
		    <label for="email">当日提现上限：&nbsp;&nbsp;</label>
            100000 / 100000 元
          </p>
          <p>
		    <label for="email">提现数额 (￥)：&nbsp;&nbsp;</label>
            <input name="bro_recharge_acount" id="email" value="" size="22" type="text">
            <label for="email">最少 200 元，一次最多 50000 CNY，手续费1% + 5元/笔</label>
          </p>
          <p>
		    <label for="email">提现方式：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <select>
                <option>请选择银行</option>
                <option>中国银行</option>
                <option>工商银行</option>
                <option>农业银行</option>
                <option>交通银行</option>
                <option>广东发展银行</option>
                <option>深圳发展银行</option>
                <option>建设银行</option>
                <option>上海浦东发展银行</option>
                <option>上海浦发银行</option>
                <option>浙江泰隆商业银行</option>
                <option>招商银行</option>
                <option>中国民生银行</option>
                <option>兴业银行</option>
                <option>重庆银行</option>
                <option>中国光大</option>
            </select>
          </p>
          <p>
		    <label for="email">开户地区：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <select>
                <option>北京</option>
                <option>天津</option>
                <option>重庆</option>
                <option>上海</option>
            </select>
          </p>
          <p>
		    <label for="email">开户城市：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <select>
                <option>重庆</option>
                <option>万州</option>
                <option>涪陵</option>
            </select>
          </p>
          <p>
		    <label for="email">开户行：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input name="bro_sname" id="email" value="" size="22" type="text">
            <label for="email">请勿重复填写银行名称与省市，只需填写具体支行名称。</label>
          </p>
		  <p>
		    <label for="email">收款人姓名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input name="bro_sname" id="email" value="" size="22" type="text">
            <label for="email">非常重要，姓名不对将无法完成支付</label>
          </p>
          <p>
		    <label for="email">提现账号（卡号）:</label>
            <input name="bro_sname" id="email" value="" size="22" type="text">
            <label for="email">只能是数字，请勿加空格</label>
          </p>
          <p>
		    <label for="email">交易密码：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input name="utpassword" id="email" value="" size="22" type="password">
            <label for="email">请输入您的交易密码</label>
          </p>
          <p>
		    <label for="email">短信验证码：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input name="utpassword" id="email" value="" size="22" type="password">
            <label for="email"><button name="获取短信验证码" value="获取短信验证码">获取短信验证码</button></label>
          </p>
          <p>
		    <label for="email">图片验证码：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <label for="email">62523</label>
          </p>
		  <p>
		    <label for="email">输入上面验证码：&nbsp;</label>
            <input name="utpassword" id="email" value="" size="22" type="password">
            <label for="email">请您选择充值的方式：网银 或者 财付通。</label>
          </p>
          <p>
		    <label for="email">扣除比特点 ：&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <label for="email">您当前拥有 0 BTR
根据当前规则，每提取 1CNY 将从您的账号扣除 10 BTR，扣完为止 </label>
          </p>
          <p>&nbsp;
            
          </p>
          <p>
            <input name="submit" id="submit" value="提交提现申请" type="submit">         
          </p>
        </form>
      </div>
      <p>目前本站支持各大银行快速提现，提现申请被处理后 1-4 小时到账。提现方式手续费为 1% + 5元 。</p>
	  <p>对于超过5万的大额提现支付系统需要人工审核，当日或者次日到账，周末不到账，建议超过5万的分多笔提交。</p>
	  <p>由于银行提现成本很高，建议大家积攒一定得额度再进行提款，感谢您的理解和支持。</p>
      <p>我们正在努力与银行合作，尽快将提现时间缩短到几个小时内到账，敬请期待！</p>
      <h2>最近 10 次提现记录</h2>
      <table summary="Summary Here" cellpadding="0" cellspacing="0">
        <thead>
          <tr>
            <th>单号</th>
            <th>提现方式</th>
            <th>提现账户</th>
            <th>金额（元）</th>
            <th>手续费（元）</th>
			<th>提现时间</th>
			<th>备注/回执单</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>暂无记录</td>
            <td>暂无记录</td>
            <td>暂无记录</td>
            <td>暂无记录</td>
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
