window.onload = function () {
    pokazZawodnicy();
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

function pokazZawodnicy() {
    var kraj = document.getElementById("kraj").value;
    var klub = document.getElementById("klub").value;
    var poz = document.getElementById("poz").value;
    ZawodnicyRequest(kraj, klub, poz);
}

function ZawodnicyRequest(kraj, klub, poz) {
    xmlHttp = getRequestObject();
    if (xmlHttp) {
        try {
            var url = "./zawodnicyFiltr.php?kraj=" + kraj + "&klub=" + klub + "&poz=" + poz;
            xmlHttp.onreadystatechange = handleResponseZawodnicy;
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
function handleResponseZawodnicy() {
    myDiv = document.getElementById("tabela");
    if (xmlHttp.readyState == 4) {
        if (xmlHttp.status == 200) {
            response = xmlHttp.responseText;
            var input = response;
            myDiv.innerHTML = input;
        }
    }
}