package registeration.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import registeration.model.client;
import registration.dao.UpdateClientdao;

/**
 * Servlet implementation class UpdateclientServlet
 */
@WebServlet("/UpdateclientServlet")
public class UpdateclientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateclientServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String cname=request.getParameter("cname");
		String description=request.getParameter("description");
		String cno=request.getParameter("cno");
		String email=request.getParameter("email");
		
		HttpSession session = request.getSession();
			
		
		
		System.out.println(email);
		
		client a=new client(fname,lname,cname,description,cno,email);
		UpdateClientdao b=new UpdateClientdao();
		try {
			b.updateclient(a);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       
        response.sendRedirect("showcprofile.jsp");
		
		
	
	}
	}


