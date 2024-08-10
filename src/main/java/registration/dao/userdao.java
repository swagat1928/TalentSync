package registration.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import registeration.model.user;

public class userdao{

    public int registeruser(user user) throws ClassNotFoundException {
       

        int result = 0;

        

        try {
        	Class.forName("com.mysql.jdbc.Driver");
        	result=0;
        	Connection con=DriverManager.getConnection(  "jdbc:mysql://localhost:3306/freelance","root","100pushUPS!!!");  
            // Step 2:Create a statement using connection object
            PreparedStatement Statement = con.prepareStatement("SELECT COUNT(*) AS count FROM users WHERE email=?");
            Statement.setString(1, user.getEmail());
            ResultSet rs = Statement.executeQuery();

            int count = 0;
            if (rs.next()) {
                count = rs.getInt("count");
            }
        	
            System.out.println(count);
            if(count==0) {
            PreparedStatement preparedStatement = con.prepareStatement("INSERT INTO users (username, email, password,usertype) VALUES (?, ?, ?, ?)");
            
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.setString(4,user.getUsertype());
            

            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            result = preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            // process exception
            e.printStackTrace();
        }
        return result;
        
    }
}