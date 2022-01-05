<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.*	"%>
<%
	
if(request.getParameter("submit")!=null) //check register button click event not null
{
	String id=request.getParameter("id");
	String status=request.getParameter("status");
	

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/activity2", "root", "tejas");
		Statement st=con.createStatement();
		st.executeUpdate("update houses set status='"+status+"' where id='"+id+"'");
		request.setAttribute("successMsg","House Details Updated");	
		con.close();
}catch(Exception e){
	out.println(e);
}
}
%>
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
	<%
	String id=request.getParameter("id");
	try
	{
			Class.forName("com.mysql.cj.jdbc.Driver"); //load driver
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/activity2","root","tejas"); //create connection
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select address,user_interested,user_no from houses where id='"+id+"'");
			while(rs.next())
			{
	
	%>
	<div class="container">
		<div class="forms">
			<div class="form-content">
				<div class="login-form">
					<div class="title">Update House</div>
					<form method="post">
					<input type="hidden" name="id" value="<%out.println(id);%>">
						<div class="input-boxes">
							<div class="input-box">
							<label>Address</label>
								<input type="text" name="address" value="<%=rs.getString(1) %>" disabled>
							</div>
							<div class="input-box">
							<label>Interested User</label>
								<input type="text" name="user_interested" value="<%=rs.getString(2) %>" disabled>
							</div>
							<div class="input-box">
							<label>User Phone No</label>
								<input type="text" name="user_no" value="<%=rs.getString(3) %>" disabled>
							</div>
							<div class="input-box">
								<label>Status</label> <select id="status"
									name="status" required>
									<option value="Available">Available</option>
									<option value="Booked">Booked</option>
								</select>
							</div>

							
							<div class="button input-box">
								<input type="submit" name="submit" value="Save">
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
	<%
			}
	}catch(Exception e)
	{
	System.out.println(e);	
	}
	%>
</body>
</html>