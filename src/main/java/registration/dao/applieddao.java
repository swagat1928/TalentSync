package registration.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import registeration.model.;

public class applieddao {
	 public int registerjob(searchskill jobs) throws ClassNotFoundException {
	       

	        int result = 0;

	        

	        try {
	        	String aa =(String)session.getAttribute("email");

	        	Class.forName("com.mysql.jdbc.Driver");
	        	result=0;
	        	Connection con=DriverManager.getConnection(  "jdbc:mysql://localhost:3306/freelance","root","100pushUPS!!!");  
	            // Step 2:Create a statement using connection object
	        	PreparedStatement statement = con.prepareStatement("select id from freelancer where user_id in(SELECT user_id FROM users WHERE email = ?)");
	        	statement.setString(1,aa);
	        	
	        	// Execute the query
	        	ResultSet resultSet = statement.executeQuery();
	        	
	        	// Process the result
	        	int userId = -1; // Default value if no user ID is found
	        	if (resultSet.next()) {
	        	    userId = resultSet.getInt("user_id");
	        	}
	        	 System.out.println(userId);
	        	
	            PreparedStatement statement1 = con.prepareStatement("insert into applied(job_id,client_id,free_id,status) values(?, ?, ?, true)");
	            statement.setString(1,jobs.getSkill());
	            

	            System.out.println(statement1);
	            // Step 3: Execute the query or update query
	            result = statement1.executeUpdate();
	   
	        } catch (SQLException e) {
	            // process exception
	            e.printStackTrace();
	        }
	        return result;
}}

}
