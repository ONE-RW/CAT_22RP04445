<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
<h1>EMPLOYEE MANAGEMENT</h1>
<form method="post" action="dashboard">
<h1>signin</h1>
Email<br>
<input type="text" name="email" required><br><br>
Password<br>
<input type="password" name="passwrd" requird><br><br>
<input type="submit" name="login"><br>
<p> I don't have an account <a href="signup.jsp">SignUp</a></p>

</form>
 <%
            if (request.getParameter("login") != null) {
                String email = request.getParameter("email");
                String password = request.getParameter("password");

                String url = "jdbc:mysql://localhost:3306/emp_22rp04445";
                String user = "root"; 
                String pass = "";

                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                
                try{
                	Class.forName("com.mysql.cj.jdbc.Drver");
                	conn =Drivermanager.getconnection(url,user,pass);
                	String sql ="SELECT * FROM user WHERE email=? AND password=?";
                	pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, email);
                    pstmt.setString(2, password);
                    rs = pstmt.executeQuery();
                    if(rs.next()){
                    	out.println("login successfull");
                    	response.sendRedirect("dashbord.jsp");
                    }else{
                    	out.println("<h2>invalid email or password<h2>");
                    } catch (Exception e){
                    	out.printl("error" + e.getmessage);
                    }finally{
                    	if(rs !=null) try{rs.close();} catch(SQLException e){}
                    	if(psmt !=null) try{psmt.close();}catch(SQLException e){}
                    	if(conn !=null) try{conn.close();}catch (SQLException e){}
                    }
                }
 %>               
</body>
</html>