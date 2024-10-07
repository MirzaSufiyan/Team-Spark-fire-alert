<?php
$servername = "firedatabase-firealert-123.i.aivencloud.com";
$username = "avnadmin";
$password = "AVNS_wSv1hVWfSENqlyt440h";
$dbname = "defaultdb";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT timestamp, temperature, humidity, smoke FROM sensor_data";
$result = $conn->query($sql);

$data = array();

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
}

$conn->close();

echo json_encode($data);
?>