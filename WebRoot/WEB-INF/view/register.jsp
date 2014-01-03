<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head profile="http://gmpg.org/xfn/11">
    <title>现在登录注册成为我们的客户</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="imagetoolbar" content="no" />
    <link rel="stylesheet" href="styles/layout.css" type="text/css" />
    <script language="JavaScript" type="text/javascript" src="script/jquery.js"></script>
	<script language="JavaScript" type="text/javascript" src="script/jquery.corner.js"></script>
	<script language="JavaScript" type="text/javascript" src="script/jVal.js"></script>
	<link rel="stylesheet" type="text/css" href="styles/jVal.css">
</head>
	<%if(request.getAttribute("msg")==null){}else{%>
	<script type="text/javascript">
	 alert("对不起，该用户名已被注册！");
	</script>
	<%} %>
  
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
    <div class="content-register">
      <h2>欢迎登录比特币交易中心</h2>
      <div id="respond">
        <form name="form" action="register.htm" method="post">
	<table cellspacing="0" id="formContainer1" style="padding:10px;">
		<tr>
			<td width="17%" align=right style="padding-right:5px; color:#000;">
				<label for="uusername"><small><span>用户名</span></small></label>
			</td>
			<td width="83%" align=left style="padding:5px; color:#000;">
				<input id="uusername" name="uusername" type=text size=20
					jVal="{valid:function (val) { if (val.length < 3) return false; else return true; }, message:'用户名位数不够(至少3位)', styleType:'cover'}" class="inputsize">
			</td>
		</tr>
		<tr>
			<td align=right style="padding-right:5px;color:#000;">
				<label for="uemail"><small><span>注册Email</span></small></label>
			</td>
			<td align=left style="padding:5px; color:#000;">
				<input id="uemail" type=text size=40 name="uemail"
				jVal="{valid:/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/, message:'非法邮箱地址,请重新输入', styleType:'cover'}" 
				jValKey="{valid:/[a-zA-Z0-9._%+-@]/, cFunc:'alert', cArgs:['Email Address: '+$(this).val()]}" class="inputsize">
			</td>
		</tr>
		<tr>
			<td align=right style="padding-right:5px;color:#000;">
				<label for="uemail"><small><span>确认Email</span></small></label>
			</td>
			<td align=left style="padding:5px; color:#000;">
				<input id="uemailVertify" type=text size=40 name="uemail"
					jVal="{valid:function (val) { if ( val != eval('$(\'#uemail\').val()') ) return false; else return true; }, message:'两次输入的Email地址不一样,请重新输入', styleType:'cover'}" class="inputsize">
			</td>
		</tr>
		<tr>
			<td align=right style="padding-right:5px;color:#000;">
				<label for="upassword"><small><span>登陆密码</span></small></label>
			</td>
			<td align=left style="padding:5px; color:#000;">
				<input id="upassword" type=password name="upassword"
					jVal="{valid:function (val) { if (val.length < 4) return false; else return true; }, message:'登陆密码必须大于4位', styleType:'cover'}" class="inputsize">
			</td>
		</tr>
		<tr>
			<td align=right style="padding-right:5px;color:#000;">
				<label for="upasswordVerify"><small><span>确认登陆密码</span></small></label>
			</td>
			<td align=left style="padding:5px; color:#000;">
				<input id="upasswordVerify" type=password
					jVal="{valid:function (val) { if ( val != eval('$(\'#upassword\').val()') ) return false; else return true; }, message:'两次输入的密码不一样,请重新输入', styleType:'cover'}" class="inputsize">
			</td>
		</tr>
		<tr>
			<td align=right style="padding-right:5px;color:#000;">
				<label for="upasswordVerify"><small><span>使用语言</span></small></label>
			</td>
			<td align=left style="padding:5px; color:#000;">
				<select>
				<option>简体中文</option>
				<option>English</option>
				</select>
			</td>
		</tr>
        <tr>
        <td></td>
        <td>
        <textarea cols="80" rows="15" readonly="readonly">

