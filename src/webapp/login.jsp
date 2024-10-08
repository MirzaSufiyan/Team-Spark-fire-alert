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
<h1>Login </h1>
<div class="contain" >
<form action=login method="post" class="log">
	<label></label> <br><input class="log" id="ipt" type="text" id="phnum" name="phnum" required placeholder="Phone number" ><br>
	<label></label><br> <input  class="log" id="ipt"type="password" id="password" name="password" required placeholder="Password"><br>

	<button type="submit" class="log" id="logbtn" >Login </button>
</form>
</div>
</body>
</html>