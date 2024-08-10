package registration.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import registeration.model.client;

public class UpdateClientdao {
	public int updateclient(client user) throws ClassNotFoundException {
	       

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
        	
        	
            PreparedStatement preparedStatement = con.prepareStatement("Update client set firstname=?,lastname=?,company_name=?,bio=?,contact_no=? where user_id=?");
            
            
            preparedStatement.setString(1, user.getFname());
            preparedStatement.setString(2, user.getLname());
            preparedStatement.setString(3, user.getCname());
            preparedStatement.setString(4, user.getDescription());
            preparedStatement.setString(5, user.getCno());
            preparedStatement.setInt(6,userId);

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
