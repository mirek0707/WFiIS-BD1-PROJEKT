<!DOCTYPE HTML>
<html lang="pl-PL">
<head>
    <meta charset="UTF-8">
    <title>Kluby w bazie</title>
    <link rel="StyleSheet" href="../../projekt.css" type="text/css">
    <script src="kraje.js"></script>
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
    <div class="filtrowanie">
        <form>
            <table align="center">
                <tr>
                    <th colspan="2">Filtrowanie</th>
                </tr>
                <tr>
                    <td>Konfederacja:</td>
                    <td>
                        <select name="konf" id="konf">
                            <option value="Wszystkie">Wszystkie</option>
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
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="button" onclick="pokazKraje();" name = "filtruj" value = "Filtruj">
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div id="tabela">
    </div>
    <footer>
        <p>Mirosław Kołodziej<br>
            <a href="mailto:kolodziejm@student.agh.edu.pl">kolodziejm@student.agh.edu.pl</a>
        </p>
    </footer>
</body>
</html>