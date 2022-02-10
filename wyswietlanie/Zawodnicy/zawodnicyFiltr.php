<!DOCTYPE HTML>
<html lang="pl-PL">
<head>
    <meta charset="UTF-8">
    <title>Zawodnicy</title>
    <link rel="StyleSheet" href="../../projekt.css" type="text/css">
</head>
<body>
<?php
    include("../../laczenie_baza.php");

    $kraj = $_GET["kraj"];
    $klub = $_GET["klub"];
    $poz = $_GET["poz"];

    $wynik = pg_query_params($dbconn, 'select * from getZawodnicy($1, $2, $3)', array($kraj, $klub, $poz))
                or die ('błąd : ' . pg_last_error());
    $tab = pg_fetch_all($wynik);

    $str = <<<HTML
        <table>
        <tr>
            <th>Numer</th>
            <th>Imię</th>
            <th>Nazwisko</th>
            <th>Nazwa klubu</th>
            <th>Pozycja</th>
            <th>Kraj</th>
            <th>Data urodzenia</th>
            <th>Wzrost (cm)</th>
            <th>Waga (kg)</th>
        </tr>
        HTML;

            foreach ($tab as $zaw){
                $str = $str . <<< HTML
                <tr>
                <td>{$zaw['num']}</td>
                <td>{$zaw['imie']}</td>
                <td>{$zaw['nazwisko']}</td>
                <td>{$zaw['nazwa']}</td>
                <td>{$zaw['pozycja']}</td>
                <td>{$zaw['kraj']}</td>
                <td>{$zaw['data_ur']}</td>
                <td>{$zaw['wzrost']}</td>
                <td>{$zaw['waga']}</td>
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