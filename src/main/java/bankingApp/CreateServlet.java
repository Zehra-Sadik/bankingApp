package bankingApp;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bankingApp.Controller;

public class CreateServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
	PrintWriter out=response.getWriter();
	
	String name=request.getParameter("username");
	String password=request.getParameter("password");
	String  repassword=request.getParameter("repassword");
	
	String amoun=request.getParameter("amount");
	int amount=Integer.parseInt(amoun);
	
	String address=request.getParameter("address");
	
	String ph=request.getParameter("phone");
	
	
	Account account = new Account(name,password,repassword,address,ph,amount);
	Controller controller = new Controller();
	int accno = controller.mybatisInsert(name, password, repassword, address, ph, amount);
	
	account.setAcc_no(accno);

	if (accno > 0) {
		out.print("WELCOME! YOUR ACCOUNT HAS OPENED");
		request.setAttribute("account", account);
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		rd.forward(request,response);
		
	} else {
		out.print("Sorry,Registration failed. please try later");
		RequestDispatcher rd = request.getRequestDispatcher("MyHtml.html");
			rd.forward(request,response);
		}
		out.close();
	}
}
