<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="MyPackage.*"  %>
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
<link rel="stylesheet" type="text/css" href="styleDashboard.css" >
<meta charset="ISO-8859-1">
<title>Dashboard</title>
</head>
<body>


<%
String graph1 = "<iframe width='450' height='260' style='border: 5px solid #cccccc; border-radius:35px;' src='https://thingspeak.com/channels/"+user.getChannelId()+"/widgets/878742'></iframe>";
String graph2 = "<iframe width='450' height='260' style='border: 5px solid #cccccc;border-radius:35px;' src='https://thingspeak.com/channels/"+user.getChannelId()+"/charts/3?bgcolor=%23ffffff&color=%23d62020&dynamic=true&results=40&type=line&update=15&title=Air+Quality&type=line&xaxis=Time&yaxis=PPM'></iframe>";
String graph3 = "<iframe width='450' height='260' style='border: 5px solid #cccccc;border-radius:35px;' src='https://thingspeak.com/channels/"+user.getChannelId()+"/charts/1?bgcolor=%23ffffff&color=%23d62020&dynamic=true&results=40&type=line&update=15&title=Temperature&type=line&xaxis=Time&yaxis=Degree'></iframe>";
String graph4 = "<iframe width='450' height='260' style='border: 5px solid #cccccc;border-radius:35px;' src='https://thingspeak.com/channels/"+user.getChannelId()+"/charts/2?bgcolor=%23ffffff&color=%23d62020&dynamic=true&results=40&type=line&update=15&title=Humidity&type=line&xaxis=Time&yaxis=Percentage'></iframe>";
String widget = "<iframe width='210' height='210' style='border: 5px solid #cccccc; border-radius:280px;' src='https://thingspeak.com/channels/"+user.getChannelId()+"/widgets/"+user.getWidget()+"'></iframe>";
%>

<div id="header"></div>

<div class="graphscontainer" >
<div class="graphscontainer" id="graphs" >
<div class="graphs" id="g1" ><%=graph1%></div>
<div class="graphs" id="g2" ><%=graph2%></div>
<div class="graphs" id="g3" ><%=graph3%></div>
<div class="graphs" id="g3" ><%=graph4%></div>
</div> 

<div class="graphscontainer" id="Alarm" >
<div class="alarm" id="" ><%=widget%></div>
</div> 
</div>
<br>

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