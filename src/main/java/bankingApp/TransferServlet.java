package bankingApp;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TransferServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("name");
        String password = request.getParameter("password");

        String accountno = request.getParameter("acc_no");
        String taccountno = request.getParameter("tacc_no");
        double amount = Double.parseDouble(request.getParameter("amount"));

        System.out.println(username + " - " + password + " - " + accountno + " - " + amount);

        Controller controller = new Controller();
        double result = controller.transferAmount(Integer.parseInt(accountno), Integer.parseInt(taccountno), username, password, amount);
        
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("transfer.jsp");
        if (result >= 0) {
            Account account = new Account(Integer.parseInt(accountno), username, password, "", "","", result);
            request.setAttribute("success", true);
            request.setAttribute("account", account);
            request.setAttribute("depositedAmount", amount);
            requestDispatcher.forward(request, response);
        } else {
            request.setAttribute("success", false);
            String errorMessage = result == -1 ? "Invalid Login Credentials" : "Unknown Error! Please Try Again.";
            request.setAttribute("error", errorMessage);
            requestDispatcher.forward(request, response);
        }
	}
}
