window.onload = function () {
    pokazLigi();
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

function pokazLigi() {
    var kraj = document.getElementById("kraj").value;
    LigiRequest(kraj);
}

function LigiRequest(kraj) {
    xmlHttp = getRequestObject();
    if (xmlHttp) {
        try {
            var url = "./ligiFiltr.php?kraj=" + kraj;
            xmlHttp.onreadystatechange = handleResponseLigi;
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
function handleResponseLigi() {
    myDiv = document.getElementById("tabela");
    if (xmlHttp.readyState == 4) {
        if (xmlHttp.status == 200) {
            response = xmlHttp.responseText;
            var input = response;
            myDiv.innerHTML = input;
        }
    }
}