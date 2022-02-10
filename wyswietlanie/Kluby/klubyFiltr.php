<!DOCTYPE HTML>
<html lang="pl-PL">
<head>
    <meta charset="UTF-8">
    <title>Kluby</title>
    <link rel="StyleSheet" href="../../projekt.css" type="text/css">
</head>
<body>
<?php
    include("../../laczenie_baza.php");

    $kraj = $_GET["kraj"];
    $liga = $_GET["liga"];

    $wynik = pg_query_params($dbconn, 'select * from getKluby($1, $2)', array($kraj, $liga))
                or die ('błąd : ' . pg_last_error());
    $tab = pg_fetch_all($wynik);

    $str = <<<HTML
        <table>
        <tr>
            <th>Nazwa klubu</th>
            <th>Liga</th>
            <th>Kraj</th>
            <th>Ilość zawodników</th>
            <th>Możliwe akcje</th>
        </tr>
        HTML;

            foreach ($tab as $klub){
                $klub_nazwa=$klub['nazwa'];
                $link="http://pascal.fis.agh.edu.pl/~9kolodziejmir/projekt_db/wyswietlanie/Zawodnicy/zawodnicyFiltr.php"."?kraj=Wszystkie&klub=".$klub_nazwa."&poz=Wszystkie";
                $link2="http://pascal.fis.agh.edu.pl/~9kolodziejmir/projekt_db/wyswietlanie/Trenerzy/trenerzyFiltr.php"."?kraj=Wszystkie&klub=".$klub_nazwa."&lic=Wszystkie";
                $link3="http://pascal.fis.agh.edu.pl/~9kolodziejmir/projekt_db/wyswietlanie/Sztab/sztabFiltr.php"."?kraj=Wszystkie&klub=".$klub_nazwa."&rola=Wszystkie";
                $link4="http://pascal.fis.agh.edu.pl/~9kolodziejmir/projekt_db/wyswietlanie/Stadiony/stadionyFiltr.php"."?klub=".$klub_nazwa."&miasto=Wszystkie";
                $str = $str . <<< HTML
                <tr>
                <td>{$klub['nazwa']}</td>
                <td>{$klub['liga']}</td>
                <td>{$klub['kraj']}</td>
                <td>{$klub['liczba_zawodnikow']}</td>
                HTML;
                $str = $str . '<td><a href="'.$link.'">Wyświetl zawodników</a><br>';
                $str = $str . '<a href="'.$link2.'">Wyświetl trenerów</a><br>';
                $str = $str . '<a href="'.$link3.'">Wyświetl sztab</a><br>';
                $str = $str . '<a href="'.$link4.'">Wyświetl stadiony</a></td></tr>';
        
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