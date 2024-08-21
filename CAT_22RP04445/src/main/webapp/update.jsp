<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Update employee</h1>
<%
String url="jdbc.mysql://localhost:3306/emp_22rp04445";
String user ="root";
String pass ="";
Connection conn = null;
PreparedStatement pstmt = null;
String id= request.getParameter("id");
try{
	Class.forName("com.mysql.cj.jdbc.Drver");
	conn =Drivermanager.getconnection(url,user,pass);
	String sql ="INSERT INTO employee (employeename,email) VALUES (?,?)";
	pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, employeename);
    pstmt.setString(2, email);
    rs = pstmt.executeQuery();
    if(rs.next()){
    	currentName = rs.getString("employeename");
    	currentEmail = rs.getString("email");
    }

%>
<form action="">
<label for="name">current name</label>
<input type="text" name="name" <%= curreName %> required><br><br>
<label for="email"></label>
<input type="text" name="email" <%= currentEmail %> required><br><br>
<button name="update">Update</button>
</form>
</body>
</html>