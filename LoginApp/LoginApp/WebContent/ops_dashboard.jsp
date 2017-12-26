<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>


<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@203.89.134.50:1521:orcltest", "oll", "oll");
	String uId = (String) session.getAttribute("user_id");
	String branch = (String) session.getAttribute("branch");
	String dept = (String) session.getAttribute("dept");

	Statement statement = con.createStatement();
	ResultSet resultset = statement
			.executeQuery("SELECT DISTINCT DEPT FROM NG_USER_PERMISSION where USER_ID='" + uId + "'");

	Statement statement1 = con.createStatement();
	ResultSet resultset1 = statement1.executeQuery(
			"select count(*) cnt from oll.ops_cn_m where CN_DELIVERY_DATE is not null and CN_DDR_NO is null");

	Statement statement2 = con.createStatement();
	ResultSet resultset2 = statement2.executeQuery(
			"select count(*) from oll.ops_cn_m where CN_COMPANY_CODE='400001' and CN_CN_STATUS='1' and CN_DDR_NO is not null and CN_POD_UPLOAD_STS is null");

	Statement statement3 = con.createStatement();
	ResultSet resultset3 = statement3.executeQuery(
			"select count(*) from oll.ops_cn_m where CN_COMPANY_CODE='400001' and CN_CN_STATUS='1' and CN_POD_UPLOAD_STS is not null and cn_adr_no is null");
%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Testing</title>
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
<link href="dist/css/sb-admin-2.css" rel="stylesheet">
<link href="vendor/morrisjs/morris.css" rel="stylesheet">
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

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
				<a class="navbar-brand" href="dashboard.jsp">Under Construction</a>
			</div>
			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">
						<%
							while (resultset.next()) {
						%>
						<!-- <li><a href="<%=resultset.getString(1).toLowerCase()%>_dashboard.jsp"><i class="fa fa-dashboard fa-fw"></i><%=resultset.getString(1)%></a></li>	-->
						<li><a href="ops_dashboard.jsp"><i
								class="fa fa-dashboard fa-fw"></i><%=resultset.getString(1)%></a></li>
						<%
							}
						%>
						<li><a href="logout.jsp"><i class="fa fa-dashboard fa-fw"></i>Logout</a></li>
					</ul>
				</div>
				<!-- /.sidebar-collapse -->
			</div>
			<!-- /.navbar-static-side -->
		</nav>

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">OPS Dashboard</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-comments fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">

										<%
											while (resultset1.next()) {
										%>
										<%=resultset1.getString(1)%>
										<%
											}
										%>


									</div>
									<div>DLY VS DDR (Total cn)</div>
								</div>
							</div>
						</div>
						<a href="#">
							<div class="panel-footer">
								<span class="pull-left">View Details</span> <span
									class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-green">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-tasks fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">
										<%
											while (resultset2.next()) {
										%>
										<%=resultset2.getString(1)%>
										<%
											}
										%>
									</div>
									<div>DDR VS POD REC</div>
								</div>
							</div>
						</div>
						<a href="#">
							<div class="panel-footer">
								<span class="pull-left">View Details</span> <span
									class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-yellow">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-shopping-cart fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">
										<%
											while (resultset3.next()) {
										%>
										<%=resultset3.getString(1)%>
										<%
											}
										%>
									</div>
									<div>POD REC VS ADR</div>
								</div>
							</div>
						</div>
						<a href="#">
							<div class="panel-footer">
								<span class="pull-left">View Details</span> <span
									class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-red">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-support fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div>Report Menu</div>
								</div>
							</div>
						</div>
						<a href="opsmenu.jsp?dept=OPS">
							<div class="panel-footer">
								<span class="pull-left">View Details</span> <span
									class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
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
