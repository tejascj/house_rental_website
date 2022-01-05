<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.*	"%>
<%
	
if(request.getParameter("submit")!=null) //check register button click event not null
{
	String id=request.getParameter("id");
	String address = request.getParameter("address");
	String category = request.getParameter("category");
	String bedrooms = request.getParameter("bedrooms");
	String price = request.getParameter("price");
	String phno = request.getParameter("phno");

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/activity2", "root", "tejas");
		Statement st=con.createStatement();
		st.executeUpdate("update houses set address='"+address+"',category='"+category+"',bedrooms='"+bedrooms+"',price='"+price+"',phno='"+phno+"' where id='"+id+"'");
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
			ResultSet rs=st.executeQuery("select * from houses where id='"+id+"'");
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
								<input type="text" name="address" value="<%=rs.getString(3) %>" required>
							</div>
							<div class="input-box">
								<label>Category</label> <select id="category"
									name="category" required>
									<option value="Independent House">Independent House</option>
									<option value="Flat">flat</option>
								</select>
							</div>
							<div class="input-box">
							<label>Bedrooms:</label>
								<select id="bedrooms"
									name="bedrooms">
									<option value="1BHK">1BHK</option>
									<option value="2BHK">2BHK</option>
								</select>
							</div>
							<div class="input-box">
							<label>Price/month:</label>
								<input type="text" placeholder="Enter price" name="price" value="<%=rs.getString(10)%>"
									required>
							</div>
							<div class="input-box">
							<label>Contact no:</label>
								<input type="text" placeholder="Contact no" name="phno" value="<%=rs.getString(6)%>"
									required>
							</div>
		
							<div class="button input-box">Save
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