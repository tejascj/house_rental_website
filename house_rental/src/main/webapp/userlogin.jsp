<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="java.sql.*,java.util.*	"%>
	<%
try
{
	Class.forName("com.mysql.cj.jdbc.Driver"); //load driver
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/activity2","root","tejas"); //create connection
	
	if(request.getParameter("submit")!=null) //check login button click event not null
	{
		String dbusername,dbpassword;
		
		String username,password;
		
		username=request.getParameter("username"); //txt_email
		password=request.getParameter("password"); //txt_password
		
		PreparedStatement pstmt=null; //create statement
		
		pstmt=con.prepareStatement("select * from userlogin where username=? AND password=?"); //sql select query 
		pstmt.setString(1,username);
		pstmt.setString(2,password);
		
		ResultSet rs=pstmt.executeQuery(); //execute query and store in resultset object rs.
		
		if(rs.next())
		{
			dbusername=rs.getString("username");
			dbpassword=rs.getString("password");
			
			if(username.equals(dbusername) && password.equals(dbpassword))
			{
				session.setAttribute("user",dbusername); //session name is login and store fetchable database email address
				response.sendRedirect("userhome.jsp"); //after login success redirect to welcome.jsp page
			}
		}
		else
		{
			request.setAttribute("errorMsg","invalid username or password"); //invalid error message for email or password wrong
		}
		
		con.close(); //close connection	
	}
	
}
catch(Exception e)
{
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
<title></title>
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
				<div class="login-form">
					<div class="title">User Login</div>
					<form method="post">
						<div class="input-boxes">
							<div class="input-box">
								<i class="fas fa-envelope"></i> <input type="text"
									placeholder="Enter your username" name="username" required>
							</div>
							<div class="input-box">
								<i class="fas fa-lock"></i> <input type="password"
									placeholder="Enter your password" name="password" required>
							</div>
							<div class="button input-box">
								<input type="submit" name="submit" value="submit">
							</div>
							<p style="color:red">				   		
					<%
					if(request.getAttribute("errorMsg")!=null)
					{
						out.println(request.getAttribute("errorMsg")); //error message for email or password 
					}
					%>
					</p>
							<a href="userreg.jsp">Don't have an account? <label>Sigup
									now</label></a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>