.pragma library

var API_BASE_URL = "http://api.gowalla.com";
var API_KEY = "742292fb289449e5a3a32edba8ab1a0c";

function getFriendsActivity(callback, username, password)
{
    httpRequest("GET", "/users/" + username + "/activity/friends", callback, username, password);
}

function listNearbySpots(callback, lat, lon, radius)
{
    var url = "/spots?lat=" + lat + "&lng=" + lon + "&radius=" + radius;
    httpRequest("GET", url, callback);
}

function httpRequest(method, path, callback, username, password)
{
    var req = new XMLHttpRequest();
    req.open("GET", API_BASE_URL + path);
    req.setRequestHeader("Accept", "application/json");
    if (username && password)
        req.setRequestHeader("Authorization", "Basic " + Qt.btoa(username + ":" + password));
    req.setRequestHeader("X-Gowalla-API-Key", API_KEY);
    req.onreadystatechange = function() {
        if (req.readyState == XMLHttpRequest.DONE) {
            //console.log(req.responseText)
            callback(JSON.parse(req.responseText));
        }
    }
    req.send();
}
