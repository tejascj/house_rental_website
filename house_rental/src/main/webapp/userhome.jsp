<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.*	"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="styles.css">
<!-- Fontawesome CDN Link -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
	<nav>
		<div class="nav-content">
			<div class="logo">
				<h1>House Rental Managaement</h1>
			</div>
			<ul class="nav-links">
				<li><a href="searchhouse.jsp">Search Houses</a></li>
				<li><a href="requeststatus.jsp">Request Status </a></li>
				<li><a href="userhome.jsp"> <%
 out.println("" + session.getAttribute("user"));
 %>
				</a></li>
				<li><a href="userlogout.jsp"><i class="fas fa-sign-out-alt"></i>Logout</a></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="forms">
			<div class="form-content">
				<div class="login-form">
					<div class="card" style="margin: 15px 0px; border-radius: 5px">
						<div class="header"
							style="background-color: #133c55; border-radius: 5px">
							<h2 style="color: white">
								<center>User Profile</center>
							</h2>
						</div>
						<div class="body">
							<div class="row clearfix">
								<div class="col-xs-12 col-md-12" name="perinfo"
									style="width: 100%">
									<!-- style="border-radius: 15px !important;border-collapse: unset;border:
            1px solid black;padding: 10px;" -->
									<table id="studinfo" class="table no-border"
										style="margin-left: 5%">
										<tbody>
											<%
											try {
												Class.forName("com.mysql.cj.jdbc.Driver"); //load driver
												Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/activity2", "root", "tejas");
												Statement st = con.createStatement();
												String user = session.getAttribute("user").toString();
												ResultSet resultset = st.executeQuery("select username,email,phno from userlogin where username='" + user + "'");
												while (resultset.next()) {
											%>
											<tr>
												<td width="35%"><b>Name</b></td>
												<td width="2%">:</td>
												<td width="68%"><%=resultset.getString(1)%></td>
											</tr>
											<tr>
												<td width="17%"><b>Email ID</b></td>
												<td width="2%">:</td>
												<td><%=resultset.getString(2)%></td>
											</tr>

											<tr>
												<td><b>Mobile Number</b></td>
												<td width="2%">:</td>
												<td><%=resultset.getString(3)%></td>
											</tr>
											<%
											}
											} catch (Exception e) {
											System.out.println(e);
											}
											%>
										</tbody>
									</table>
								</div>
							</div>
							<div class="row clearfix">
								<div
									class="col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12"
									id="notif"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>