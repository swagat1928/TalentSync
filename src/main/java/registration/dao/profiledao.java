package registration.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import registeration.model.profile;

public class profiledao {
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
        	
        	
            PreparedStatement preparedStatement = con.prepareStatement("INSERT INTO freelancer (user_id,firstname,lastname,role,university,degree,skill,rate,bio,contact,location,image) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            
            preparedStatement.setInt(1,userId);
            preparedStatement.setString(2, user.getFname());
            preparedStatement.setString(3, user.getLname());
            preparedStatement.setString(4, user.getRole());
            preparedStatement.setString(5, user.getUni());
            preparedStatement.setString(6, user.getDegree());
            preparedStatement.setString(7, user.getSkill());
            preparedStatement.setDouble(8, user.getRate());
            preparedStatement.setString(9, user.getBio());
            preparedStatement.setString(10, user.getContact());
            preparedStatement.setString(11, user.getAddress());
            preparedStatement.setString(12, user.getInputStream());
            

            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            result = preparedStatement.executeUpdate();
            
            if(result!=0) {
            	PreparedStatement State = con.prepareStatement("Update users set first_time_login=0 where user_id=? ");
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