最新修订日期：2013年12月6日

比特币交易中心尊重并保护所有使用比特币交易中心平台服务用户的个人隐私权。为了给您提供更准确、更有个性化的服务，比特币交易中心会按照本隐私权政策的规定使用和披露您的个人信息。但比特币交易中心将以高度的勤勉、审慎义务对待这些信息。除本隐私权政策另有规定外，在未征得您事先许可的情况下，比特币交易中心不会将这些信息对外披露或向第三方提供。比特币交易中心会不时更新本隐私权政策。 您在同意比特币交易中心服务协议之时，即视为您已经同意本隐私权政策全部内容。本隐私权政策属于比特币交易中心服务协议不可分割的一部分。

本协议由您与比特币交易中心的经营者共同缔结，本协议具有合同效力。

比特币交易中心的经营者是指法律认可的经营该平台网站的责任主体，有关比特币交易中心经营者的信息请查看比特币交易中心首页底部公布的公司信息和证照信息。本协议中比特币交易中心的经营者可单称或统称为“上海萨图西网络有限公司”。“比特币交易中心”指由比特币交易中心运营的网络平台，包括但不限于比特币交易中心网，域名为 btcchina.com、https://btcchina.com、“www.btcchina.com”，该网站属于加密网站。
一、 协议内容及签署

    本协议内容包括协议正文及所有比特币交易中心已经发布的或将来可能发布的各类规则。所有规则为本协议不可分割的组成部分，与协议正文具有同等法律效力。除另行明确声明外，任何比特币交易中心及其关联公司提供的服务（以下称为比特币交易中心服务）均受本协议约束。
    您应当在使用比特币交易中心服务之前认真阅读全部协议内容，对于协议中以加粗字体显示的内容，您应重点阅读。如您对协议有任何疑问的，应向比特币交易中心咨询。但无论您事实上是否在使用比特币交易中心服务之前认真阅读了本协议内容，只要您使用比特币交易中心服务，则本协议即对您产生约束，届时您不应以未阅读本协议的内容或者未获得比特币交易中心对您问询的解答等理由，主张本协议无效，或要求撤销本协议。
    您承诺接受并遵守本协议的约定。如果您不同意本协议的约定，您应立即停止注册/激活程序或停止使用比特币交易中心服务。
    比特币交易中心有权根据需要不时地制订、修改本协议及/或各类规则，并以网站公示的方式进行公告，不再单独通知您。变更后的协议和规则一经在网站公布后，立即自动生效。如您不同意相关变更，应当立即停止使用比特币交易中心服务。您继续使用比特币交易中心服务的，即表示您接受经修订的协议和规则。

