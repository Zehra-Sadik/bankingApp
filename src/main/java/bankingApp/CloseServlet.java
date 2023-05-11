package bankingApp;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CloseServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String acc_no = request.getParameter("acc_no");
		Controller controller = new Controller();
		int result = controller.closeAccount(Integer.parseInt(acc_no), name, password);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("closeAccount.jsp");
		if (result >= 0) {
			Account account = new Account(Integer.parseInt(acc_no), name, password, "", "", "", result);
			request.setAttribute("account", account);
			requestDispatcher.forward(request, response);
		} else {
			request.setAttribute("success", false);
			String errorMessage = result == -1 ? "Invalid Login Credentials" : "Unknown Error! Please Try Again.";
			request.setAttribute("error", errorMessage);
			requestDispatcher.forward(request, response);
		}
	}
}
