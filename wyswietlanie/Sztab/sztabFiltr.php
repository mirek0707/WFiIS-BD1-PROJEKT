<!DOCTYPE HTML>
<html lang="pl-PL">
<head>
    <meta charset="UTF-8">
    <title>Sztab</title>
    <link rel="StyleSheet" href="../../projekt.css" type="text/css">
</head>
<body>
<?php
    include("../../laczenie_baza.php");

    $kraj = $_GET["kraj"];
    $klub = $_GET["klub"];
    $rola = $_GET["rola"];

    $wynik = pg_query_params($dbconn, 'select * from getSztab($1, $2, $3)', array($kraj, $klub, $rola))
                or die ('błąd : ' . pg_last_error());
    $tab = pg_fetch_all($wynik);

    $str = <<<HTML
        <table>
        <tr>
            <th>Imię</th>
            <th>Nazwisko</th>
            <th>Nazwa klubu</th>
            <th>Kraj</th>
            <th>Data urodzenia</th>
            <th>Rola</th>
        </tr>
        HTML;

            foreach ($tab as $sztab){
                $str = $str . <<< HTML
                <tr>
                <td>{$sztab['imie']}</td>
                <td>{$sztab['nazwisko']}</td>
                <td>{$sztab['nazwa']}</td>
                <td>{$sztab['kraj']}</td>
                <td>{$sztab['data_ur']}</td>
                <td>{$sztab['rola']}</td>
                </tr>
                HTML;
        
            }
    
            $str = $str . "</table>";

    pg_close($dbconn);
    echo $str;
?>
        <a class="ra" href="http://pascal.fis.agh.edu.pl/~9kolodziejmir/projekt_db/">Strona główna</a>
<footer>
        <p>Mirosław Kołodziej<br>
            <a href="mailto:kolodziejm@student.agh.edu.pl">kolodziejm@student.agh.edu.pl</a>
        </p>
    </footer>
</body>
</html>