二、 注册与账户

    注册者资格
    您确认，在您完成注册程序或以其他比特币交易中心允许的方式实际使用比特币交易中心服务时，您应当是具备完全民事权利能力和完全民事行为能力的自然人、法人或其他组织。若您不具备前述主体资格，则您及您的监护人应承担因此而导致的一切后果，且比特币交易中心有权注销或永久冻结您的账户，并向您及您的监护人索偿。
    注册和账户
        在您按照注册页面提示填写信息、阅读并同意本协议且完成全部注册程序后，或在您按照激活页面提示填写信息、阅读并同意本协议且完成全部激活程序后，或您以其他比特币交易中心允许的方式实际使用比特币交易中心服务时，您即受本协议约束。您可以使用您提供或确认的邮箱、手机号码或者比特币交易中心允许的其它方式作为登录手段进入比特币交易中心。您必须提供您的真实姓名、身份证件类型和身份证件号码等法律法规规定的信息。如果您在注册时提供的信息不准确，比特币交易中心对此不承担任何责任，您将承担因此产生的任何直接或间接损失及不利后果。
        您可以对账户设置比特币交易中心昵称，您也可以通过该比特币交易中心昵称和登录名密码登录比特币交易中心。您设置的比特币交易中心昵称不得侵犯或涉嫌侵犯他人合法权益。如您设置的比特币交易中心昵称涉嫌侵犯他人合法权益，比特币交易中心有权终止向您提供比特币交易中心服务，注销您的比特币交易中心昵称。比特币交易中心昵称被注销后将开放给任意用户注册。
        除非有法律规定或司法裁定，或者符合比特币交易中心公布的条件，否则您的登录名、比特币交易中心昵称和密码不得以任何方式转让、赠与或继承，并且转让、赠与或继承需提供比特币交易中心要求的合格的文件材料并根据比特币交易中心制定的操作流程办理。
    用户信息
        在完成注册或激活流程时，您应当按照法律法规要求，按相应页面的提示准确提供并及时更新您的资料，以使之真实、及时、完整和准确。如有合理理由怀疑您提供的资料错误、不实、过时或不完整的，比特币交易中心有权向您发出询问及/或要求改正的通知，并有权直接做出删除相应资料的处理，直至中止、终止对您提供部分或全部比特币交易中心服务。比特币交易中心对此不承担任何责任，您将承担因此产生的任何直接或间接损失及不利后果。
        您应当准确填写并及时更新您提供的电子邮件地址、联系电话、联系地址、邮政编码等联系方式，以便比特币交易中心或其他用户与您进行有效联系，因通过这些联系方式无法与您取得联系，导致您在使用比特币交易中心服务过程中产生任何损失或增加费用的，应由您完全独自承担。您了解并同意，您有义务保持你提供的联系方式的有效性，如有变更或需要更新的，您应按比特币交易中心的要求进行操作。
        如果您在比特币交易中心提现人民币，您需要提供与您在比特币交易中心注册时填写的姓名一致的银行卡卡号或财付通账号。比特币交易中心不允许您提现人民币到其他人的银行卡或财付通账户。
        如果您日提现人民币超过10万元或日提现比特币超过30个，您应当上传您实名身份证件（包括但不限于身份征、护照等）的正反面照片或扫描件。
        如果您日提现人民币超过20万元或提现比特币超过100个，您除了应当上传您实名身份证件（包括但不限于身份征、护照等）的正反面照片或扫描件以外，还需要上传您手持上述实名证件的正面照片。
        比特币交易中心目前不允许您日提现人民币超过50万元或提现比特币超过300个。
    账户安全
    您须自行负责对您的比特币交易中心昵称和密码保密，且须对您在该登录名、比特币交易中心昵称和密码下发生的所有活动（包括但不限于信息披露、发布信息、网上点击同意或提交各类规则协议、网上续签协议或购买服务等）承担责任。您同意：(a) 如发现任何人未经授权使用您的比特币交易中心昵称和密码，或发生违反保密规定的任何其他情况，您会立即通知比特币交易中心；(b)确保您严格遵守网站/服务的安全、认证、交易、充值、提现机制或者流程；及 (c) 确保您在每个上网时段结束时，以正确步骤离开网站/服务。比特币交易中心不能也不会对因您未能遵守本款规定而发生的任何损失负责。您理解比特币交易中心对您的请求采取行动需要合理时间，比特币交易中心对在采取行动前已经产生的后果（包括但不限于您的任何损失）不承担任何责任。

