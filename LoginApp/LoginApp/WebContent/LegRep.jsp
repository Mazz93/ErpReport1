<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Legal Reports</title>
<!-- CORE CSS-->

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.1/css/materialize.min.css">

<style type="text/css">
html, body {
	height: 100%;
	background-position: center;
}

html {
	display: table;
	margin: auto;
}

body {
	display: table-cell;
	vertical-align: middle;
}

.margin {
	margin: 0 !important;
}
</style>

</head>

<body>
	<FORM ACTION="LegalReportServlet" METHOD="get">
		
		<div id="login-page" class="row">
			<div class="col s12 z-depth-6 card-panel"
				style="background-color: #e6fffa">
				<form class="login-form">
					<div class="row">
						<div class="input-field col s12 center">
						</div>
					</div>
					<h6 style="color: red; text-align: center; font-weight: bold; margin-bottom: 10px">Legal Case By Report</h6>
					<div class="row margin">
						<div class="input-field col s12">
							 <i class="mdi-social-person-outline prefix"></i>
                           <input class="validate" placeholder="From Date" name="frdt" type="text" required> 
                            <label for="frdt" class="center-align"></label>
						</div>
					</div>
					<div class="row margin">
						<div class="input-field col s12">
							 <i class="mdi-action-lock-outline prefix"></i> 
							<input name="todt" type="text" required placeholder="To Date">
							<label for="todt"></label>
						</div>
					</div>

					<div class="row">
						<div class="input-field col s12">
							<INPUT TYPE="SUBMIT" value="Submit"
								class="btn waves-effect waves-light col s12">
						</div>
					</div>
					
				</form>
			</div>
		</div>
</body>

</html>