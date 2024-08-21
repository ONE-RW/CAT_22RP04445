<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>INSERT AN EMPLOYEE</h1>
<form action="" method="post">
<input type="text" name="name" placeholder="enter your name"><br><br>
<input type="text"  name="email" placeholder="enter your email"><br><br>
<button name="submit">insert</button>
</form>

<%
            if (request.getParameter("submit") != null) {
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
                	String sql ="INSERT INTO employee (employeename,email) VALUES (?,?)";
                	pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, employeename);
                    pstmt.setString(2, email);
                    rs = pstmt.executeQuery();
                    if(rs.next()){
                    	out.println("login successfull");
                    	response.sendRedirect("dashbord.jsp");
                    
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