<!DOCTYPE HTML>
<html lang="pl-PL">
<head>
    <meta charset="UTF-8">
    <title>Stadiony</title>
    <link rel="StyleSheet" href="../../projekt.css" type="text/css">
</head>
<body>
<?php
    include("../../laczenie_baza.php");

    $klub = $_GET["klub"];
    $miasto = $_GET["miasto"];

    $wynik = pg_query_params($dbconn, 'select * from getStadiony($1, $2)', array($klub, $miasto))
                or die ('błąd : ' . pg_last_error());
    $tab = pg_fetch_all($wynik);

    $str = <<<HTML
        <table>
        <tr>
            <th>Nazwa</th>
            <th>Klub</th>
            <th>Pojemność</th>
            <th>Miejscowość</th>
        </tr>
        HTML;

            foreach ($tab as $stad){
                $str = $str . <<< HTML
                <tr>
                <td>{$stad['nazwa']}</td>
                <td>{$stad['klub']}</td>
                <td>{$stad['poj']}</td>
                <td>{$stad['miasto']}</td>
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