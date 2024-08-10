package registeration.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import registeration.model.client;
import registration.dao.clientdao;

/**
 * Servlet implementation class clientServlet
 */
@WebServlet("/clientServlet")
@MultipartConfig(maxFileSize = 16177215)
public class clientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public clientServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String cname=request.getParameter("cname");
		String description=request.getParameter("description");
		String cno=request.getParameter("cno");
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
		System.out.println(imageFileName);
		client a=new client(fname,lname,cname,description,cno,email,imageFileName);
		clientdao b=new clientdao();
		try {
			b.clientuser(a);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       
        response.sendRedirect("showjobs.jsp");
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