三、 比特币交易中心服务

    通过比特币交易中心及其关联公司提供的比特币交易中心服务和其它服务，会员可在比特币交易中心上发布交易信息、查询比特币价格和交易信息、达成交易意向并进行交易、参加比特币交易中心组织的活动以及使用其它信息服务及技术服务。
    您在比特币交易中心上交易过程中与其他会员发生交易纠纷时，一旦您或其它会员任一方或双方共同提交比特币交易中心要求调处，则比特币交易中心有权根据单方判断做出调处决定，您了解并同意接受比特币交易中心的判断和调处决定。
    您了解并同意，比特币交易中心有权应政府部门（包括司法及行政部门）的要求，向其提供您向比特币交易中心提供的用户信息和交易记录等必要信息。如您涉嫌侵犯他人知识产权等合法权益，则比特币交易中心亦有权在初步判断涉嫌侵权行为存在的情况下，向权利人提供您必要的身份信息。
    您在使用比特币交易中心服务过程中，所产生的应纳税赋，以及一切硬件、软件、服务及其它方面的费用，均由您独自承担。

四、比特币交易中心服务使用规范

    在比特币交易中心上使用比特币交易中心服务过程中，您承诺遵守以下约定：
        在使用比特币交易中心服务过程中实施的所有行为均遵守国家法律、法规等规范性文件及比特币交易中心各项规则的规定和要求，不违背社会公共利益或公共道德，不损害他人的合法权益，不偷逃应缴税费，不违反本协议及相关规则。您如果违反前述承诺，产生任何法律后果的，您应以自己的名义独立承担所有的法律责任，并确保比特币交易中心免于因此产生任何损失。
        在与其他会员交易过程中，遵守诚实信用原则，不采取不正当竞争行为，不扰乱网上交易的正常秩序，不从事与网上交易无关的行为。
        不对比特币交易中心上的任何数据作商业性利用，包括但不限于在未经比特币交易中心事先书面同意的情况下，以复制、传播等任何方式使用比特币交易中心站上展示的资料。
        不使用任何装置、软件或例行程序干预或试图干预比特币交易中心的正常运作或正在比特币交易中心上进行的任何交易、活动。您不得采取任何将导致不合理的庞大数据负载加诸比特币交易中心网络设备的行动。
    您了解并同意：
        比特币交易中心有权对您是否违反上述承诺做出单方认定，并根据单方认定结果适用规则予以处理或终止向您提供服务，且无须征得您的同意或提前通知予您。
        基于维护比特币交易中心交易秩序及交易安全的需要，比特币交易中心有权在发生恶意出售或者购买等扰乱市场正常交易秩序的情形下，执行关闭相应交易订单等操作。
        经国家行政或司法机关的生效法律文书确认您存在违法或侵权行为，或者比特币交易中心根据自身的判断，认为您的行为涉嫌违反本协议和/或规则的条款或涉嫌违反法律法规的规定的，则比特币交易中心有权在比特币交易中心上公示您的该等涉嫌违法或违约行为及比特币交易中心已对您采取的措施。
        对于您在比特币交易中心上发布的涉嫌违法或涉嫌侵犯他人合法权利或违反本协议和/或规则的信息，比特币交易中心有权不经通知您即予以删除，且按照规则的规定进行处罚。
        对于您在比特币交易中心上实施的行为，包括您未在比特币交易中心上实施但已经对比特币交易中心及其用户产生影响的行为，比特币交易中心有权单方认定您行为的性质及是否构成对本协议和/或规则的违反，并据此作出相应处罚。您应自行保存与您行为有关的全部证据，并应对无法提供充要证据而承担的不利后果。
        对于您涉嫌违反承诺的行为对任意第三方造成损害的，您均应当以自己的名义独立承担所有的法律责任，并应确保比特币交易中心免于因此产生损失或增加费用。
        如您涉嫌违反有关法律或者本协议之规定，使比特币交易中心遭受任何损失，或受到任何第三方的索赔，或受到任何行政管理部门的处罚，您应当赔偿比特币交易中心因此造成的损失及（或）发生的费用，包括合理的律师费用。

