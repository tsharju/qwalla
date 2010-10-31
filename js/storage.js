var db = openDatabaseSync("qwalla", "1.0", "Qwalla Database", 1000000);

function initialize()
{
    db.transaction(
        function(tx) {
            tx.executeSql("CREATE TABLE IF NOT EXISTS User(username TEXT, password TEXT)");
        }
    );
}

function getUser()
{
    var username;
    var password;
    db.transaction(
        function(tx) {
            var result = tx.executeSql("SELECT * FROM User");
            if (result.rows.length) {
                username = result.rows.item(0).username;
                password = result.rows.item(0).password;
            }
        }
    );
    return {"username": username, "password": password};
}

function setUser(username, password)
{
    db.transaction(
        function(tx) {
            var result = tx.executeSql("INSERT INTO User VALUES ('" + username + "', '" + password + "')");
        }
    );
}
