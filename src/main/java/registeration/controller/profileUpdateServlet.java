package registeration.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
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
import javax.servlet.http.Part;

import registeration.model.profile;
import registration.dao.profiledao;

/**
 * Servlet implementation class profileUpdateServlet
 */
@WebServlet("/profileUpdateServlet")
public class profileUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public profileUpdateServlet() {
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
		String role=request.getParameter("role");
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String uni=request.getParameter("uni");
		String degree=request.getParameter("degree");
		String skill=request.getParameter("skill");
		String contact=request.getParameter("contact");
		String address=request.getParameter("address");
		double rate = Double.parseDouble(request.getParameter("rate"));
		String bio=request.getParameter("bio");
		String email=request.getParameter("email");
		System.out.println(bio);
		HttpSession session = request.getSession();
			
int result = 0;

        

        try {
        	Class.forName("com.mysql.jdbc.Driver");
        
        	Connection con=DriverManager.getConnection(  "jdbc:mysql://localhost:3306/freelance","root","100pushUPS!!!");  
            // Step 2:Create a statement using connection
        	
        	PreparedStatement statement = con.prepareStatement("SELECT user_id FROM users WHERE email = ?");
        	String aa=email;
        	System.out.println(aa);
        	statement.setString(1,aa);
        	
        	// Execute the query
        	ResultSet resultSet = statement.executeQuery();
        	
        	// Process the result
        	int userId = -1; // Default value if no user ID is found
        	if (resultSet.next()) {
        	    userId = resultSet.getInt("user_id");
        	}
        	 System.out.println(userId);
        	
        	
        	 PreparedStatement preparedStatement = con.prepareStatement("Update freelancer set firstname=?,lastname=?,role=?,university=?,degree=?,skill=?,rate=?,bio=?,contact=?,location=? where user_id=?");
             
            
            preparedStatement.setString(1, fname);
            preparedStatement.setString(2, lname);
            preparedStatement.setString(3, role);
            preparedStatement.setString(4, uni);
            preparedStatement.setString(5, degree);
            preparedStatement.setString(6, skill);
            preparedStatement.setDouble(7, rate);
            preparedStatement.setString(8, bio);
            preparedStatement.setString(9, contact);
            preparedStatement.setString(10, address);
            preparedStatement.setInt(11,userId);
            

            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            result = preparedStatement.executeUpdate();
            
            if(result>0)
            {
            	response.sendRedirect("showprofile.jsp");
            }
            else {
            	response.sendRedirect("profileUpdate.jsp");
            }
        } catch (SQLException | ClassNotFoundException e) {
            // process exception
            e.printStackTrace();
        }
       
       
        	
		
		
	
	}

}
