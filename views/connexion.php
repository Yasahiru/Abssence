
<?php
$host = "localhost";
$database = "absence";
$user = "root";
$pwd = "";
try {
    $con = new PDO("mysql:host=$host;dbname=$database",$user,$pwd);
    echo "<script>alert('conected')</script>";
} catch (PDOException $e) {
    echo "Errur :".$e->getMessage();
}
?>
