package com.sourav.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transaction;

import org.hibernate.Session;

import com.sourav.entities.User;
import com.sourav.helper.FactoryProvider;


@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			try
			{
				String userName = request.getParameter("user_name");
				String userEmail = request.getParameter("user_email");
				String userPassword = request.getParameter("user_password");
				String userPhone = request.getParameter("user_phone");
				String userAddress = request.getParameter("user_address");
				
				PrintWriter out=response.getWriter();
				if(userName.isBlank())
				{
					out.println("Name is Blank");
					return;
				}
				
				//creating data objects
				User user=new User(userName,userEmail,userPassword,userPhone,"default.jpg",userAddress,"normal");
	           
				//creating session
				Session hibernateSession = FactoryProvider.getFactory().openSession();
				org.hibernate.Transaction tx =  hibernateSession.beginTransaction();
				
				int userId = (int)hibernateSession.save(user);
				tx.commit();
				hibernateSession.close();
				
				//setting data in httpsession object
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("message","Resgistration successful!! User id is: "+userId);
				response.sendRedirect("register.jsp");
				return;
				
//				out.println("successfully saved");
//				out.println("<br> User id is "+userId);
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
