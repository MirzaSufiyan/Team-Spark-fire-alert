<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="MyPackage.*"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="Stylereg.css" >
<meta charset="ISO-8859-1">
<title>Register</title>
</head>
<body>
<h1>User Registration</h1>

<div class="contain" >
<form action="userRegistrationServlet" method="post" >
<div class="Reg" >
<div class="Reg" id="RLabel" >
<div class="RLabel" id="RL1">  <div class="inp" id="n"><label>Name:</label></div>   </div>
<div class="RLabel" id="RL1">  <div class="inp" id="ph"><label>Phone Number:</label></div>   </div>
<div class="RLabel" id="RL1">   <div class="inp" id="eml"><label>Email:</label> </div>  </div>
<div class="RLabel" id="RL1">   <div class="inp" id="pass"><label>Password:</label> </div>  </div>
<div class="RLabel" id="RL1">   <div class="inp" id="chnl"><label>Channel Number: </label></div>  </div>
<div class="RLabel" id="RL1">   <div class="inp" id="wdgt"><label>Widget Number: </label> </div>   </div>
<div class="RLabel" id="RL1">   <div class="inp" id="wdgt"><label>Nearest Fire Station: </label> </div>   </div>
<div class="RLabel" id="RL1">   <div class="inp" id="wdgt"><label>Nearest Hospital: </label> </div>   </div>
<div class="RLabel" id="RL1">   <div class="inp" id="wdgt"><label>Nearest Police Station: </label> </div>   </div>

</div>
<div class="Reg"  id="Rinpput">
<div class="Rinppt" id="Rinp" ><input class="Regin" id="ipt" type="text" id="naam" name="naam" required> <hr> </div>
<div class="Rinppt" id="Rinp" ><input class="Regin" id="ipt" type="text" id="phnum" name="phnum" required > <hr> </div>
<div class="Rinppt" id="Rinp" ><input class="Regin" id="ipt" type="text" id="email" name="email" required > <hr> </div>
<div class="Rinppt" id="Rinp" > <input class="Regin" id="ipt" type="password" id="password" name="password" required ><hr> </div>
<div class="Rinppt" id="Rinp" ><input class="Regin" id="ipt" type="text" id="channel" name="channel" required > <hr> </div>
<div class="Rinppt" id="Rinp" > <input class="Regin" id="ipt"  type="text" id="wdgt1" name="wdgt1" required   ><hr> </div>

<%
Database db = new Database();
List<Map<String, String>> fireStations = new ArrayList<>();
List<Map<String, String>> hospitals = new ArrayList<>();
List<Map<String, String>> policeStations = new ArrayList<>();

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(db.getConnectionUrl());
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("select * from fireStationList");
    while (rs.next()) {
    	Map<String, String> station = new HashMap<>();
        station.put("name", rs.getString("nameOfStation"));
        station.put("area", rs.getString("area"));
        fireStations.add(station);

    }
    rs.close();

    rs = stmt.executeQuery("select * from hospitalList");
    while (rs.next()) {
        Map<String, String> hospital = new HashMap<>();
        hospital.put("name", rs.getString("nameOfHospital"));
        hospital.put("area", rs.getString("area"));
        hospitals.add(hospital);
    }
    rs.close();

    rs = stmt.executeQuery("select * from policeStationList");
    while (rs.next()) {
    	Map<String, String> station = new HashMap<>();
        station.put("name", rs.getString("nameOfStation"));
        station.put("area", rs.getString("area"));
        policeStations.add(station);
    }
    rs.close();

    conn.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>

<div class="selectBox">
    <input type="text" class="search-box" placeholder="Select your fire station" required name="nearestFireStation">
    <input type="hidden" name="nearestFireStationArea" id="nearestFireStationArea">
    <ul class="options">
        <% for(Map<String, String> fstation : fireStations) { %>
            <li data-value="<%= fstation.get("area") %>"><%= fstation.get("name") %></li>
        <% 
        System.out.println(fstation.get("name")+" : "+fstation.get("area"));
        } 
        %>
    </ul>
    <hr>
    <div class="error-message">Select a valid input</div>
</div>

<div class="selectBox">
    <input type="text" class="search-box" placeholder="Select your hospital" required name="nearestHospital">
    <input type="hidden" name="nearestHospitalArea" id="nearestHospitalArea">
    <ul class="options">
        <% for(Map<String, String> hospital : hospitals) { %>
            <li data-value="<%= hospital.get("area") %>"><%= hospital.get("name") %></li>
        <% } %>
    </ul>
    <hr>
    <div class="error-message">Select a valid input</div>
</div>

<div class="selectBox">
    <input type="text" class="search-box" placeholder="Select your police station" required name="nearestPoliceStation">
    <input type="hidden" name="nearestPoliceStationArea" id="nearestPoliceStationArea">
    <ul class="options">
        <% for(Map<String, String> station : policeStations) { %>
            <li data-value="<%= station.get("area") %>"><%= station.get("name") %></li>
        <% } %>
    </ul>
    <hr>
    <div class="error-message">Select a valid input</div>
</div>

</div>
</div>
<button type="submit" class="Reg" id="Regbtn">Register Now </button>
</form>
</div>

<script src="scriptfordropdown.js" > </script>
</body>
</html>
