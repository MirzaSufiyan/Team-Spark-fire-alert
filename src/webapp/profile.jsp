<%@ page import="MyPackage.*" %>

<%
HttpSession s = request.getSession(false);

String phonenum=null;
	if(s!= null && s.getAttribute("phnum")!= null){
		 phonenum= (String)s.getAttribute("phnum");
	}
	User user =new User(phonenum);
%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="styleProfile.css" >
<meta charset="ISO-8859-1">
<title>Profile</title>
</head>
<body>

<div id="header"></div>
<div class="profileContainer">

<div class="profileContainer" id="userData"> <p>Name: <%=user.getName()%>   </p> </div> 
<div class="profileContainer" id="userData"> <p>Email: <%=user.getEmail()%>   </p> </div> 
<div class="profileContainer" id="userData"> <p>Phone Number: <%=user.getPhoneNumber()%>   </p> </div> 
<div class="profileContainer" id="userData"> <p>Channel Id: <%=user.getChannelId()%>   </p> </div> 
<div class="profileContainer" id="userData"> <p>Nearest Fire Station: <%=user.getNearestFireStation()%>   </p> </div> 
<div class="profileContainer" id="userData"> <p>Nearest Police Station: <%=user.getNearestPoliceStation()%>   </p> </div> 
<div class="profileContainer" id="userData"> <p>Nearest Hospital: <%=user.getNearestHospital()%>   </p> </div> 

</div>


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