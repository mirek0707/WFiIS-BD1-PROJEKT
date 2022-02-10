<!DOCTYPE html>
<html lang="pl-PL">

<head>
    <meta charset="UTF-8">
    <link rel="StyleSheet" href="../../projekt.css" type="text/css">
    <title>Dodaj nowego zawodnika</title>
</head>
<body>
    <header class="header" id="myHeader">
        <div class="tytul">
            <img class="logo" src="../../img/AGH.svg" alt="logo AGH">
            <img class="logo2" src="../../img/unnamed.png" alt="logo WFiIS">
            <b class="lb">DODAWANIE NOWEGO ZAWODNIKA</b>
        </div>
        <div class="menu" id="menu">
            <nav>
                <a class="ra" href="http://pascal.fis.agh.edu.pl/~9kolodziejmir/projekt_db/">Strona główna</a>
            </nav>
        </div>
    </header>
    <div class="formularz">
        <h3 class="center">Wybierz narodowość:</h3>
        <form class="center" action="insertZawodnik.php" method="POST">
            <select name="kraj" id="kraj">
                <?php
                    include("../../laczenie_baza.php");
                    $query1 = 'SELECT * FROM kraj_nazwa';
                    $result1 = pg_query($query1) or die('Nie udalo sie uzyskac wyniku: ' . pg_last_error());
                    while ($line = pg_fetch_array($result1, null, PGSQL_ASSOC)) {
                        foreach ($line as $col_value) {
                            echo "<option value=\"$col_value\">$col_value</option>\n";
                        }
                    }
                    pg_free_result($result1);
                    pg_close($dbconn);
                ?>    
            </select>
            <h3 class="center">Wybierz klub:</h3>
            <select name="klub" id="klub">
                <?php
                    include("../../laczenie_baza.php");
                    $query1 = 'SELECT * FROM klub_nazwa';
                    $result1 = pg_query($query1) or die('Nie udalo sie uzyskac wyniku: ' . pg_last_error());
                    while ($line = pg_fetch_array($result1, null, PGSQL_ASSOC)) {
                        foreach ($line as $col_value) {
                            echo "<option value=\"$col_value\">$col_value</option>\n";
                        }
                    }
                    pg_free_result($result1);
                    pg_close($dbconn);
                ?>    
            </select>

        <h3 class="center">Podaj imię:</h3>
        <input type="text" name = "imie" placeholder="Wpisz imię" value = "" required><br>

        <h3 class="center">Podaj nazwisko:</h3>
        <input type="text" name = "nazwisko" placeholder="Wpisz nazwisko" value = "" required><br>

        <h3 class="center">Wybierz datę urodzenia:</h3>
        <input type="date" name = "data_ur" value="1980-01-01" min="1940-01-01" max="2010-12-31" required><br>
        
        <h3 class="center">Podaj wzrost (cm):</h3>
        <input type="number" name = "wzrost" min="140" max="230" value = "" required><br>
        
        <h3 class="center">Podaj wagę (kg):</h3>
        <input type="number" name = "waga" min="40" max="120" value = "" required><br>

        <h3 class="center">Wybierz pozycję:</h3>
        <select name="poz" id="poz">
            <?php
                include("../../laczenie_baza.php");
                $query1 = 'SELECT * FROM poz_nazwa';
                $result1 = pg_query($query1) or die('Nie udalo sie uzyskac wyniku: ' . pg_last_error());
                while ($line = pg_fetch_array($result1, null, PGSQL_ASSOC)) {
                    foreach ($line as $col_value) {
                        echo "<option value=\"$col_value\">$col_value</option>\n";
                    }
                }
                pg_free_result($result1);
                pg_close($dbconn);
            ?>    
        </select>
        
        <h3 class="center">Podaj numer na koszulce:</h3>
        <input type="number" name = "numer" min="0" max="99" value = "" required><br>

        <br>

        <input type="submit" value = "Zapisz zawodnika">

        </form>

    </div>
    
    <footer>
        <p>Mirosław Kołodziej<br>
            <a href="mailto:kolodziejm@student.agh.edu.pl">kolodziejm@student.agh.edu.pl</a>
        </p>
    </footer>
</body>
</html>