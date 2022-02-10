<!DOCTYPE HTML>
<html lang="pl-PL">
<head>
    <meta charset="UTF-8">
    <title>Konfederacje w bazie</title>
    <link rel="StyleSheet" href="../../projekt.css" type="text/css">
</head>
<body>
    <header class="header" id="myHeader">
        <div class="tytul">
            <img class="logo" src="../../img/AGH.svg" alt="logo AGH">
            <img class="logo2" src="../../img/unnamed.png" alt="logo WFiIS">
            <b class="lb">PIŁKARSKA BAZA DANYCH</b>
        </div>
        <div class="menu" id="menu">
            <nav>
                <a class="ra" href="http://pascal.fis.agh.edu.pl/~9kolodziejmir/projekt_db/">Strona główna</a>
            </nav>
        </div>
    </header>
    <div id="tabela">
         <?php
            include("../../laczenie_baza.php");
            $query = 'SELECT * FROM _konfederacja';
            $result = pg_query($query) or die('Query failed: ' . pg_last_error());
            echo "<table>\n";
            echo "<tr><th>Nazwa</th><th>Pełna nazwa</th><th>Kontynent</th><th>Siedziba</th><th>Data założenia</th><th>Ilość krajów</th><th>Możliwe akcje</th></tr>";
            while ($line = pg_fetch_array($result, null, PGSQL_ASSOC)) {
                echo "\t<tr>\n";
                $i=0;
                foreach ($line as $col_value) {
                    echo "\t\t<td>$col_value</td>\n";
                    if ($i==0){   
                        $link = "http://pascal.fis.agh.edu.pl/~9kolodziejmir/projekt_db/wyswietlanie/Kraje/krajeFiltr.php?konf=".$col_value;
                        $i=1;
                    }
                }
                echo '<td><a href="'.$link.'">Wyświetl kraje</a></td>';
                echo "\t</tr>\n";
            }
            echo "</table>\n";
            pg_free_result($result);

            pg_close($dbconn);
        ?>
    </div>
    <footer>
        <p>Mirosław Kołodziej   <br>
            <a href="mailto:kolodziejm@student.agh.edu.pl">kolodziejm@student.agh.edu.pl</a>
        </p>
    </footer>
</body>
</html>