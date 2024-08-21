<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String url="jdbc.mysql://localhost:3306/emp_22rp04445";
String user ="root";
String pass ="";
Connection conn = null;
PreparedStatement pstmt = null;
String id = request.getParameter("id");
String message ="";
if(id !=null){
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		String sql ="DELETE FROM employee where id=?";
		 pstmt = conn.prepareStatement(sql);
		 pstmt.setString(1,id);
		 int rowsAffected = pstmt.executeUpdate();
		 if(rowAffected > 0){
			 message="employee deleted successfull";
			 
		 }else{
			 message="employee not found";
		 }
	}catch (Exception e){
		message="error" +e.getMessage();
	}finally{
		try{
			if(pstmt !=null) pstmt.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}

%>

</body>
</html>