五、责任范围和责任限制

    比特币交易中心负责按"现状"和"可得到"的状态向您提供比特币交易中心服务。但比特币交易中心对比特币交易中心服务不作任何明示或暗示的保证，包括但不限于比特币交易中心服务的适用性、没有错误或疏漏、持续性、准确性、可靠性、适用于某一特定用途。同时，比特币交易中心也不对比特币交易中心服务所涉及的技术及信息的有效性、准确性、正确性、可靠性、质量、稳定、完整和及时性作出任何承诺和保证。
    您了解比特币交易中心上的信息系用户自行发布，且可能存在风险和瑕疵。比特币交易中心仅作为交易地点。比特币交易中心仅作为您获取比特币信息、物色交易对象、就比特币的交易进行协商及开展交易的场所，但比特币交易中心无法控制交易所涉及的比特币的质量、安全或合法性，交易信息的真实性或准确性，以及交易各方履行其在交易协议中各项义务的能力。您应自行谨慎判断确定相关比特币及/或信息的真实性、合法性和有效性，并自行承担因此产生的责任与损失。
    除非法律法规明确要求，或出现以下情况，否则，比特币交易中心没有义务对所有用户的信息数据、比特币信息、交易行为以及与交易有关的其它事项进行事先审查：
        比特币交易中心有合理的理由认为特定会员及具体交易事项可能存在重大违法或违约情形。
        比特币交易中心有合理的理由认为用户在比特币交易中心的行为涉嫌违法或不当。
    比特币交易中心或比特币交易中心授权的第三方或您与比特币交易中心一致同意的第三方有权基于您不可撤销的授权受理您与其他会员因交易产生的争议，并有权单方判断与该争议相关的事实及应适用的规则，进而作出处理决定，包括但不限于调整相关订单的交易状态，指令第三方支付公司或者客服将争议货款的全部或部分支付给交易一方或双方。该处理决定对您有约束力。如您未在限期内执行处理决定的，则比特币交易中心有权利（但无义务）直接使用您尚在比特币交易中心账户内的款项，或您向比特币交易中心及其关联公司交纳的保证金代为支付。您应及时补足保证金并弥补比特币交易中心及其关联公司的损失，否则比特币交易中心及其关联公司有权直接抵减您在其它合同项下的权益，并有权继续追偿。
    您理解并同意，比特币交易中心或比特币交易中心授权的第三方或您与比特币交易中心一致同意的第三方并非司法机构，仅能以普通人的身份对证据进行鉴别，比特币交易中心或比特币交易中心授权的第三方或您与比特币交易中心一致同意的第三方对争议的调处完全是基于您不可撤销得授权，其无法保证争议处理结果符合您的期望，也不对争议调处结论承担任何责任。如您因此遭受损失，您同意自行向受益人索偿。
    您了解并同意，比特币交易中心不对因下述任一情况而导致您的任何损害赔偿承担责任，包括但不限于利润、商誉、使用、数据等方面的损失或其它无形损失的损害赔偿（无论比特币交易中心是否已被告知该等损害赔偿的可能性）：
        比特币交易中心有合理的理由认为特定会员及具体交易事项可能存在重大违法或违约情形。
        比特币交易中心有合理的理由认为用户在比特币交易中心的行为涉嫌违法或不当。
        通过比特币交易中心服务购买或获取任何数据、信息或进行交易等行为或替代行为产生的费用及损失。
        您对比特币交易中心服务的误解。
        任何非因比特币交易中心的原因而引起的与比特币交易中心服务有关的其它损失。
    不论在何种情况下，比特币交易中心均不对由于信息网络正常的设备维护，信息网络连接故障，电脑、通讯或其他系统的故障，电力故障，罢工，劳动争议，暴乱，起义，骚乱，生产力或生产资料不足，火灾，洪水，风暴，爆炸，战争，政府行为，司法行政机关的命令或第三方的不作为而造成的不能服务或延迟服务承担责任。

