package registration.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import registeration.model.job;
import registeration.model.user;

public class jobdao {
	 public int registerjob(job jobs) throws ClassNotFoundException {
	       

	        int result = 0;

	        

	        try {
	        	Class.forName("com.mysql.jdbc.Driver");
	        	result=0;
	        	Connection con=DriverManager.getConnection(  "jdbc:mysql://localhost:3306/freelance","root","100pushUPS!!!");  
	            // Step 2:Create a statement using connection object
	        	
	        	PreparedStatement statement1 = con.prepareStatement("SELECT id FROM client WHERE user_id IN (SELECT user_id FROM users WHERE email = ?)");
	        	String email = jobs.getEmail(); // Assuming getEmail() returns the email address
	        	System.out.println(email);
	        	statement1.setString(1, email);
	        	
	        	// Execute the query
	        	ResultSet resultSet = statement1.executeQuery();
	        	
	        	// Process the result
	        	int userId = -1; // Default value if no user ID is found
	        	if (resultSet.next()) {
	        	    userId = resultSet.getInt("id");
	        	}
	        	 System.out.println(userId);
	        
	        	
	            PreparedStatement statement = con.prepareStatement("Insert into job(client_id,title,description,skill,deadline,payment_amount) values (?, ?, ? , ?, ?, ?)");
	            statement.setInt(1, userId);
	            statement.setString(2, jobs.getTitle());
	            statement.setString(3, jobs.getDescription());
	            statement.setString(4, jobs.getSkill());
	            statement.setString(5, jobs.getDeadline());         
	            statement.setDouble(6, jobs.getAmount());

	            System.out.println(statement);
	            // Step 3: Execute the query or update query
	            result = statement.executeUpdate();
	   
	        } catch (SQLException e) {
	            // process exception
	            e.printStackTrace();
	        }
	        return result;
}}
