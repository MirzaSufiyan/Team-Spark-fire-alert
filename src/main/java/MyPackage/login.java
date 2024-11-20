package MyPackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public login() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
PrintWriter out = response.getWriter();


        String naam = null;
        String email = null;
        String channel = null;
        String wdgt1 = null;
        String pswrd = null;

;
	String phnum = (String)request.getParameter("phnum");
	String password = (String)request.getParameter("password");
	
	try {
		Database db = new Database();
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection c = DriverManager.getConnection(db.getConnectionUrl());
		System.out.print("connected");
		PreparedStatement s = c.prepareStatement("select * from userdata where phnum=?;");
		s.setString(1,phnum);
        ResultSet rs = s.executeQuery();
        while (rs.next()) {
            pswrd = rs.getString("password");
             naam = rs.getString("naam");
            email = rs.getString("email");
            channel = rs.getString("channelid");
            wdgt1 = rs.getString("widget1");
        }


		if(password.equals(pswrd)) {
//					request.setAttribute("name",naam
			HttpSession hs = request.getSession();

			hs.setAttribute("phnum",phnum);
			
			hs.setAttribute("naam",naam);
			hs.setAttribute("email",email);
			hs.setAttribute("channel",channel);
			hs.setAttribute("wdgt1",wdgt1);

					RequestDispatcher rd = request.getRequestDispatcher("./dashboard.jsp");
					response.sendRedirect("dashboard.jsp");
					rd.forward(request,response);
		}
		else {
			RequestDispatcher rd = request.getRequestDispatcher("./index.jsp");
			rd.include(request, response);
			response.setContentType("text/html");
			out.print("<h3>Wrong Phone number or password</h3>");	
		}
		
		c.close();
	}
	catch(Exception e) {
		RequestDispatcher rd = request.getRequestDispatcher("./index.jsp");
		rd.include(request, response);
		System.out.print(e);
		response.setContentType("text/html");
		out.print("<h3>System Error !!!</h3>");
	}
}
	
	}
