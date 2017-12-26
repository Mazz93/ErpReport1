<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Operation Reports</title>
	<script type="text/javascript" src="validate.js"></script>
</head>
<body bgcolor="#ccf5ff">
<form action="BookingRepServlet" method="get">

	<table  width="30%" bgcolor="#ccfff5" align="center" cellspacing="2">
	
		<tr>
			<td colspan=2>
			<center><font size=4><b>Mis Booking Report</b></font></center><br><br>
			</td>
		</tr>

		<tr>
			<td>Company Code</td>
			<td><input type="number" name="compcode" id="cd" size="30" style="text-transform:uppercase" required></td>
		</tr>
		
		<tr>
			<td>Branch Code</td>
			<td><input type="number" name="brcode" id="bd" size="30" style="text-transform:uppercase" required></td>
			</tr>
		
		<tr>
			<td>From Date</td>
			<td><input type="text" name="frdt" id="dt" size="30"  required></td>
		</tr>
	
		<tr>
			<td>To Date</td>
			<td><input type="text" name="todt" id="dt" size="30"  required></td>
		</tr>
	
		<tr>
			<td>Consignor</td>
			<td><input type="text" name="cnr" id="csg" size="30"  style="text-transform:uppercase" required></td>
			
		</tr>

		<tr>
			<td>Consignee</td>
			<td><input type="text" name="cne" id="cge" size="30"  style="text-transform:uppercase" required></td>
			
		</tr>
		
		<tr>
			<td>Party Name</td>
			<td><input type="text" name="partycode" id="partycode" size="30" style="text-transform:uppercase" required></td>
		</tr>
	
			<tr>
			<td>Disct Name</td>
			<td><input type="text" name="disctcode" id="disctcode" size="30" style="text-transform:uppercase" required></td>
		</tr>
		
		<tr>
			<td>T mode</td>
			<td><input type="text" name="tmode" id="tmode" size="30" style="text-transform:uppercase" required></td>
		</tr>
		
		<tr>
			<td>Freight mode</td>
			<td><input type="text" name="frmode" id="frmode" size="30" style="text-transform:uppercase" required></td>
		</tr>
		
			<td colspan="2" align="center" >
				<input type="submit" value="Submit Form" align="centre" />
			</td>
		</tr>
		
	</table>
	
</form>
</body>
</html>