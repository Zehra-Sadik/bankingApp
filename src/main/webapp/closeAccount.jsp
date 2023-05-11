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
						<h1 style="margin-left: 25px">Services</h1>
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
					<table>
						<%
						String num = request.getParameter("acc_no");
						int acc_no = Integer.parseInt(num);
						String name = request.getParameter("name");
						String password = request.getParameter("password");
						Controller controller = new Controller();
						boolean verify = controller.checkLogin(acc_no, name, password)==1;
						try {
							if (verify == true) {
								int status = controller.closeAccount(acc_no, name, password);
								if (status == 1){
									controller.session.close();
									out.print("<table align='center'  cellspacing='10' cellpadding='25' background='FDF7C3'>");
									out.print("<td id='texth'> Welcome  " + name + "</td>");
									out.print("</table>");
									out.print("<table align='center'  cellspacing='5' cellpadding='5'>");
									out.print("<td id='texth' style='color:#50C878'>Account Number "+acc_no+" is succesfully closed </td>");
									out.print("</table>");
								}
								else{
									out.print("<table align='center'  cellspacing='10' cellpadding='7' background='FDF7C3'>");
									out.print("<td> Welcome  "+ name + "</td>");
									out.print("</table>");
									out.print("<table align='center'  cellspacing='5' cellpadding='5'>");
									out.print("<td>Unable to delete the Account with Account Number "+acc_no+" </td>");
									out.print("</table>");
								}
						}
						 else {
						out.print("Please check your username and Password");
						request.setAttribute("balance", "Please check your username and Password");
						%>
						<jsp:forward page="closeacView.jsp"></jsp:forward>
						<%
						}
						} catch (Exception e) {
						e.printStackTrace();
						}
						%>
					</table>
		</table>


		<%@ page import="java.sql.*"%>
		<%@ page import="java.io.*"%>
		<%@ page import="javax.servlet.*"%>
		<%@ page import="bankingApp.Controller"%>
		<%@ page import="bankingApp.Account"%>