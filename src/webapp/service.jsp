<%
class fire{
//	String name = (String)request.getParameter("naam");
//	String channel = (String)request.getParameter("channel");

	String naam;
	String channel;
	String email ;
	String wdgt1 ;
	String phnum;
	
	fire(){
	HttpSession s = request.getSession(false);
	if(s!=null && s.getAttribute("phnum")!=null){
		naam=(String)s.getAttribute("naam");
		phnum=(String)s.getAttribute("phunm");
		channel=(String)s.getAttribute("channel");
		email=(String)s.getAttribute("email");
		wdgt1=(String)s.getAttribute("wdgt1");
		System.out.print(channel);
	}
	}
}

fire f= new fire();
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="styleService.css" >
<meta charset="ISO-8859-1">
<title>Services</title>
</head>
<body>



<div id="header"></div>


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