package registeration.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.InputStream;
import javax.servlet.http.Part;
import registeration.model.profile;
import registration.dao.profiledao;
/**
 * Servlet implementation class profileServlet
 */
@WebServlet("/profileServlet")
@MultipartConfig(maxFileSize = 16177215)
public class profileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public profileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String role=request.getParameter("role");
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String uni=request.getParameter("uni");
		String degree=request.getParameter("degree");
		String skill=request.getParameter("skill");
		String contact=request.getParameter("contact");
		String address=request.getParameter("address");
		double rate = Double.parseDouble(request.getParameter("rate"));
		String bio=request.getParameter("bio");
		String email=request.getParameter("email");
		String inputStream = null;
	      
	        Part file = request.getPart("image");
	        
			String imageFileName = file.getSubmittedFileName();
			HttpSession session = request.getSession();
			String uploadPath = "C:/Users/swaga/eclipse-workspace/Freelance/src/main/webapp/images/" + imageFileName;
			try {
			    InputStream is = file.getInputStream();
			    FileOutputStream fos = new FileOutputStream(uploadPath);
			    byte[] buffer = new byte[1024]; // 1KB buffer (you can adjust this as needed)
			    int bytesRead;
			    while ((bytesRead = is.read(buffer)) != -1) {
			        fos.write(buffer, 0, bytesRead);
			    }
			    fos.close();
			    is.close();
			} catch (IOException e) {
			    e.printStackTrace();
			}
		
		System.out.println(email);
		
		profile a=new profile(email,role,fname,lname,uni,degree,skill,contact,address,rate,bio,imageFileName);
		profiledao b=new profiledao();
		try {
			b.profileuser(a);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       
        response.sendRedirect("freehome.jsp");
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
