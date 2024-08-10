package registration.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import registeration.model.searchskill;

public class searchdao {
		 public int registerjob(searchskill jobs) throws ClassNotFoundException {
		       

		        int result = 0;

		        

		        try {
		        	Class.forName("com.mysql.jdbc.Driver");
		        	result=0;
		        	Connection con=DriverManager.getConnection(  "jdbc:mysql://localhost:3306/freelance","root","100pushUPS!!!");  
		            // Step 2:Create a statement using connection object
		
		        	
		            PreparedStatement statement = con.prepareStatement("select * from jobs where skill=?");
		            statement.setString(1,jobs.getSkill());
		            

		            System.out.println(statement);
		            // Step 3: Execute the query or update query
		            result = statement.executeUpdate();
		   
		        } catch (SQLException e) {
		            // process exception
		            e.printStackTrace();
		        }
		        return result;
	}}


