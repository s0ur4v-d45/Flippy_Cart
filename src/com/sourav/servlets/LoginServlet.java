package com.sourav.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sourav.dao.UserDao;
import com.sourav.entities.User;
import com.sourav.helper.FactoryProvider;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.WebServlet;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()) {
			
		
			
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			
			UserDao userDao=new UserDao(FactoryProvider.getFactory());
			User user = userDao.getUserByEmailAndPassword(email, password);
			//System.out.println(user);
			
			HttpSession httpsession=request.getSession();
			if(user==null) 
			{
				httpsession.setAttribute("message", "Invalid details!! Please try again.");
				response.sendRedirect("login.jsp");
				return;
			}
			else
			{
				out.println("<h1> Welcome "+user.getUserName()+"</h1>");
				
				httpsession.setAttribute("current-user",user);
				
				if(user.getUserType().equals("normal"))
				{
					response.sendRedirect("normal.jsp");
				}
				else if(user.getUserType().equals("admin")) {
					response.sendRedirect("admin.jsp");
				}
				else
				{
					out.println("We have not identified user type");
				}
			}
		}
		catch (Exception e) {}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
