<!DOCTYPE HTML>
<html lang="pl-PL">
<head>
    <meta charset="UTF-8">
    <title>Kraje</title>
    <link rel="StyleSheet" href="../../projekt.css" type="text/css">
</head>
<body>
<?php
    include("../../laczenie_baza.php");

    $konf = $_GET["konf"];

    $wynik = pg_query_params($dbconn, 'select * from getKraje($1)', array($konf))
                or die ('błąd : ' . pg_last_error());
    $tab = pg_fetch_all($wynik);

    $str = <<<HTML
        <table>
        <tr>
            <th>Nazwa</th>
            <th>Konfederacja</th>
            <th>Federacja</th>
            <th>Pełna nazwa federacji</th>
            <th>Możliwe akcje</th>
        </tr>
        HTML;

            foreach ($tab as $kraj){
                $kraj_nazwa=$kraj['kraj'];
                $link="http://pascal.fis.agh.edu.pl/~9kolodziejmir/projekt_db/wyswietlanie/Ligi/ligiFiltr.php"."?kraj=".$kraj_nazwa;
                $link2="http://pascal.fis.agh.edu.pl/~9kolodziejmir/projekt_db/wyswietlanie/Kluby/klubyFiltr.php"."?kraj=".$kraj_nazwa."&liga=Wszystkie";
                $link3="http://pascal.fis.agh.edu.pl/~9kolodziejmir/projekt_db/wyswietlanie/Zawodnicy/zawodnicyFiltr.php"."?kraj=".$kraj_nazwa."&klub=Wszystkie&poz=Wszystkie";
                $link4="http://pascal.fis.agh.edu.pl/~9kolodziejmir/projekt_db/wyswietlanie/Trenerzy/trenerzyFiltr.php"."?kraj=".$kraj_nazwa."&klub=Wszystkie&lic=Wszystkie";
                $link5="http://pascal.fis.agh.edu.pl/~9kolodziejmir/projekt_db/wyswietlanie/Sztab/sztabFiltr.php"."?kraj=".$kraj_nazwa."&klub=Wszystkie&rola=Wszystkie";
                $str = $str . <<< HTML
                <tr>
                <td>{$kraj['kraj']}</td>
                <td>{$kraj['konf']}</td>
                <td>{$kraj['feder']}</td>
                <td>{$kraj['p_feder']}</td>
                HTML;
                $str = $str . '<td><a href="'.$link.'">Wyświetl ligi</a><br>';
                $str = $str . '<a href="'.$link2.'">Wyświetl kluby</a><br>';
                $str = $str . '<a href="'.$link3.'">Wyświetl zawodników</a><br>';
                $str = $str . '<a href="'.$link4.'">Wyświetl trenerów</a><br>';
                $str = $str . '<a href="'.$link5.'">Wyświetl członków sztabów</a></td></tr>';
        
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