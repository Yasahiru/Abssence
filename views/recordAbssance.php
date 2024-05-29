<?php
require "connexion.php";
session_start();
$count=0;
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>المركب التربوي الأمين</title>
    <link rel="stylesheet" href="../views/css/bootstrap.min.css">
    <link rel="stylesheet" href="../views/css/styles.css" >
    <link rel="website icon" type="png" href="../views/csslogin/305219633_540712911186499_9137420916457086341_n.jpg">
    

    <link
      href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="https://cdn.datatables.net/2.0.6/css/dataTables.dataTables.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/2.0.6/js/dataTables.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#myTable_test').DataTable({
            "aLengthMenu": [
            [5, 10, 25, -1],
            [5, 10, 25, "All"]
        ],
        "iDisplayLength": 10,

        "language": {
            "sProcessing": "جارٍ التحميل...",
            "sLengthMenu": "أظهر _MENU_ مدخلات",
            "sZeroRecords": "لم يعثر على أية سجلات",
            "sInfo": "إظهار _START_ إلى _END_ من أصل _TOTAL_ مدخل",
            "sInfoEmpty": "يعرض 0 إلى 0 من أصل 0 سجل",
            "sInfoFiltered": "(منتقاة من مجموع _MAX_ مُدخل)",
            "sInfoPostFix": "",
            "sSearch": "ابحث:",
            "sUrl": "",
            "oPaginate": {
                "sFirst": "الأول",
                "sPrevious": "السابق",
                "sNext": "التالي",
                "sLast": "الأخير"
            }
        }
        });
        
    });
</script>
  </head>
  <body>



    <section class="sidebar">
      <div class="nav-header">
        <p class="logo">المركب التربوي الأمين<br><span>مصلحة النقل المدرسي</span> </p>
        <i class="bx bx-menu btn-menu"></i>
      </div>
      <ul class="nav-links">
        <li>
          <a href="../controlers/authentification.php">
            <i class='bx bx-log-in'></i>
            <span class="title">تسجيل الخروج</span>
          </a>
          <span class="tooltip">تسجيل الخروج</span>
        </li>
      </ul>
      <div class="theme-wrapper">
        <i class="bx bxs-moon theme-icon"></i>
        <p>الوضع المظلم</p>
        <div class="theme-btn">
          <span class="theme-ball"></span>
        </div>
      </div>
    </section>




    <section class="home">
      <header style="background-image: url('../views/css/Untitled\ design\ \(1\).png');">

        <img src="../views/css/305219633_540712911186499_9137420916457086341_n.jpg" alt="">
        <h1>مصلحة النقل</h1>
  
  </header><br>
       <div class="container">
        <span style="float:right; font-size: 50px; font-weight: 600;">الغياب</span>
        <form method="post" action="../controlers/managementSave.php">
            <button type="button" class="button"  name="add">
              <span class="button__text">تسجيل الغياب</span>
              <span class="button__icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" viewBox="0 0 24 24" stroke-width="2" stroke-linejoin="round" stroke-linecap="round" stroke="currentColor" height="24" fill="none" class="svg"><line y2="19" y1="5" x2="12" x1="12"></line><line y2="12" y1="12" x2="19" x1="5"></line></svg></span>
            </button>
        
        <br>
        <table id="myTable_test" class="display " style="color: var(--text-color);">
          <thead>
              <tr>
                  <th>ID</th>
                  <th>اسم التلميذ</th>
                  <th>المستوى الدراسي</th>
                  <th>رقم الحافلة</th>
                  <?php
                  if($_POST['Period'] == 'Entrée_matin'){
                        echo"<th>الدخول الصباحي</th>";
                    }elseif($_POST['Period'] == 'Sortie_matin'){
                        echo"<th>الخروج الصباحي</th>";
                    }elseif($_POST['Period'] == 'Entrée_soir'){
                        echo"<th>الدخول المسائي</th>";
                    }elseif($_POST['Period'] == 'Sortie_soir'){
                        echo"<th>الخروج المسائي</th>";
                    }
                  ?>
              </tr>
          </thead>
          <tbody>
                  <?php
                    if(isset($_POST["record"])){
                      $Period = $_POST["Period"];
                      $id_bus = $_POST["id_bus"];
                      $stmt = $con->prepare("SELECT ID_étudient, Nom_complet, niveau_étude, Numéro_de_bus FROM bus_scolaire INNER JOIN etudient ON bus_scolaire.ID_bus = etudient.IdBus WHERE bus_scolaire.ID_bus = :id_bus");
                      $stmt->bindParam(':id_bus', $id_bus, PDO::PARAM_INT);
                      $stmt->execute();

                    foreach ($stmt->fetchAll(PDO::FETCH_ASSOC) as $v){
                      $count++;
                  ?>
                  <tr>
                            <td><?php echo $v["ID_étudient"]; ?></td>
                            <td><?php echo $v["Nom_complet"]; ?></td>
                            <td><?php echo $v["niveau_étude"]; ?></td>
                            <td><?php echo $v["Numéro_de_bus"]; ?></td>
                            <td>
                                
                                <input class="form-check-input" type="checkbox" name="absent[<?php echo $v["ID_étudient"]; ?>]" id="absent_<?php echo $v["ID_étudient"]; ?>">
                                <label class="form-check-label" for="absent_<?php echo $v["ID_étudient"]; ?>">غائب</label>
                                
                            </td>
                            
                            
                        </tr>
                        <?php
                        }
                      }
                        ?>
                    </tbody>
          
      </table>
      </form>
</div>









      
    </section>





    <script src="../views/js/bootstrap.bundle.min.js"></script>         
    <script src="../views/js/javascript.js"></script>
    
  </body>
</html>












