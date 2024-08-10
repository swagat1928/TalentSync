package registeration.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ApplyServlet
 */
@WebServlet("/ApplyServlet")
public class ApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApplyServlet() {
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
		HttpSession session=request.getSession();
		String id=request.getParameter("id");
		String email=(String)session.getAttribute("email");
		String cid=request.getParameter("client_id");
		
		System.out.println(id);
		System.out.println(cid);
		System.out.println(email);
		int a=(int)Integer.parseInt(id);
		int b=(int)Integer.parseInt(cid);
		  try {
			  int result=0;
	        	String aa =(String)session.getAttribute("email");

	        	Class.forName("com.mysql.jdbc.Driver");
	        	
	        	Connection con=DriverManager.getConnection(  "jdbc:mysql://localhost:3306/freelance","root","100pushUPS!!!");  
	            // Step 2:Create a statement using connection object
	        	PreparedStatement statement = con.prepareStatement("select id from freelancer where user_id in(SELECT user_id FROM users WHERE email = ?)");
	        	statement.setString(1,email);
	        	
	        	// Execute the query
	        	ResultSet resultSet = statement.executeQuery();
	        	
	        	// Process the result
	        	int userId = -1; // Default value if no user ID is found
	        	if (resultSet.next()) {
	        	    userId = resultSet.getInt("id");
	        	}
	        	 //System.out.println(userId);
	        	
	            PreparedStatement statement1 = con.prepareStatement("insert into applied(job_id,client_id,free_id) values(?, ?, ?)");
	            statement1.setInt(1,a);
	            statement1.setInt(2,b);
	            statement1.setInt(3,userId);

	            System.out.println(statement1);
	            // Step 3: Execute the query or update query
	           	result = statement1.executeUpdate();
	        	
	        	if(result>0) {
	           		
	           		session.setAttribute("flag","job");
	           		response.sendRedirect("freehome.jsp"); 	
	      		  
	      		  }
	        	else {
	        		session.setAttribute("flag","unjob");
	           		response.sendRedirect("freehome.jsp"); 	
	        	}
	        } catch (SQLException | ClassNotFoundException e) {
	            // process exception
	            e.printStackTrace();
	        }
		  
		
	}

}
