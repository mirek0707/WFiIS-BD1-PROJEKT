<!DOCTYPE html>
<html lang="pl-PL">

<head>
    <meta charset="UTF-8">
    <link rel="StyleSheet" href="../../projekt.css" type="text/css">
    <title>Dodaj nowy stadion</title>
</head>
<body>
    <header class="header" id="myHeader">
        <div class="tytul">
            <img class="logo" src="../../img/AGH.svg" alt="logo AGH">
            <img class="logo2" src="../../img/unnamed.png" alt="logo WFiIS">
            <b class="lb">DODAWANIE NOWEGO STADIONU/OBIEKTU</b>
        </div>
        <div class="menu" id="menu">
            <nav>
                <a class="ra" href="http://pascal.fis.agh.edu.pl/~9kolodziejmir/projekt_db/">Strona główna</a>
            </nav>
        </div>
    </header>
    <div class="formularz">
        <form class="center" action="insertStadion.php" method="POST">
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

        <h3 class="center">Podaj nazwę:</h3>
        <input type="text" name = "nazwa" placeholder="Wpisz nazwę" value = "" required><br>

        <h3 class="center">Podaj pojemność:</h3>
        <input type="number" name = "poj" min="0" max="150000" value = "" required><br>
        
        <h3 class="center">Podaj miasto:</h3>
        <input type="text" name = "miasto" placeholder="Wpisz miasto" value = "" required><br><br>

        <input type="submit" value = "Zapisz stadion">

        </form>

    </div>
    
    <footer>
        <p>Mirosław Kołodziej<br>
            <a href="mailto:kolodziejm@student.agh.edu.pl">kolodziejm@student.agh.edu.pl</a>
        </p>
    </footer>
</body>
</html>