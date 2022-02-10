<!DOCTYPE HTML>
<html lang="pl-PL">
<head>
    <meta charset="UTF-8">
    <title>Ligi</title>
    <link rel="StyleSheet" href="../../projekt.css" type="text/css">
</head>
<body>
<?php
    include("../../laczenie_baza.php");

    $kraj = $_GET["kraj"];

    $wynik = pg_query_params($dbconn, 'select * from getLigi($1)', array($kraj))
                or die ('błąd : ' . pg_last_error());
    $tab = pg_fetch_all($wynik);

    $str = <<<HTML
        <table>
        <tr>
            <th>Nazwa ligi</th>
            <th>Kraj</th>
            <th>Poziom rozgrywkowy</th>
            <th>Ilość zespołów</th>
            <th>Ilość sędziów</th>
            <th>Możliwe akcje</th>
        </tr>
        HTML;

            foreach ($tab as $liga){
                $liga_nazwa=$liga['nazwaligi'];
                $link="http://pascal.fis.agh.edu.pl/~9kolodziejmir/projekt_db/wyswietlanie/Kluby/klubyFiltr.php"."?kraj=Wszystkie&liga=".$liga_nazwa;
                $link2="http://pascal.fis.agh.edu.pl/~9kolodziejmir/projekt_db/wyswietlanie/Sedziowie/sedziowieFiltr.php"."?kraj=Wszystkie&liga=".$liga_nazwa;
                $str = $str . <<< HTML
                <tr>
                <td>{$liga['nazwaligi']}</td>
                <td>{$liga['kraj']}</td>
                <td>{$liga['poziom']}</td>
                <td>{$liga['liczba_zespolow']}</td>
                <td>{$liga['ilosc_sedziow']}</td>
                HTML;
                $str = $str . '<td><a href="'.$link.'">Wyświetl kluby</a><br>';
                $str = $str . '<a href="'.$link2.'">Wyświetl sędziów</a></td></tr>';
        
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
