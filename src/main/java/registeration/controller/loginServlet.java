package registeration.controller;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import registeration.model.logincheck;
import registration.dao.logindao;
import registeration.model.user;
/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private logindao logindao;

	    public void init() {
	        logindao = new logindao();
	    }
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String email = request.getParameter("email");
        String password = request.getParameter("password");
        logincheck loginBean = new logincheck();
        loginBean.setEmail(email);
        loginBean.setPassword(password);

        try {
            if (logindao.validate(loginBean)==1) {
                HttpSession session = request.getSession();
                session.setAttribute("email",email);
                session.setAttribute("flag","sign");
                response.sendRedirect("clientprofile.jsp");
                
            } 
            else if(logindao.validate(loginBean)==2){
            	HttpSession session = request.getSession();
                session.setAttribute("email",email);
                session.setAttribute("flag","sign");
                
                response.sendRedirect("profile.jsp");
            }
            else if(logindao.validate(loginBean)==3){
            	HttpSession session = request.getSession();
                session.setAttribute("email",email);
                session.setAttribute("flag","sign");
                response.sendRedirect("chome.jsp");
            }
            else if(logindao.validate(loginBean)==4){
            	HttpSession session = request.getSession();
                session.setAttribute("email",email);
                session.setAttribute("flag","sign");
                response.sendRedirect("freehome.jsp");
            }
            else {
                HttpSession session = request.getSession();
                //session.setAttribute("user", username);
                session.setAttribute("flag","failed");
                response.sendRedirect("index.jsp");
               
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
	}

}
