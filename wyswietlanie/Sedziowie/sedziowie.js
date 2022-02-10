window.onload = function () {
    pokazSedziow();
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

function pokazSedziow() {
    var kraj = document.getElementById("kraj").value;
    var liga = document.getElementById("liga").value;
    SedziowieRequest(kraj, liga);
}

function SedziowieRequest(kraj, liga) {
    xmlHttp = getRequestObject();
    if (xmlHttp) {
        try {
            var url = "./sedziowieFiltr.php?kraj=" + kraj + "&liga=" + liga;
            xmlHttp.onreadystatechange = handleResponseSedziowie;
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
function handleResponseSedziowie() {
    myDiv = document.getElementById("tabela");
    if (xmlHttp.readyState == 4) {
        if (xmlHttp.status == 200) {
            response = xmlHttp.responseText;
            var input = response;
            myDiv.innerHTML = input;
        }
    }
}