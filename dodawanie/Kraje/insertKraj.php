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
    $konf_name = $_POST["konf"];
    $kraj = $_POST["kraj"];
    $feder = $_POST["feder"];
    $p_feder = $_POST["p_feder"];
    $wynik= pg_query_params($dbconn, 'select * from getid_konf($1)', array($konf_name))
            or die ('błąd : ' . pg_last_error());
    $tab = pg_fetch_all($wynik);

    foreach ($tab as $k){
            $konf_id=$k['id'];
    }

    $query = "INSERT INTO projekt.Kraj ( ID_kraj, ID_konfederacja, Nazwa, Nazwa_federacji, Pelna_nazwa_federacji) VALUES ( nextval('kraj_id_seq'),'$konf_id', '$kraj', '$feder', '$p_feder')";
    $result = pg_query($query) or die ('błąd : ' . pg_last_error());
    $cmdtuples = pg_affected_rows($result);
    
    if($cmdtuples > 0){
        echo 'Rekord został dodany.<br><a href=http://pascal.fis.agh.edu.pl/~9kolodziejmir/projekt_db>Wróć na stronę główną.<a>';
    }
    else{
        echo 'Rekord nie został dodany, prawdopodobnie już istnieje w bazie.<br><a href=http://pascal.fis.agh.edu.pl/~9kolodziejmir/projekt_db>Wróć na stronę główną.<a>';
    }   
    pg_free_result($result);
    pg_close($dbconn);
?>
    
</body>
</html>