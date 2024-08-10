package registeration.controller;

import java.io.IOException;
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

@WebServlet("/paymentServlet")
public class paymentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
        String cardname = request.getParameter("card_name");
        String cno = request.getParameter("card_number");
        String cvv = request.getParameter("cvv");
        int cid=Integer.parseInt(request.getParameter("cid"));
        int jid=Integer.parseInt(request.getParameter("id"));
        int fid=Integer.parseInt(request.getParameter("fid")); 
        int aid=Integer.parseInt(request.getParameter("aid"));  
        System.out.print(cardname);
        System.out.print(jid);
        try {
        	Class.forName("com.mysql.jdbc.Driver");
        	
        	Connection conn=DriverManager.getConnection(  "jdbc:mysql://localhost:3306/freelance","root","100pushUPS!!!");  
           
            PreparedStatement statement = conn.prepareStatement("select payment_amount from job where id=?");
        	statement.setInt(1,jid);
        	
        	// Execute the query
        	ResultSet rs1 = statement.executeQuery();
            rs1.next();
            int amount = (int) rs1.getDouble("payment_amount");
            
           
            String sql = "INSERT INTO payment (freelancer_id,client_id,job_id,payment_amount,cardname, cardno, cvv) VALUES (?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setInt(1, fid);
            stmt.setInt(2, cid);
            stmt.setInt(3, jid);
            stmt.setInt(4, amount);
            stmt.setString(5, cardname);
            stmt.setString(6, cno);
            stmt.setString(7, cvv);
         
            stmt.executeUpdate();
           

            // Redirect to success page after successful submission
            
            PreparedStatement statement2 = conn.prepareStatement("update applied set pay_status='completed' where id=?");
        	statement2.setInt(1,aid);
        	
        	// Execute the query
        	statement2.executeUpdate();
            
        	response.sendRedirect("showjobs.jsp");
            
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            // Redirect to error page if an exception occurs
            response.sendRedirect("error.jsp");
        }
    }
}
