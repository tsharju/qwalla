import Qt 4.7
import "QwallaCore" 1.0 as Qwalla
import "js/gowalla.js" as Gowalla
import "js/storage.js" as Storage

Item {
    id: screen; width: 360; height: 640;
    state: "start"

    function callback(data) {
        var activity;
        for (activity in data.activity) {
            userListView.model.append(data.activity[activity]);
        }
        screen.state = "loggedIn"
    }

    function startApp() {
        Storage.initialize();
        var user = Storage.getUser();
        if (!user)  {
            screen.state = "login";
        } else {
            screen.state = "loggingIn";
            Gowalla.getFriendsActivity(screen.callback, user.username, user.password);
        }
    }

    Rectangle {
        id: background
        anchors.fill: parent
        color: "grey"

        Qwalla.TopBar { id: topBar; height: 70 }

        Item {
            id: views
            width: parent.width; height: parent.height
            y: topBar.height + 5

            Qwalla.UserListView {
                id: userListView
                x: - screen.width

            }

            Qwalla.LoginView {
                id: loginView
                x: - screen.width
            }
        }
        //Qwalla.Loading { anchors.centerIn: parent; visible: screen.state == "loggingIn" }
        Qwalla.ToolBar { id: toolBar; height: 70 }

        Component.onCompleted: startApp()
    }
    states: [
        State {
            name: "login"
            PropertyChanges { target: loginView; x: 0; focus: true }
        },
        State {
            name: "loggingIn"
            PropertyChanges { target: loginView; x: - width; focus: false }
        },
        State {
            name: "loggedIn"
            PropertyChanges { target: userListView; x: 0; focus: true }
        }

    ]
    transitions: [
        Transition { PropertyAnimation { properties: "x"; duration: 500; easing.type: Easing.InOutQuad } }
    ]
}
