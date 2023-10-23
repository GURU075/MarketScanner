<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Date"%>
<%@page import="Scann.ConnectionUtility"%>
<html lang="en">

<head>
<!-- Required meta tags-->
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Colorlib Templates">
<meta name="author" content="Colorlib">
<meta name="keywords" content="Colorlib Templates">

<!-- Title Page-->
<title>Au Register Forms by Colorlib</title>

<!-- Icons font CSS-->
<link href="vendor/mdi-font/css/material-design-iconic-font.min.css"
	rel="stylesheet" media="all">
<link href="vendor/font-awesome-4.7/css/font-awesome.min.css"
	rel="stylesheet" media="all">
<!-- Font special for pages-->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Vendor CSS-->
<link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
<link href="vendor/datepicker/daterangepicker.css" rel="stylesheet"
	media="all">

<!-- Main CSS-->
<link href="css/main.css" rel="stylesheet" media="all">
</head>

<body>
	<div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
		<div class="wrapper wrapper--w680">
			<div class="card card-4">
				<div class="card-body">
					<h2 class="title">List Of Sold Products</h2>
					<form method="get"
						action="http://localhost:8081/MaketScanner/DataCheck/DateCheck.jsp">






						<CENTER>

							<BR> <BR>
							<TABLE border="1">
								<TR>
									<TH>Product Name</TH>
								</TR>
								<%
								try {

									String Date1st = request.getParameter("date1");
									Date Date1 = Date.valueOf(Date1st);

									String Date2nd = request.getParameter("date2");
									Date Date2 = Date.valueOf(Date2nd);

									Connection con = ConnectionUtility.getconnection();

									//String StrQuery1="truncate table scandate2";
									//Statement stmt1=con.createStatement();
									//stmt1.executeUpdate(StrQuery1);

									//String StrQuery2="INSERT INTO scandate2 SELECT * FROM scandate1 WHERE prodate='"+Date2+"'";
									//Statement stmt2=con.createStatement();
									//stmt2.executeUpdate(StrQuery2);

									Statement stmt3 = con.createStatement();
									String StrQuery3 = "SELECT  name FROM scandate1 where prodate='" + Date1
									+ "' Except SELECT  name FROM scandate1 where prodate='" + Date2 + "'";
									ResultSet rs = stmt3.executeQuery(StrQuery3);

									while (rs.next()) {
								%>
								<TR>
									<td><%=rs.getString(1)%></td>


								</TR>

								<%
								}

								} catch (Exception e) {
								e.printStackTrace();
								}
								%>


							</table>


							<div class="p-t-15">
								<button class="btn btn--radius-2 btn--blue" type="submit">Back</button>
							</div>


							<BR> <BR>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Jquery JS-->


</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>
<!-- end document-->