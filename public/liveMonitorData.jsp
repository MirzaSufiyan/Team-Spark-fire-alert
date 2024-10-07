<%@ page import="java.sql.*, java.io.*" %>
<%@ page import="MyPackage.*" %>
<%@ page contentType="application/json" %>
<%
    response.setContentType("application/json");

	Database db = new Database();
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(db.getConnectionUrl());
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT time, temprature, humidity, smoke FROM sensorData");

        // Construct JSON manually
        StringBuilder json = new StringBuilder("[");
        while (rs.next()) {
            json.append("{")
                .append("\"timestamp\":\"").append(rs.getString("time")).append("\",")
                .append("\"temperature\":").append(rs.getDouble("temprature")).append(",")
                .append("\"humidity\":").append(rs.getDouble("humidity")).append(",")
                .append("\"smoke\":").append(rs.getDouble("smoke"))
                .append("},");
        }
        if (json.length() > 1) {
            json.deleteCharAt(json.length() - 1); // Remove last comma
        }
        json.append("]");

        // Output JSON
        out.print(json.toString());
        out.flush();
    } catch (Exception e) {
        e.printStackTrace();
        out.print("[]");
        out.flush();
    } finally {
        try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>
