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
    $klub_name = $_POST["klub"];
    $nazwa = $_POST["nazwa"];
    $poj = $_POST["poj"];
    $miasto = $_POST["miasto"];

    $wynik2= pg_query_params($dbconn, 'select * from getid_klub($1)', array($klub_name))
            or die ('błąd : ' . pg_last_error());
    $tab2 = pg_fetch_all($wynik2);

    foreach ($tab2 as $k2){
            $klub_id=$k2['id'];
    }

    $query = "INSERT INTO projekt.Stadion (ID_stadion, ID_klub, Nazwa, Pojemnosc, Miejscowosc)
            VALUES ( nextval('stadion_id_seq'),'$klub_id', '$nazwa', '$poj', '$miasto')";
    $result = pg_query($query) or die ('błąd : ' . pg_last_error());
    $cmdtuples = pg_affected_rows($result);
    
    if($cmdtuples > 0){
        echo 'Rekord został dodany.<br><a href=http://pascal.fis.agh.edu.pl/~9kolodziejmir/projekt_db>Wróć na stronę główną.<a>';
    }
    else{
        echo 'Rekord nie został dodany. Prawdopodobnie znajduje się już w bazie.<br><a href=http://pascal.fis.agh.edu.pl/~9kolodziejmir/projekt_db>Wróć na stronę główną.<a>';
    }   
    pg_free_result($result);
    pg_close($dbconn);
?>
    
</body>
</html>