<!DOCTYPE html>
<html lang="pl-PL">

<head>
    <meta charset="UTF-8">
    <!-- <link rel="StyleSheet" href="projekt.css" type="text/css"> -->
    <title>Dodaj nowy kraj</title>
</head>
<body>
<?php
    include("../../laczenie_baza.php");
    $kraj_name = $_POST["kraj"];
    $liga_name = $_POST["liga"];
    $nazwa = $_POST["nazwa"];
    $miasto = $_POST["miasto"];

    $wynik1= pg_query_params($dbconn, 'select * from getid_kraj($1)', array($kraj_name))
            or die ('błąd : ' . pg_last_error());
    $tab1 = pg_fetch_all($wynik1);

    foreach ($tab1 as $k1){
            $kraj_id=$k1['id'];
    }
    $wynik2= pg_query_params($dbconn, 'select * from getid_liga($1)', array($liga_name))
            or die ('błąd : ' . pg_last_error());
    $tab2 = pg_fetch_all($wynik2);

    foreach ($tab2 as $k2){
            $liga_id=$k2['id'];
    }

    $query = "INSERT INTO projekt.Klub (ID_klub, ID_kraj, ID_liga, Nazwa, Miasto) 
            VALUES ( nextval('klub_id_seq'),'$kraj_id', '$liga_id', '$nazwa', '$miasto')";
    $result = pg_query($query) or die ('błąd : ' . pg_last_error());
    $cmdtuples = pg_affected_rows($result);
    
    if($cmdtuples > 0){
        echo 'Rekord został dodany.<br><a href=http://pascal.fis.agh.edu.pl/~9kolodziejmir/projekt_db>Wróć na stronę główną.<a>';
    }
    else{
        echo 'Rekord nie został dodany. Prawdopodobnie istnieje już w bazie.<br><a href=http://pascal.fis.agh.edu.pl/~9kolodziejmir/projekt_db>Wróć na stronę główną.<a>';
    }   
    pg_free_result($result);
    pg_close($dbconn);
?>
    
</body>
</html>