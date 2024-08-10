package registration.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import registeration.model.profile;

public class updatedao {
	public int profileuser(profile user) throws ClassNotFoundException {
	       

        int result = 0;

        

        try {
        	Class.forName("com.mysql.jdbc.Driver");
        
        	Connection con=DriverManager.getConnection(  "jdbc:mysql://localhost:3306/freelance","root","100pushUPS!!!");  
            // Step 2:Create a statement using connection
        	
        	PreparedStatement statement = con.prepareStatement("SELECT user_id FROM users WHERE email = ?");
        	String aa=user.getEmail();
        	System.out.println(aa);
        	statement.setString(1, user.getEmail());
        	
        	// Execute the query
        	ResultSet resultSet = statement.executeQuery();
        	
        	// Process the result
        	int userId = -1; // Default value if no user ID is found
        	if (resultSet.next()) {
        	    userId = resultSet.getInt("user_id");
        	}
        	 System.out.println(userId);
        	
        	
            PreparedStatement preparedStatement = con.prepareStatement("Update freelancer set firstname=?,lastname=?,role=?,university=?,degree=?,skill=?,rate=?,bio=?,contact=?,location=?,image=? where user_id=?");
            
            
            preparedStatement.setString(1, user.getFname());
            preparedStatement.setString(2, user.getLname());
            preparedStatement.setString(3, user.getRole());
            preparedStatement.setString(4, user.getUni());
            preparedStatement.setString(5, user.getDegree());
            preparedStatement.setString(6, user.getSkill());
            preparedStatement.setDouble(7, user.getRate());
            preparedStatement.setString(8, user.getBio());
            preparedStatement.setString(9, user.getContact());
            preparedStatement.setString(10, user.getAddress());
            preparedStatement.setString(11, user.getInputStream());
            preparedStatement.setInt(12,userId);

            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            result = preparedStatement.executeUpdate();
            
          
        } catch (SQLException e) {
            // process exception
            e.printStackTrace();
        }
        return result;
    }
}
