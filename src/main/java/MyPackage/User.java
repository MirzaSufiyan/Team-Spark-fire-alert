package MyPackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class User {
	private String name = null;
    private String email = null;
    private String channel = null;
    private String wdgt1 = null;
    private String password = null;
    private String phoneNumber =null ; 
    private String nearestFireStation =null ; 
    private String nearestPoilceStation =null ; 
    private String nearestHospital=null ; 
    
    public User(String phoneNumber){
    	try {
    		Database db = new Database();
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		Connection c = DriverManager.getConnection(db.getConnectionUrl());
    		System.out.print("connected");
    		PreparedStatement s = c.prepareStatement("select * from userdata where phnum=?;");
    		s.setString(1,phoneNumber);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                this.password = rs.getString("password");
                 this.name = rs.getString("naam");
                this.email = rs.getString("email");
                this.channel = rs.getString("channelid");
                this.wdgt1 = rs.getString("widget1");
                this.phoneNumber= rs.getString("phnum");
                this.nearestFireStation = rs.getString("nearestFireStation");
                this.nearestHospital= rs.getString("nearestHospital");
                this.nearestPoilceStation= rs.getString("nearestPoliceStation");
            }
            c.close();		
    	}
    	catch(Exception e) {
    	}
    	
    }
    
    
public boolean validateUser(String phnum,String pass) {
    try {
		Database db = new Database();
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection c = DriverManager.getConnection(db.getConnectionUrl());
		System.out.print("connected");
		PreparedStatement s = c.prepareStatement("select * from userdata where phnum=?;");
		s.setString(1,phnum);
        ResultSet rs = s.executeQuery();
        while (rs.next()) {
            this.password = rs.getString("password");
             this.name = rs.getString("naam");
            this.email = rs.getString("email");
            this.channel = rs.getString("channelid");
            this.wdgt1 = rs.getString("widget1");
        }
        c.close();
		if(password.equals(pass)) {
			return true;
		}
		else {
			return false;
		}
		
		
	}
	catch(Exception e) {
		return false;
	}
    
    
}
    
public String getName() {
	return name;
}
public String getPhoneNumber() {
	return phoneNumber;
}
public String getEmail() {
	return email;
}
public String getChannelId() {
	return channel;
}
public String getWidget() {
	return wdgt1;
}
public String getNearestFireStation() {
	return nearestFireStation;
}
public String getNearestPoliceStation() {
	return nearestPoilceStation;
}
public String getNearestHospital() {
	return nearestHospital;
}
    
    
    
    
    
    
    

}
