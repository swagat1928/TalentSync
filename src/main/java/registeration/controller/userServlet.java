package registeration.controller;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import registeration.model.user;
import registration.dao.userdao;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;
/**
 * Servlet implementation class userServlet
 */
@WebServlet("/userServlet")
public class userServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      

    /**
     * @see HttpServlet#HttpServlet()
     */
    public userServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String uname=request.getParameter("username");
		String ema=request.getParameter("email");
		String pass=request.getParameter("password");
		String cpass=request.getParameter("cpassword");
		String usertype = request.getParameter("userType");
		
		HttpSession session = request.getSession();
		
		
		
		int i = 0;
		user a=new user(uname,ema,pass,usertype);
		userdao b=new userdao();
		try {
			if(uname== null || uname.equals("") || uname.length()<6) {
				System.out.print(ema);	
				session.setAttribute("flag","invalidUser");;
				RequestDispatcher dispatcher=request.getRequestDispatcher("index.jsp");
				dispatcher.forward(request, response);
					
			}
			else if(ema== null || ema.equals("")) {
				session.setAttribute("flag","invalidEmail");
				RequestDispatcher dispatcher=request.getRequestDispatcher("index.jsp");
				dispatcher.forward(request, response);
			}
			else if(pass== null || pass.equals("")) {
				session.setAttribute("flag","invalidpassword");
				RequestDispatcher dispatcher=request.getRequestDispatcher("index.jsp");
				dispatcher.forward(request, response);
			}
			else if(cpass== null || cpass.equals("") || !cpass.equals(pass)) {
				session.setAttribute("flag","invalidconfirmpassword");
			    RequestDispatcher dispatcher=request.getRequestDispatcher("index.jsp");
				dispatcher.forward(request, response);
			}
			else if (!ema.matches("[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}")) {
				session.setAttribute("flag", "Invalid email format");
	            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
	            dispatcher.forward(request, response);
	        }
			else if(b.registeruser(a)==0) {
				session.setAttribute("flag", "emailexist");
	            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
	            dispatcher.forward(request, response);
			}
			else {
			
				//request.setAttribute("status","success");
				i=b.registeruser(a);
                session.setAttribute("flag","registered");
                response.sendRedirect("index.jsp");
				
			}
//			else {
//				//request.setAttribute("status","failed1");
//			
//                session.setAttribute("flag","unregistered");
//                response.sendRedirect("index.jsp");
//	
//			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
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
