window.onload = function () {
    pokazKraje();
}

var xmlHttp;
function getRequestObject() {
    if (window.ActiveXObject) {
        return (new ActiveXObject("Microsoft.XMLHTTP"));
    }
    else if (window.XMLHttpRequest) {
        return (new XMLHttpRequest());
    }
    else {
        return (null);
    }
}

function pokazKraje() {
    var konf = document.getElementById("konf").value;
    KrajeRequest(konf);
}

function KrajeRequest(konf) {
    xmlHttp = getRequestObject();
    if (xmlHttp) {
        try {
            var url = "./krajeFiltr.php?konf=" + konf;
            xmlHttp.onreadystatechange = handleResponseKraje;
            xmlHttp.open("GET", url, true);
            xmlHttp.send(null);
        }
        catch (e) {
            alert("Nie mozna polaczyc sie z serwerem: " + e.toString());
        }
    } else {
        alert("Blad");
    }
}
function handleResponseKraje() {
    myDiv = document.getElementById("tabela");
    if (xmlHttp.readyState == 4) {
        if (xmlHttp.status == 200) {
            response = xmlHttp.responseText;
            var input = response;
            myDiv.innerHTML = input;
        }
    }
}