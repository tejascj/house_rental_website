<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.*	"%>
<%
	

	Connection conn = null;
	Statement st = null;

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/activity2", "root", "tejas");
		
		if(request.getParameter("submit")!=null) //check register button click event not null
		{
			String owner = session.getAttribute("owner").toString();
			String address = request.getParameter("address");
			String category = request.getParameter("category");
			String bedrooms = request.getParameter("bedrooms");
			String price = request.getParameter("price");
			String phno = request.getParameter("phno");
			
			PreparedStatement pstmt=null;
			
			pstmt=con.prepareStatement("insert into houses(owner,address,category,bedrooms,price,phno) values(?,?,?,?,?,?)");
			pstmt.setString(1,owner);
			pstmt.setString(2,address);
			pstmt.setString(3,category);
			pstmt.setString(4,bedrooms);
			pstmt.setString(5,price);
			pstmt.setString(6,phno);
			pstmt.executeUpdate();
			request.setAttribute("successMsg","House Added");	
			con.close();
			
		}
	}catch(Exception e){
		out.println(e);
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
	<div class="container">
		<div class="forms">
			<div class="form-content">
				<div class="login-form">
					<div class="title">Add House</div>
					<form method="post">
						<div class="input-boxes">
							<div class="input-box">
							<label>Address</label>
								<input type="text" placeholder="Enter Address" name="address"
									required>
							</div>
							<div class="input-box">
								<label>Category</label> <select id="category"
									name="category">
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
								<input type="text" placeholder="Enter price" name="price"
									required>
							</div>
							<div class="input-box">
							<label>Contact no:</label>
								<input type="text" placeholder="Contact no" name="phno"
									required>
							</div>
		
							<div class="button input-box">
								<input type="submit" name="submit" value="submit">
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