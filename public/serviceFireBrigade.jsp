<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="styleService.css" >
<meta charset="ISO-8859-1">
<title>Services</title>
</head>
<body>



<div id="header"></div>




<div style="width: 100%"><iframe width="100%" height="600" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?width=100%25&amp;height=600&amp;hl=en&amp;q=+(fire%20station%20near%20me)&amp;t=p&amp;z=14&amp;ie=UTF8&amp;iwloc=B&amp;output=embed"></iframe></div>


<div id="footer"></div>
</body>
<script src="callinallpage.js"></script>
<script> 
$(function(){
$("#footer").load("footer.html");
$("#header").load("header.jsp");
});
</script>
</html>