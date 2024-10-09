<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="Stylelogin.css" >
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
<h1>Welcome to Fire alert system</h1>
<div class="contain" >
<form action=/login.java method="post" class="log">
<div class="inp1">
	<div class="inp1" id="ph"><label>Phone Number: </label></div><div class="inp" id="ph"><input class="log" id="ipt" type="text" id="phnum" name="phnum" required placeholder="" ><hr></div></div>
<div class="inp2">
	<div class="inp2" id="ps"><label>Password:</label></div><div class="inp" id="ps"><input  class="log" id="ipt"type="password" id="password" name="password" required placeholder=""><hr></div>
</div>
	<button type="submit" class="log" id="logbtn" >Login </button>
		
</form>
		<p>New User?
		<a href=register.jsp>Register now</a>
		</p>
</div>



</body>
</html>
