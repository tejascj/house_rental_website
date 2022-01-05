<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.*	"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="styles.css">
<!-- Fontawesome CDN Link -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>	
<body>
	<nav>
		<div class="nav-content">
			<div class="logo">
				<h1>House Rental Managaement</h1>
			</div>
			<ul class="nav-links">
				<li><a href="addhouse.jsp">Add House</a></li>
				<li><a href="viewtable.jsp">View Houses</a></li>
				<li><a href="callback.jsp">Callback Requests</a></li>
				<li><a href="ownerhome.jsp"> <% out.println("" + session.getAttribute("owner"));%>
				</a></li>
				<li><a href="ownerlogout.jsp"><i
						class="fas fa-sign-out-alt"></i>Logout</a></li>
			</ul>
		</div>
	</nav>
	<div class="container-1">
		<div class="forms">
			<div class="form-content">
				<div class="login-form">
					<div class="title">All House</div><br></br>
					<%
					if(request.getAttribute("successMsg")!=null)
					{
						out.println(request.getAttribute("successMsg")); //register success message
					}
					%>
					<TABLE BORDER="1">
						<TR>
							<TH>House ID</TH>
							<TH>Address</TH>
							<TH>Category</TH>
							<TH>Bedrooms</TH>
							<TH>&#8377; Price</TH>
							<TH>Phone No</TH>
							<TH>Update</TH>
							<th>Remove</th>
						</TR>
						<%
						try {
							Class.forName("com.mysql.cj.jdbc.Driver"); //load driver
							Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/activity2", "root", "tejas");
							Statement st = con.createStatement();
							String owner = session.getAttribute("owner").toString();
							ResultSet resultset = st
							.executeQuery("select id,address,category,bedrooms,price,phno from houses where owner='" + owner + "'");
							while (resultset.next()) {
						%>
						<TR>
							<TD><%=resultset.getString(1)%></TD>
							<TD><%=resultset.getString(2)%></TD>
							<TD><%=resultset.getString(3)%></TD>
							<TD><%=resultset.getString(4)%></TD>
							<TD>&#8377; <%=resultset.getString(5)%></TD>
							<TD><%=resultset.getString(6)%></TD>
							<td><a href="houseupdate.jsp?id=<%=resultset.getString(1)%>">Update</a></td>
							<td><a href="removehouse.jsp?id=<%=resultset.getString(1)%>">Remove</a></td>
						</TR>
						<%
						}
						} catch (Exception e) 
						{
						System.out.println(e);
						}
						%>
					</TABLE>
				</div>
			</div>
		</div>
	</div>
</body>
</html>