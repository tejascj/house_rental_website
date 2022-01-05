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
				<li><a href="userlogout.jsp"><i
						class="fas fa-sign-out-alt"></i>Logout</a></li>
			</ul>
		</div>
	</nav>
	<div class="container-1">
		<div class="forms">
			<div class="form-content">
				<div class="login-form">
					<div class="title">All Houses</div><br></br>
					<%
					if(request.getAttribute("successMsg")!=null)
					{
						out.println(request.getAttribute("successMsg")); //register success message
					}
					%>
					<TABLE BORDER="1">
						<TR>
							<TH>House ID</TH>
							<th>Owner</th>
							<TH>Address</TH>
							<TH>Category</TH>
							<TH>Bedrooms</TH>
							<TH>&#8377; Price</TH>
							<TH>Phone No</TH>
							<TH>Status</TH>
						</TR>
						<%
						String user=session.getAttribute("user").toString();
						try {
							Class.forName("com.mysql.cj.jdbc.Driver"); //load driver
							Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/activity2", "root", "tejas");
							Statement st = con.createStatement();
							ResultSet resultset = st
							.executeQuery("select id,owner,address,category,bedrooms,price,phno,status from houses where user_interested='"+user+"' and status!='Available'");
							while (resultset.next()) {
						%>
						<TR>
							<TD><%=resultset.getString(1)%></TD>
							<TD><%=resultset.getString(2)%></TD>
							<TD><%=resultset.getString(3)%></TD>
							<TD><%=resultset.getString(4)%></TD>
							<TD><%=resultset.getString(5)%></TD>
							<TD>&#8377; <%=resultset.getString(6)%></TD>
							<TD><%=resultset.getString(7)%></TD>
							<td><%=resultset.getString(8)%></td>
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