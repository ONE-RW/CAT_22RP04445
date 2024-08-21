<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Signup</title>
</head>
<body>
<form method="post">
name<br>
<input type="text" name="name" required><br><br>
email<br>
<input type="text" name="email" required><br><br>
Password<br>
<input type="password" name="password" requird><br><br>
<button name="submit">Signup</button>
</form>
<div>
 <%
            if (request.getParameter("submit") != null) {
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String url="jdbc.:mysql://localhost:3306/emp_22rp04445";
                String user="root";
                String pass ="";
                Connection conn = null;
                PreparedStatement pstmt =null;
 try {

                    Class.forName("com.mysql.cj.jdbc.Driver");
                    
                    conn = DriverManager.getConnection(url, user, pass);
                    String sql = "INSERT INTO user(name,email,password)VALUES(?,?,?)";
                    pstmt= conn.preparedStatement(sql);
                    pstmt.setString(1,name);
                    pstmt.setString(2,email);
                    pstmt.setString(3,password);
                    pstmt.executeUpdate();
                    out.println("<h2>Signup successfull</h2>");
                    response.sendRedirect("login.jsp");
 }catch ( Exception e){
	 out.println("error"+e.getMessage());
 }finally{
	 if(pstmt !=null) try{pstmt.close();} catch (Exception e){}
	 if (conn !=null) try{conn.close();}catch(Exception e){}
 }
	 
 }
  %>
</div>

</body>
</html>