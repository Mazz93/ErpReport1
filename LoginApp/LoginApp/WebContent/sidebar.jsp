<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%@ page session="true" %>	
    
    
<%
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@203.89.134.50:1521:orcltest", "oll", "oll");
		
		
		
		String uId = (String)session.getAttribute("user_id");
		String branch = (String)session.getAttribute("branch");
		String dept = (String)session.getAttribute("dept");
		
		Statement statement=con.createStatement();
		ResultSet resultset = statement.executeQuery("SELECT DISTINCT DEPT,BRANCH FROM NG_USER_PERMISSION where USER_ID='" + uId + "'");	
		
%> 

					<ul class="nav" id="side-menu">
                    	<%	while (resultset.next()) { %>
                        	<li><a href="ops_dashboard.jsp"><i class="fa fa-dashboard fa-fw"></i><%=resultset.getString(1)%></a></li>	
						<%	} %>
                        	<li><a href="logout.jsp"><i class="fa fa-dashboard fa-fw"></i>Logout</a></li>
					</ul>
				
