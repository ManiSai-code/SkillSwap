<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action ="RegisterServlet" method="post">
<input type="text" name ="username" placeholder="enter your name"><br>
<input type="text" name ="useremail" placeholder="enter your mail"><br>
<input type ="text" name="userpassword" placeholder="enter password"><br>
<Button type ="submit">Submit</Button>
<a href="login.jsp">LogIn</a>
</form>
</body>
</html>