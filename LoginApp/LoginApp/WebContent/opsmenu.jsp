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


		
		Statement statement1=con.createStatement();
		ResultSet resultset1 = statement1.executeQuery("select a.REPORT_ID, a.DISPLAY_NAME from oll.ng_report_master a, NG_USER_PERMISSION b where a.DEPARTMENT=b.DEPT and a.REPORT_ID = b.REPORT_ID and b.USER_ID='"+uId+"'");

		
		
%> 
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Operation</title>
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
<link href="dist/css/sb-admin-2.css" rel="stylesheet">
<link href="vendor/morrisjs/morris.css" rel="stylesheet">
<link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

</head>

<body>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="dashboard.jsp">OPS Construction</a>
			</div>
			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">
                    	<%	while (resultset.next()) { %>
                        	<li><a href="ops_dashboard.jsp"><i class="fa fa-dashboard fa-fw"></i><%=resultset.getString(1)%></a></li>	
						<%	} %>
                        	<li><a href="logout.jsp"><i class="fa fa-dashboard fa-fw"></i>Logout</a></li>
					</ul>
				</div>
				<!-- /.sidebar-collapse -->
			</div>
			<!-- /.navbar-static-side -->
		</nav>
			        <div id="page-wrapper">
            <div class="row">
        <div id="edp" class="change_status"> 
				<div class="col-lg-3 col-md-6">
                    <ul>
                    	<%	while (resultset1.next()) { %>
                        	<li><a href="report.jsp?report_id=<%=resultset1.getString(1)%>"><i class="fa fa-dashboard fa-fw"></i><%=resultset1.getString(2)%></a></li>	
						<%	} %>
                    </ul>
                </div>
				</div>
            <div class="row margin_200">
            <div class="col-xs-12">
              <span><?php echo date('Y'); ?></span> &copy; Om Logistics Ltd. <a href="http://omlogistics.co.in/" target="_blank">Omlogistics.co.in</a>
            </div>
          </div>
         </div>
		
	</div>
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="../vendor/metisMenu/metisMenu.min.js"></script>
	<script src="../vendor/raphael/raphael.min.js"></script>
	<script src="../vendor/morrisjs/morris.min.js"></script>
	<script src="../data/morris-data.js"></script>
	<script src="../dist/js/sb-admin-2.js"></script>

</body>

</html>
