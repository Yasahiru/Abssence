<?php
include "connexion.php";
if (!empty($_GET["id"])) {
    $query= "DELETE FROM etudient WHERE ID_étudient=:id";
    $objstmt=$con->prepare($query);
    $objstmt->execute([":id"=>$_GET["id"]]);
    $objstmt->closeCursor();
    header("location:../controlers/managementStudent.php");
}
?>