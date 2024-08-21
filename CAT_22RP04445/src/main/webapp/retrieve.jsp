<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<button>GO TO HOME</button>
<form action="" method="post">
<input type="text" name="employeename" placeholder="enter the name of employee" required><%!  %>
<button type="submit">search</button>
<table>
<tr>
<th>employee id</th>
<th>name</th>
<th>email</th>
</tr>
<% 
String url= "jdbc:mysql://localhost:3306/emp_22rp0445";
String user= "root";
String pass="";
String emplyeename =request.getParameter ("employeename");

Connection conn = null;
PreparedStatement pstmt =null;
ResultSet rs =null;
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, pass);
	String sql;
	if(employeename !=null && !employeename.isEmpty()){
		sql= "SELECT * FROM employee WHERE employeename =?";
		pstmt =conn.prepareStatement(sql);
		pstmt.setString(1,employeename);
				
	}else{
		sql="SELECT ALL FROM employee";
		pstmt=conn.prepareStatement(sql);
		rs= pstmt.executeQuery();
		while (rs.next()){
			int id=rs.getId("id");
			String name=rs.getString("employeename");
			String name=rs.getString("email");
		}
	}
	

%>

<tr>
<td>id</td>
<td>name</td>
<td>email</td>
</tr>
<%

}catch ( Exception e){
	e.printStackTrace();
} finally {
	try{
		if (rs != null) rs.close();
		if( pstmt!= null) pstmt.close();
		if( conn != null)conn.close();
		
	} catch (SQLException e){
		e.printStackTrace();
	}
}

%>
</table>
</form>
</body>
</html>