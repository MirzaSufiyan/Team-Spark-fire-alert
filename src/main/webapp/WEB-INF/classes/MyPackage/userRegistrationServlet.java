package MyPackage;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/userRegistrationServlet")
public class userRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

       
    public userRegistrationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out =response.getWriter();
		String name=(String)req.getParameter("naam");
		String channelid=(String)req.getParameter("channel");
		String email=(String)req.getParameter("email");
		String password=(String)req.getParameter("password");
		String wdgt1=(String)req.getParameter("wdgt1");
		String phnum=(String)req.getParameter("phnum");
		 String nearestFireStation = req.getParameter("nearestFireStation");
	        String nearestFireStationArea = req.getParameter("nearestFireStationArea");

	        String nearestHospital = req.getParameter("nearestHospital");
	        String nearestHospitalArea = req.getParameter("nearestHospitalArea");

	        String nearestPoliceStation = req.getParameter("nearestPoliceStation");
	        String nearestPoliceStationArea = req.getParameter("nearestPoliceStationArea");

				try {
					Database db = new Database();
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection c = DriverManager.getConnection(db.getConnectionUrl());
					System.out.print("connected");
					PreparedStatement s = c.prepareStatement("insert into userdata value(?,?,?,?,?,?,?,?,?,?,?,?)");
					s.setString(1,name);
					s.setString(2,channelid);
					s.setString(3,email);
					s.setString(4,password);
					s.setString(5,wdgt1);
					s.setString(6,phnum);
					s.setString(7,nearestFireStation);
					s.setString(8,nearestHospital);
					s.setString(9,nearestPoliceStation);
					s.setString(10,nearestFireStationArea);
					s.setString(11,nearestPoliceStationArea);
					s.setString(12,nearestHospitalArea);
					int up= s.executeUpdate();
					System.out.print("UPDATED");

					if(up>0) {
						RequestDispatcher rd = req.getRequestDispatcher("./index.jsp");
						rd.forward(req, response);
					}
					else {
						response.setContentType("text/html");
						out.print("<h3>Failed</h3>");	
					}
					
					c.close();
				}
				catch(Exception e) {
					RequestDispatcher rd = req.getRequestDispatcher("./register.jsp");
					rd.include(req, response);
					System.out.print("ERROR");
					System.out.print(e);
					response.setContentType("text/html");
					out.print("<h3>Failed !!!</h3>");
					
				}
	}
}
