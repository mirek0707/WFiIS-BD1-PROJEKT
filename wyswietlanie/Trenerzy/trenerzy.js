window.onload = function () {
    pokazTrenerzy();
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

function pokazTrenerzy() {
    var kraj = document.getElementById("kraj").value;
    var klub = document.getElementById("klub").value;
    var lic = document.getElementById("lic").value;
    TrenerzyRequest(kraj, klub, lic);
}

function TrenerzyRequest(kraj, klub, lic) {
    xmlHttp = getRequestObject();
    if (xmlHttp) {
        try {
            var url = "./trenerzyFiltr.php?kraj=" + kraj + "&klub=" + klub + "&lic=" + lic;
            xmlHttp.onreadystatechange = handleResponseTrenerzy;
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
function handleResponseTrenerzy() {
    myDiv = document.getElementById("tabela");
    if (xmlHttp.readyState == 4) {
        if (xmlHttp.status == 200) {
            response = xmlHttp.responseText;
            var input = response;
            myDiv.innerHTML = input;
        }
    }
}