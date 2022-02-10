window.onload = function () {
    pokazSztab();
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

function pokazSztab() {
    var kraj = document.getElementById("kraj").value;
    var klub = document.getElementById("klub").value;
    var rola = document.getElementById("rola").value;
    SztabRequest(kraj, klub, rola);
}

function SztabRequest(kraj, klub, rola) {
    xmlHttp = getRequestObject();
    if (xmlHttp) {
        try {
            var url = "./sztabFiltr.php?kraj=" + kraj + "&klub=" + klub + "&rola=" + rola;
            xmlHttp.onreadystatechange = handleResponseSztab;
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
function handleResponseSztab() {
    myDiv = document.getElementById("tabela");
    if (xmlHttp.readyState == 4) {
        if (xmlHttp.status == 200) {
            response = xmlHttp.responseText;
            var input = response;
            myDiv.innerHTML = input;
        }
    }
}