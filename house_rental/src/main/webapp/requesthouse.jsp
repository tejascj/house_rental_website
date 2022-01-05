<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.*	"%>
<%
	
if(request.getParameter("submit")!=null) //check register button click event not null
{
	String id=request.getParameter("id");
	String user_interested = request.getParameter("user_interested");
	String user_no = request.getParameter("user_no");
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/activity2", "root", "tejas");
		Statement st=con.createStatement();
		st.executeUpdate("update houses set user_interested='"+user_interested+"', user_no='"+user_no+"', status='Callback pending' where id='"+id+"'");
		request.setAttribute("successMsg","Callback Requested...Owner will contact you");	
		con.close();
}catch(Exception e){
	out.println(e);
}
}
%>
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
					<div class="title">Request Callback</div>
					<form method="post">
						<div class="input-boxes">
							<div class="input-box">
								<label>Name:</label> <input type="text" name="user_interested" placeholder="Enter Your Name"  required>
							</div>
							<div class="input-box">
								<label>Phone No:</label> <input type="text" name="user_no"
									placeholder="Enter Your Number"  required>
							</div>
							<div class="button input-box">Save
								<input type="submit" name="submit" value="Request">
							</div>
							<p style="color:green">				   		
					<%
					if(request.getAttribute("successMsg")!=null)
					{
						out.println(request.getAttribute("successMsg")); //register success message
					}
					%>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>