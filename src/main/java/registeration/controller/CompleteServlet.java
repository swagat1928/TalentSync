package registeration.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CompleteServlet
 */
@WebServlet("/CompleteServlet")
public class CompleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompleteServlet() {
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
String id=request.getParameter("id");
		
		
		System.out.println(id);
		
		int a=(int)Integer.parseInt(id);
		
		  try {
			  int result=0;
	        	

	        	Class.forName("com.mysql.jdbc.Driver");
	        	
	        	Connection con=DriverManager.getConnection(  "jdbc:mysql://localhost:3306/freelance","root","100pushUPS!!!");  
	            // Step 2:Create a statement using connection object
	        	
	            PreparedStatement statement1 = con.prepareStatement("update applied set work_status='completed' where id=?");
	            statement1.setInt(1,a);
	           

	            System.out.println(statement1);
	            // Step 3: Execute the query or update query
	           	result = statement1.executeUpdate();
	        	
	           	if(result>0) {
	           		HttpSession session = request.getSession();
	           	
	           		response.sendRedirect("showjobs.jsp"); 	
	      		  
	      		  }
	        } catch (SQLException | ClassNotFoundException e) {
	            // process exception
	            e.printStackTrace();
	        }
	}
	}


