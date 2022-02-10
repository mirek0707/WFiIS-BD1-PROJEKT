<!DOCTYPE HTML>
<html lang="pl-PL">
<head>
    <meta charset="UTF-8">
    <title>S�dziowie</title>
    <link rel="StyleSheet" href="../../projekt.css" type="text/css">
</head>
<body>
<?php
    include("../../laczenie_baza.php");

    $kraj = $_GET["kraj"];
    $liga = $_GET["liga"];

    $wynik = pg_query_params($dbconn, 'select * from getSedziowie($1, $2)', array($kraj, $liga))
                or die ('błąd : ' . pg_last_error());
    $tab = pg_fetch_all($wynik);

    $str = <<<HTML
        <table>
        <tr>
            <th>Imię</th>
            <th>Nazwisko</th>
            <th>Liga</th>
            <th>Narodowość</th>
            <th>Data urodzenia</th>
        </tr>
        HTML;

            foreach ($tab as $sedzia){
                $str = $str . <<< HTML
                <tr>
                <td>{$sedzia['imie']}</td>
                <td>{$sedzia['nazwisko']}</td>
                <td>{$sedzia['nazwa']}</td>
                <td>{$sedzia['kraj']}</td>
                <td>{$sedzia['data_ur']}</td>
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