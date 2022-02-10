window.onload = function () {
    pokazStadiony();
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

function pokazStadiony() {
    var klub = document.getElementById("klub").value;
    var miasto = document.getElementById("miasto").value;
    StadionyRequest(klub, miasto);
}

function StadionyRequest(klub, miasto) {
    xmlHttp = getRequestObject();
    if (xmlHttp) {
        try {
            var url = "./stadionyFiltr.php?klub=" + klub + "&miasto=" + miasto;
            xmlHttp.onreadystatechange = handleResponseStadiony;
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
function handleResponseStadiony() {
    myDiv = document.getElementById("tabela");
    if (xmlHttp.readyState == 4) {
        if (xmlHttp.status == 200) {
            response = xmlHttp.responseText;
            var input = response;
            myDiv.innerHTML = input;
        }
    }
}