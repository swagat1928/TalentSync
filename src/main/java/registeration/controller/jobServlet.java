package registeration.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import registeration.model.job;
import registration.dao.jobdao;

/**
 * Servlet implementation class jobServlet
 */
@WebServlet("/jobServlet")
public class jobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public jobServlet() {
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
		String title=request.getParameter("title");
		String description=request.getParameter("description");
		String duration=request.getParameter("deadline");	
		String skill=request.getParameter("skill");
		double amount = Double.parseDouble(request.getParameter("budget"));
		String email=request.getParameter("email");
		
		job regjob = new job(email,title,description,duration,skill,amount);
		
		jobdao j = new jobdao();
		System.out.println(duration);

		try {
			j.registerjob(regjob);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       
        response.sendRedirect("chome.jsp");
		
	}

}
