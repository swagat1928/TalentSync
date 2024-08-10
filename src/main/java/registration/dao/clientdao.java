package registration.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import registeration.model.client;

public class clientdao {
	public int clientuser(client user) throws ClassNotFoundException {
	       

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
        	
        	
            PreparedStatement preparedStatement = con.prepareStatement("INSERT INTO client (user_id,firstname,lastname,company_name,bio,contact_no,image) VALUES (?, ?, ?, ?, ?, ?, ?)");
            
            preparedStatement.setInt(1,userId);
            preparedStatement.setString(2, user.getFname());
            preparedStatement.setString(3, user.getLname());
            preparedStatement.setString(4, user.getCname());
            preparedStatement.setString(5, user.getDescription());
            preparedStatement.setString(6, user.getCno());
            preparedStatement.setString(7, user.getInputStream());

            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            result = preparedStatement.executeUpdate();
            if(result!=0) {
            	PreparedStatement State = con.prepareStatement("Update users set first_time_login=0 where user_id= ? ");
            	State.setInt(1, userId);
            	result = State.executeUpdate();
            }

        } catch (SQLException e) {
            // process exception
            e.printStackTrace();
        }
        return result;
    }
}
