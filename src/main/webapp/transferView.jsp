<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<SCRIPT LANGUAGE="JavaScript">
	function verify(form) {
		for (var i = 0; i < form.elements.length; i++) {
			if (form.elements[i].value == "") {
				alert("Fill out all Fields")
				document.F1.acc_no.focus()
				return false
			}
		}

		if (isNaN(document.F1.acc_no.value)) {
			alert("A/C No.  must  be  number & can't be null")
			document.F1.acc_no.value = ""
			document.F1.acc_no.focus()
			return false
		}

		if (!isNaN(document.F1.name.value)) {
			alert("User Name  must  be  char's & can't be null")
			document.F1.name.value = ""
			document.F1.name.focus()
			return false
		}

		if (!isNaN(document.F1.password.value)) {
			alert("Password  must  be  char's & can't be null")
			document.F1.password.value = ""
			document.F1.password.focus()
			return false
		}

		if (isNaN(document.F1.amount.value)) {
			alert("Amount  must  be  number & can't be null")
			document.F1.amount.value = ""
			document.F1.amount.focus()
			return false
		}

		return true
	}
</SCRIPT>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Keepsafe Bank</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body>

	<div id="top_links">


		<div id="header">
			<h1>
				KEEPSAFE - BANK<span class="style1"></span>
			</h1>
			<A href="index.html"></A>
		</div>

		<div id="navigation">
			<ul>
				<li><a href="index.html">HOME</a></li>
				<li><a href="create.html">NEW ACCOUNT</a></li>
				<li><a href="balanceView.jsp">BALANCE</a></li>
				<li><a href="depositView.jsp">DEPOSIT</a></li>
				<li><a href="withdrawView.jsp">WITHDRAW</a></li>
				<li><a href="transferView.jsp">TRANSFER</a></li>
				<li><a href="closeacView.jsp">CLOSE A/C</a></li>
			</ul>
		</div>



		<table id="table">
			<tr>
				<td width="300" valign="top"
					style="border-right: #666666 1px dotted;">
					<div id="services">
						<h1 style="margin-left: 24px">Services</h1>
						<br>
						<ul>
							<li><a href="#">Create Account</a></li>
							<li><a href="#">Check Balance </a></li>
							<li><a href="#">Deposit Amount</a></li>
							<li><a href="#">Withdraw Amount</a></li>
							<li><a href="#">Transfer Amount</a></li>
							<li><a href="#">Close Account</a></li>
						</ul>

					</div>
				</td>

				<td width="1200" valign="top"
					style="border-right: #666666 1px dotted;">
					<div id="welcome">
						<h1>TRANSFER FORM</h1>
						<br>
						<table align="center" bgcolor="#D3D3D3">
							<tr>

							</tr>
							<tr>
								<td>
								<div>
									<%
										if (request.getAttribute("balance") != null) {
											out.print(request.getAttribute("balance"));
										}
										%>
									<form name=F1 onSubmit="return verify(this)" method="post"
										action="transfer.jsp">
										<table cellspacing="5" cellpadding="3">
											<tr>
												<td>ACCOUNT NO:</td>
												<td><input type="text" name="acc_no" /></td>
											</tr>
											<tr>
												<td>USER NAME:</td>
												<td><input type="text" name="name" /></td>
											</tr>
											<tr>
												<td>PASSWORD:</td>
												<td><input type="password" name="password" /></td>
											</tr>
											<tr>
												<td>TARGET ACCOUNT NO:</td>
												<td><input type="text" name="tacc_no" /></td>
											</tr>
											<tr>
												<td>AMOUNT:</td>
												<td><input type="text" name="amount" /></td>
											</tr>
											<tr>
												<td></td>
												<td><input type="submit" value="Submit" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<INPUT TYPE=RESET VALUE="CLEAR"></td>
											</tr>
										</table>
									</form></td>
							</tr>
						</table>
					</div>
				</td>
				<td width="299" valign="top">
					<div id="welcome">
						<h1>
							<center>Welcome</center>
						</h1>
						<br>
						<center>

							<p style:align="justify">A bank is a financial institution
								that provides a variety of financial services to its customers,
								such as savings accounts, loans, credit cards, and investment
								opportunities. Banks play a crucial role in the economy by
								facilitating financial transactions and supporting businesses
								and individuals in achieving their financial goals. They earn
								revenue by charging interest on loans, fees for services, and by
								investing the deposits they hold. Banks are regulated by
								government agencies to ensure they operate in a safe and sound
								manner.</p>
						</center>
					</div>
			</tr>
		</table>
		<script type="text/javascript">
</script>
	</div>
</body>
</html>
