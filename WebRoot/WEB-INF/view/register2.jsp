<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head profile="http://gmpg.org/xfn/11">
    <title>请完善您的用户资料</title>
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
	<div class="content-register2">
      <h2>提升账户安全性</h2>
      <div id="respond">
      <p><c:out value="${regisetState}"></c:out></p>
        <form name="form" action="register.htm?promote" method="post">
	<table cellspacing="0" id="formContainer1" style="padding:10px;">
		<tr>
			<td align=right style="padding-right:5px;color:#000;">
				<label for="utpassword"><small><span>新交易密码</span></small></label>
			</td>
			<td align=left style="padding:5px; color:#000;">
				<input id="utpassword" type=password name="utpassword"
					jVal="{valid:function (val) { if (val.length < 6) return false; else return true; }, message:'登陆密码必须大于6位', styleType:'cover'}" class="inputsize">
			</td>
		</tr>
		<tr>
			<td align=right style="padding-right:5px;color:#000;">
				<label for="utpasswordVerify"><small><span>再次输入新交易密码</span></small></label>
			</td>
			<td align=left style="padding:5px; color:#000;">
				<input id="utpasswordVerify" type=password
					jVal="{valid:function (val) { if ( val != eval('$(\'#utpassword\').val()') ) return false; else return true; }, message:'两次输入的密码不一样,请重新输入', styleType:'cover'}" class="inputsize">
			</td>
		</tr>
		<tr>
			<td width="17%" align=right style="padding-right:5px; color:#000;">
				<label for="uusername"><small><span>安全问题</span></small></label>
			</td>
			<td width="83%" align=left style="padding:5px; color:#000;">
				<select name="usafequestion">
				<option>请选择</option>
				<option value="您的出生地是？">您的出生地是？</option>
				<option value="您高中班主任的姓名是？">您高中班主任的姓名是？</option>
				<option value="您初中班主任的姓名是？">您初中班主任的姓名是？</option>
				<option value="您小学班主任的姓名是？">您小学班主任的姓名是？</option>
				<option value="您父亲的生日是？">您父亲的生日是？</option>
				<option value="您母亲的生日是？">您母亲的生日是？</option>
				<option value="您婆婆或岳母的姓名是？">您婆婆或岳母的姓名是？</option>
				<option value="您配偶的生日是？">您配偶的生日是？</option>
				<option value="您好友的手机号码是？">您好友的手机号码是？</option>
				<option value="您的车牌号是？">您的车牌号是？</option>
				</select>
			</td>
		</tr>
		<tr>
			<td align=right style="padding-right:5px;color:#000;">
				<label for="uemail"><small><span>安全问题答案</span></small></label>
			</td>
			<td align=left style="padding:5px; color:#000;">
				<input id="usafequestionanswer" type=text size=40 name="usafequestionanswer" jVal="{valid:function (val) { if (val.length < 1) return false; else return true; }, message:'安全问题必填！', styleType:'cover'}" class="inputsize">
			</td>
		</tr>
		<tr>
			<td align=right style="padding-right:5px;color:#000;">
				<label for="uname"><small><span>真实姓名</span></small></label>
			</td>
			<td align=left style="padding:5px; color:#000;">
				<input id="uname" type=text name="uname"
					jVal="{valid:function (val) { if (val.length < 1) return false; else return true; }, message:'真实姓名必填！', styleType:'cover'}" class="inputsize">
			</td>
		</tr>
		<tr>
			<td align=right style="padding-right:5px;color:#000;">
				<label for="uphone"><small><span>手机号码</span></small></label>
			</td>
			<td align=left style="padding:5px; color:#000;">
				<input id="uphone" type=text name="uphone"
					jVal="{valid:function (val) { if (val.length < 11) return false; else return true; }, message:'请输入正确的手机号', styleType:'cover'}" class="inputsize">
			</td>
		</tr>
		<tr>
			<td width="17%" align=right style="padding-right:5px; color:#000;">
				<label for="uusername"><small><span>证件类型</span></small></label>
			</td>
			<td width="83%" align=left style="padding:5px; color:#000;">
				<select name="ucertificationcategory">
				<option value="请选择">请选择</option>
				<option value="中国身份证">中国身份证</option>
				<option value="护照">护照</option>
				<option value="台湾居民来往大陆通行证">台湾居民来往大陆通行证</option>
				<option value="港澳居民来往内地通行证">港澳居民来往内地通行证</option>
				<option value="其他">其他</option>
				</select>
			</td>
		</tr>
		<tr>
			<td align=right style="padding-right:5px;color:#000;">
				<label for="ucertification"><small><span>证件号码</span></small></label>
			</td>
			<td align=left style="padding:5px; color:#000;">
				<input id="ucertification" type=text name="ucertification"
					jVal="{valid:function (val) { if (val.length < 1) return false; else return true; }, message:'请认真填写！', styleType:'cover'}" class="inputsize">
			</td>
		</tr>
        <tr>
        <td></td>
        <td>
        <textarea cols="20" rows="5" readonly>

风险提示：比特币的交易有极高的风险，它没有像中国股市那样的涨跌停限制，同时交易是24小时开放的。比特币由于筹码较少，价格易受到庄家控制，有可能出现一天价格涨几倍的情况，同时也可能出现一天内价格跌去一半的情况！入市须谨慎，一定注意控制好风险！
        </textarea>
        </td>
        </tr>
		<tr>
			<td></td>
			<td style="padding:5px;">
				<input type="button" value="提交" onClick="if ( $('#formContainer1').jVal() ) document.form.submit();" class="inputsize"/>
			</td>
		</tr>
	</table>
	</form>
      </div>
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
