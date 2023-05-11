<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>KeepSafe Bank</title>
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
				<td width="1200" valign="top">
					<table>
						<%
						String num = request.getParameter("acc_no");
						int acc_no = Integer.parseInt(num);
						String name = request.getParameter("name");
						String password = request.getParameter("password");
						String amoun = request.getParameter("amount");
						double amount = Integer.parseInt(amoun);
						Controller controller = new Controller();
						boolean verify = controller.checkLogin(acc_no, name, password)==1;
						try {
							if (verify == true) {
								double updatedBalance = controller.withdrawAmount(acc_no, name, password, amount);
								controller.session.close();
								if(updatedBalance>0){
									out.print("<table align='center'  cellspacing='10' cellpadding='5' background='FDF7C3'>");
									out.print("<td id='texth'> Welcome  " + name + "</td>");
									out.print("</table>");
									out.print("<table align='center'  cellspacing='4' cellpadding='4'>");
									out.print("<td id='texth' style='color:#50C878'> Amount of <span>&#8377;</span>"+ amount+" is withdrawn from Account Number "+acc_no+ "</td>");
									out.print("</table>");
									out.print("<br>");
									out.print("<table id='infotable' align='center'  cellspacing='4px' cellpadding='5px' style='border: #666666 2px solid'> ");
									out.print("<tr><th>ACCOUNT NO:</th><td>" + acc_no + "</td><tr>");
									out.print("<tr><th>USERNAME:</th><td>" + name + "</td></tr>");
									out.print("<tr><th>CURRENT BALANCE:</th><td><span>&#8377;</span>"+ updatedBalance + "</td></tr>");
									out.print("</table>");
								}
								else if (updatedBalance==-2){
									out.print("<table align='center'  cellspacing='10' cellpadding='5' background='FDF7C3'>");
									out.print("<td id='texth'> Welcome  " + name + "</td>");
									out.print("</table>");
									out.print("<table align='center'  cellspacing='4' cellpadding='4'>");
									out.print("<td id='texth'> Insufficient Balance </td>");
									out.print("</table>");
									out.print("<br>");
									out.print("<table align='center'  cellspacing='4' cellpadding='4'>");
									out.print("<td id='texth' style='color:#DC143C'> Could not withdraw the amount of <span>&#8377;</span>"+ amount+" from Account Number "+acc_no+ "</td>");
									out.print("</table>");
								}
								else if (updatedBalance==-3){
									out.print("Unable to update Balance");
								}
						}else {
						out.print("Please check your username and Password");
						request.setAttribute("balance", "Please check your username and Password");
						%>
						<jsp:forward page="withdrawView.jsp"></jsp:forward>
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