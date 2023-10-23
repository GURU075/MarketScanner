<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Scann.ConnectionUtility"%>
<%@page import="java.sql.Date"%>
<%@page import="java.time.LocalDate"%>
<html lang="en">

<head>


<!-- <Script>
$(function() {
    $(".productid").keyup(function () {
        if (this.value.length == this.maxLength) {
          $(this).next('.product').focus();
        }
    });
});
    </Script> -->
    
    
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
					<h2 class="title">List Of Products</h2>
					<form method="get"
						action="http://localhost:8081/MaketScanner/DataInsert">
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">

                                    <label class="label">Product ID</label>
                                    <input class="input--style-4" id="productid" name="productid" value="<%=request.getParameter("aid")%>">
                                </div>
                            </div>
<!-- <Script>
var input = document.getElementById("productid");
input.addEventListener("keypress", function(event) {
  if (event.key === "Enter") {
	  window.location.replace("http://localhost:8081/MaketScanner/DataCheck/MaintanincePage.jsp?aid=");
   // event.preventDefault();
   // document.getElementById("myBtn").click();
  }
});
</Script> -->
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Product Name</label>
                                    <input class="input--style-4" type="text" id="productName" name="productName" autofocus>
                                </div>
                            </div>
						</div>

							<div class="p-t-15">
								<a href="#"><button class="btn btn--radius-2 btn--blue" type="submit">Enter</button></a>
							</div>
							
							
						<CENTER>

							<BR>
							<BR>
							<TABLE border="1">
								<TR>
									<TH>Product ID</TH>
									<TH>Product Name</TH>
									<TH>Product Date</TH>
									<TH>Edit</TH>
									<TH>Delete</TH>
								</TR>
								<%
								LocalDate CurrentDate = java.time.LocalDate.now();
								Date Date1 = Date.valueOf(CurrentDate);
								
								try {
									Connection con = ConnectionUtility.getconnection();
									Statement stmt3 = con.createStatement();
									String StrQuery3 = "select * from scandate1 where prodate='"+Date1+"'";
									ResultSet rs = stmt3.executeQuery(StrQuery3);

									while (rs.next()) {
								%>
								<TR>
									<td><%=rs.getString(1)%></td>
									<td><%=rs.getString(2)%></td>
									<td><%=rs.getDate(3)%></td>
								    <td> <a href="EditProduct.jsp?id=<%=rs.getString(1)%>&date=<%=rs.getDate(3)%>"> Edit</a> </td>
								    <td> <a href="DeleteProduct.jsp?id=<%=rs.getString(1)%>&date=<%=rs.getDate(3)%>"> Delete</a> </td>
								</TR>

								


							
						<%
								}

								} catch (Exception e) {
								e.printStackTrace();
								}
								%>
								</table>
							</form>

							<div class="p-t-15">
								<a href="http://localhost:8081/MaketScanner/DataCheck/DateCheck.jsp"><button class="btn btn--radius-2 btn--blue" type="button">Check</button></a>
							</div>


							<BR>
							<BR>
				</div>
			</div>
		</div>
	</div>

	<!-- Jquery JS-->


</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>
<!-- end document-->