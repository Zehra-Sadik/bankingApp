<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

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
				<td width="100" valign="top" style="border-right: #666666 1px dotted;" >
					<div id="services">
						<h1>Services</h1>
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

				<td width="1200" valign="top">
					<%

					%>
					<table>
						<%
						try {
							Account account = (Account) request.getAttribute("account");
							out.print("<br>");
							out.print("<br>");
							out.print("<br>");
							out.print("<table id='text' align='left'  cellspacing='7' cellpadding='7'>");
							out.print(
							"<tr><th>ACC NO</th><th>USERNAME</th><th>PASSWORD</th><th>AMOUNT</th><th>ADDRESS</th><th>PHONE</th></tr>");
							out.print("<tr>");
							out.print("<td>" + account.getAcc_no() + "</td>");
							out.print("<td>" + account.getName() + "</td>");
							out.print("<td>" + account.getPassword() + "</td>");
							out.print("<td>" + account.getAmount() + "</td>");

							out.print("<td>" + account.getAddress() + "</td>");
							out.print("<td>" + account.getPhone() + "</td>");

							out.print("</tr>");

							out.print("</table>");

						} catch (Exception e) {
							e.printStackTrace();
						}
						%>
					</table>
					<%

					%>
					
		</table>



		<%@ page import="java.sql.*"%>
		<%@ page import="java.io.*"%>
		<%@ page import="javax.servlet.*"%>
		<%@ page import="bankingApp.Account"%>