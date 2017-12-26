<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<H1>Mis Booking Reports.....</H1>
	<TABLE BORDER="1">
		<TR>
			<TH>CaseId1</TH>
			<TH>Complaint2</TH>
			<TH>Accused2</TH>
			<TH>Nature4</TH>
			<TH>Outstanding5</TH>
		</TR>

		<%
			ResultSet rs = (ResultSet) session.getAttribute("resulset");
			while (rs.next()) {
				response.setContentType("application/xls");
				response.setHeader("Content-Disposition", "inline; filename=" + "Thakur.xls");
		%>
		<TR>
			<TD><%=rs.getString(1)%></TD>
			<TD><%=rs.getString(2)%></TD>
			<TD><%=rs.getString(3)%></TD>
			<TD><%=rs.getString(4)%></TD>
			<TD><%=rs.getString(5)%></TD>
		</TR>
		<%
			}
		%>
	</TABLE>
</body>
</html>