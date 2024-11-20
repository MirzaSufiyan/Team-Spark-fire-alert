<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="MyPackage.*" %>

<%
HttpSession s = request.getSession(false);

String phonenum=null;
	if(s!= null && s.getAttribute("phnum")!= null){
		 phonenum= (String)s.getAttribute("phnum");
	}
	User user =new User(phonenum);
%>


<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="styleHeader.css">
    <meta charset="ISO-8859-1">
    <title></title>
</head>
<body>
<div class="uppercontent">
    <div class="userdetail">
        <div class="userdetail" id="userinfo">
            <div class="userinfo" id="username"><h1>Hello, <%=user.getName()%> !</h1></div>
            <div class="userinfo" id="useremail"><p><%= user.getEmail() %></p></div>
            <div class="userinfo" id="userohnum"><p><%=user.getPhoneNumber() %></p></div>
        </div>
        <div id="header"></div>
        <div class="userdetail" id="logout">
            <div class="logout" id=""><a href="index.jsp"><button>Log Out</button></a></div>
        </div>
    </div>
    <nav class="nav">
        <ul class="nav-links">
            <li><a href="profile.jsp">Profile</a></li>
            <li><a href="dashboard.jsp">Dashboard</a></li>
            <li class="dropdown">
                <a href="#" class="dropbtn">Services</a>
                <div class="dropdown-content">
                    <a href="serviceHospital.jsp">Hospitals</a>
                    <a href="serviceFireBrigade.jsp">Fire Brigade</a>
                    <a href="servicePoliceStation.jsp">Police Station</a>
                </div>
            </li>
            <li class="forward"><a href="#">About Us</a></li>
        </ul>
    </nav>
</div>
</body>
</html>
