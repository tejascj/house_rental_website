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
			String username = request.getParameter("username");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String phno = request.getParameter("phno");
			
			PreparedStatement pstmt=null;
			
			pstmt=con.prepareStatement("insert into ownerlogin(username,email,password,phno) values(?,?,?,?)");
			pstmt.setString(1,username);
			pstmt.setString(2,email);
			pstmt.setString(3,password);
			pstmt.setString(4,phno);
			pstmt.executeUpdate();
			request.setAttribute("successMsg","Registeration successful...!Please Login");	
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

				<li><a href="ownerlogin.jsp">Owner</a></li>
				<li><a href="userlogin.jsp">User</a></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<input type="checkbox" id="flip">
		<div class="forms">
			<div class="form-content">
				<div class="signup-form">
					<div class="title">Owner Registration</div>
					<form method="post">
						<div class="input-boxes">
							<div class="input-box">
								<i class="fas fa-user"></i> <input type="text"
									placeholder="Enter username" name="username" required>
							</div>
							<div class="input-box">
								<i class="fas fa-envelope"></i> <input type="text"
									placeholder="Enter your email" name="email" required>
							</div>
							<div class="input-box">
								<i class="fas fa-lock"></i> <input type="password"
									placeholder="Enter your password" name="password" required>
							</div>
							<div class="input-box">
								<i class="fas fa-mobile"></i> <input type="text"
									placeholder="Enter your Phone Number" name="phno" required>
							</div>
							<div class="button input-box">
								<input type="submit" value="Sumbit" name="submit">
							</div>
<p style="color:green">				   		
					<%
					if(request.getAttribute("successMsg")!=null)
					{
						out.println(request.getAttribute("successMsg")); //register success message
					}
					%>
					</p>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>

</html>