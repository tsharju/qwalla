import Qt 4.7
import "../js/gowalla.js" as Gowalla;
import "../js/storage.js" as Storage;

FocusScope {
    id: wrapper

    width: parent.width
    height: 400

    function loginClicked() {
        var username = inputUsername.text;
        var password = inputPassword.text;
        if (username && password) {
            application.state = "loggingIn";
            Storage.setUser(username, password);
            Gowalla.getFriendsActivity(application.callback, username, password);
            //screen.state = "loggedIn";
        }
    }

    Column {
        anchors.centerIn: parent
        spacing: 15
        Column {
            spacing: 4
            Text {
                text: "Username:"
                font.pixelSize: 18
                font.bold: true
                horizontalAlignment: Qt.AlignRight
            }
            Input {
                id: inputUsername
                item.font.pixelSize: 18
                width: 250
            }
        }
        Column {
            spacing: 4
            Text {
                text: "Password:"
                font.pixelSize: 18
                font.bold: true
                horizontalAlignment: Qt.AlignRight
            }
            Input {
                id: inputPassword
                item.font.pixelSize: 18
                item.echoMode: TextInput.Password
                width: 250
            }
        }
        Column {
            Button {
                id: loginButton
                width: 250
                text: "Login"
                font.pixelSize: 18
                onClicked: loginClicked()
            }
        }
    }
}
