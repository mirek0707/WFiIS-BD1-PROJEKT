<!DOCTYPE html>
<html lang="pl-PL">

<head>
    <meta charset="UTF-8">
    <!-- <link rel="StyleSheet" href="projekt.css" type="text/css"> -->
    <script src="./nowyKraj.js"></script>
    <title>Dodaj nowy kraj</title>
</head>
<body>
<?php
    include("../../laczenie_baza.php");
    $kraj_name = $_POST["kraj"];
    $liga = $_POST["liga"];
    $poz = $_POST["poz"];
    $wynik= pg_query_params($dbconn, 'select * from getid_kraj($1)', array($kraj_name))
            or die ('błąd : ' . pg_last_error());
    $tab = pg_fetch_all($wynik);

    foreach ($tab as $k){
            $kraj_id=$k['id'];
    }

    $query = "INSERT INTO projekt.Liga (ID_liga, ID_kraj, Nazwa, Poziom_rozgrywkowy) 
            VALUES ( nextval('liga_id_seq'),'$kraj_id', '$liga', '$poz')";
    $result = pg_query($query) or die ('błąd : ' . pg_last_error());
    $cmdtuples = pg_affected_rows($result);
    
    if($cmdtuples > 0){
        echo 'Rekord został dodany.<br><a href=http://pascal.fis.agh.edu.pl/~9kolodziejmir/projekt_db>Wróć na stronę główną.<a>';
    }
    else{
        echo 'Rekord nie został dodany. Liga w tym kraju o tym poziomie rozgrywkowym znajduje się już w bazie.<br><a href=http://pascal.fis.agh.edu.pl/~9kolodziejmir/projekt_db>Wróć na stronę główną.<a>';
    }   
    pg_free_result($result);
    pg_close($dbconn);
?>
    
</body>
</html>