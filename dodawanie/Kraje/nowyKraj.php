<!DOCTYPE html>
<html lang="pl-PL">

<head>
    <meta charset="UTF-8">
    <link rel="StyleSheet" href="../../projekt.css" type="text/css">
    <title>Dodaj nowy kraj</title>
</head>
<body>
    <header class="header" id="myHeader">
        <div class="tytul">
            <img class="logo" src="../../img/AGH.svg" alt="logo AGH">
            <img class="logo2" src="../../img/unnamed.png" alt="logo WFiIS">
            <b class="lb">DODAWANIE NOWEGO KRAJU</b>
        </div>
        <div class="menu" id="menu">
            <nav>
                <a class="ra" href="http://pascal.fis.agh.edu.pl/~9kolodziejmir/projekt_db/">Strona główna</a>
            </nav>
        </div>
    </header>
    <div class="formularz">
        <h3>Wybierz konfederację:</h3>
        <form class="center" action="insertKraj.php" method="POST">
            <select name="konf" id="konf">
                <?php
                    include("../../laczenie_baza.php");
                    $query1 = 'SELECT * FROM konf_nazwa';
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


        <h3 class="center">Podaj nazwę kraju:</h3>
        <input type="text" name = "kraj" placeholder="Wpisz nazwę" value = "" required><br>

        <h3 class="center">Podaj skróconą nazwę federacji</h3>
        <input type="text" name = "feder" placeholder="Wpisz nazwę" value = "" required><br>

        <h3 class="center">Podaj pełną nazwę federacji</h3>
        <input type="text" name = "p_feder" placeholder="Wpisz nazwę" value = "" required><br><br>

        <input type="submit" value = "Zapisz kraj">

        </form>

    </div>
    
    <footer>
        <p>Mirosław Kołodziej<br>
            <a href="mailto:kolodziejm@student.agh.edu.pl">kolodziejm@student.agh.edu.pl</a>
        </p>
    </footer>
</body>
</html>