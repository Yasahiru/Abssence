<?php
include "connexion.php";
if (!empty($_GET["id"])) {
    $query= "DELETE FROM responsable_du_bus_scolaire WHERE ID_chauffeur=:id";
    $objstmt=$con->prepare($query);
    $objstmt->execute([":id"=>$_GET["id"]]);
    $objstmt->closeCursor();
    header("location:../controlers/managementDrivers.php");
}
?>