六、协议终止

    您同意，比特币交易中心有权自行全权决定以任何理由不经事先通知的中止、终止向您提供部分或全部比特币交易中心服务，暂时冻结或永久冻结（注销）您的账户在比特币交易中心的权限，且无须为此向您或任何第三方承担任何责任，但是比特币交易中心有权利继续保存该账户相关的交易数据、记录等信息以及应用、使用该信息。
    出现以下情况时，比特币交易中心有权直接以注销账户的方式终止本协议，并有权永久冻结（注销）您的账户在比特币交易中心的权限和收回账户对应的比特币交易中心昵称：
        比特币交易中心终止向您提供服务后，您涉嫌再一次直接或间接或以他人名义注册为比特币交易中心用户的；
        您提供的电子邮箱不存在或无法接收电子邮件，且没有其他方式可以与您进行联系，或比特币交易中心以其它联系方式通知您更改电子邮件信息，而您在比特币交易中心通知后三个工作日内仍未更改为有效的电子邮箱的；
        您提供的用户信息中的主要内容不真实或不准确或不及时或不完整；
        本协议（含规则）变更时，您明示并通知比特币交易中心不愿接受新的服务协议的；
        其它比特币交易中心认为应当终止服务的情况。
    您的账户服务被终止或者账户在比特币交易中心的权限被永久冻结（注销）后，比特币交易中心没有义务为您保留或向您披露您账户中的任何信息，也没有义务向您或第三方转发任何您未曾阅读或发送过的信息。
    您同意，您与比特币交易中心的合同关系终止后，比特币交易中心仍享有下列权利：
        继续保存您的用户信息及您使用比特币交易中心服务期间的所有交易信息。
        您在使用比特币交易中心服务期间存在违法行为或违反本协议和/或规则的行为的，比特币交易中心仍可依据本协议向您主张权利。
    比特币交易中心中止或终止向您提供比特币交易中心服务后，对于您在服务中止或终止之前的交易行为依下列原则处理，您应独力处理并完全承担进行以下处理所产生的任何争议、损失或增加的任何费用，并应确保比特币交易中心免于因此产生任何损失或承担任何费用：
        您在服务中止或终止之前已经上传至比特币交易中心的比特币尚未交易的，比特币交易中心有权在中止或终止服务的同时删除此项物品的相关信息；
        您在服务中止或终止之前已经与其他会员达成买卖合同，但合同尚未实际履行的，比特币交易中心有权删除该买卖合同及其交易比特币的相关信息；
        您在服务中止或终止之前已经与其他会员达成买卖合同且已部分履行的，比特币交易中心可以不删除该项交易，但比特币交易中心有权在中止或终止服务的同时将相关情形通知您的交易对方。

七、隐私权政策

比特币交易中心将在比特币交易中心平台公布并不时修订隐私权政策，隐私权政策构成本协议的有效组成部分。
八、法律适用、管辖与其他

    本协议之效力、解释、变更、执行与争议解决均适用中华人民共和国大陆地区法律，如无相关法律规定的，则应参照通用国际商业惯例和（或）行业惯例。
    本协议包含了您使用比特币交易中心需遵守的一般性规范，您在使用某个比特币交易中心时还需遵守适用于该平台的特殊性规范（具体请参见您与该平台签署的其他协议以及平台规则等内容）。一般性规范如与特殊性规范不一致或有冲突，则特殊性规范具有优先效力。
    因本协议产生之争议需根据您使用的服务归属的平台确定具体的争议对象，例如因您使用比特币交易中心服务所产生的争议应由比特币交易中心的经营者与您沟通并处理。一旦产生争议，您与比特币交易中心的经营者均同意以被告住所地人民法院为第一审管辖法院。


        
        </textarea>
        </td>
        </tr>
		<tr>
			<td></td>
			<td style="padding:5px;">
				<input type="button" value="同意并提交注册信息" onClick="if ( $('#formContainer1').jVal() ) document.form.submit();" class="inputsize"/>
			</td>
		</tr>
	</table>
	</form>
      </div>
    </div>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<jsp:include page="/include/foothtml.jsp"></jsp:include>
</body>
</html>
