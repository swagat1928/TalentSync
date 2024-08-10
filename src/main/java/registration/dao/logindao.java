package registration.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

import registeration.model.logincheck;
import registeration.model.user;

public class logindao {

    public int validate(logincheck logincheck) throws ClassNotFoundException {
        boolean status = false;

        

        try {
        	Class.forName("com.mysql.jdbc.Driver");
        		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/freelance", "root", "100pushUPS!!!");

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement("select * from users where email = ? and password = ?");
            preparedStatement.setString(1, logincheck.getEmail());
            preparedStatement.setString(2, logincheck.getPassword());

            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next())
            {
            	status = true;
            }
            if(status==true) {
            	
            	PreparedStatement statement = connection.prepareStatement("SELECT * FROM users WHERE email = ?");
        		String aa=logincheck.getEmail();
            	System.out.println(aa);
            	statement.setString(1, logincheck.getEmail());
            	
            	// Execute the query
            	ResultSet resultSet = statement.executeQuery();
            	resultSet.next();
            
              
            	System.out.println(logincheck.isFtime());
            	if (resultSet.getBoolean("first_time_login")) {
            		if(resultSet.getString("usertype").equals("client")) {
            			return 1;
            		}
            		else if(resultSet.getString("usertype").equals("freelancer")) {
            			return 2;
            		}
            	}
            	else {
            		if(resultSet.getString("usertype").equals("client")) {
            			return 3;
            		}
            		else if(resultSet.getString("usertype").equals("freelancer")) {
            			return 4;
            		}
            	}
            }
            else{
            	return 5;
            }

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);}
        return  5;
        }
    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
