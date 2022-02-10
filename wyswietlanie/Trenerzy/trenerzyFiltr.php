<!DOCTYPE HTML>
<html lang="pl-PL">
<head>
    <meta charset="UTF-8">
    <title>Trenerzy</title>
    <link rel="StyleSheet" href="../../projekt.css" type="text/css">
</head>
<body>
<?php
    include("../../laczenie_baza.php");

    $kraj = $_GET["kraj"];
    $klub = $_GET["klub"];
    $lic = $_GET["lic"];

    $wynik = pg_query_params($dbconn, 'select * from getTrenerzy($1, $2, $3)', array($kraj, $klub, $lic))
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
            <th>Licencja</th>
        </tr>
        HTML;

            foreach ($tab as $trener){
                $str = $str . <<< HTML
                <tr>
                <td>{$trener['imie']}</td>
                <td>{$trener['nazwisko']}</td>
                <td>{$trener['nazwa']}</td>
                <td>{$trener['kraj']}</td>
                <td>{$trener['data_ur']}</td>
                <td>{$trener['lic']}</td>
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