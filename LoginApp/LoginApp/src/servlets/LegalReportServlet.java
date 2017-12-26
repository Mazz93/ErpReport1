package servlets;

import java.io.IOException;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LegalReportServlet")
public class LegalReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String from=request.getParameter("frdt");
		String to=request.getParameter("todt");
		
		//System.out.println(from);
		//System.out.println(to);
		try {
			ConnectionDAO dao = new ConnectionDAO();
			Statement statement = dao.getConnection();
			String qry = "SELECT LEG_CASE_BY_ID, LEG_COMPLAINT,LEG_ACCUSED,LEG_NATURE_OF_CASE,LEG_OUTSTANDING FROM OLL.LEG_CASE_BY WHERE TRUNC(LEG_ENTER_DATE) BETWEEN '"
					+ request.getParameter("frdt") + "' AND '" + request.getParameter("todt") + "'";
			ResultSet rs=statement.executeQuery(qry);
			HttpSession session=request.getSession(false);
			session.setAttribute("resulset", rs);
			response.sendRedirect("downloadReport.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
