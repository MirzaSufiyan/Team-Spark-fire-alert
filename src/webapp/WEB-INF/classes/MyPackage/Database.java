package MyPackage;
public class Database {


	private String databaseHost = "firedatabase-firealert-123.i.aivencloud.com";
	@SuppressWarnings("unused")
	private String databaseUserName = "avnadmin";
	private String databasePassword= "AVNS_wSv1hVWfSENqlyt440h";
	private String databaseName= "defaultdb";
	private String databasePort= "27613";

	
public String getConnectionUrl() {
	String url = "jdbc:mysql://ts-fire-alert-database-firealert-123.i.aivencloud.com:27613/defaultdb?user=avnadmin&password=AVNS_Sbg6Z4tySpyt_5XmmHL&sslMode=REQUIRED";
	return url;
}
	
}


