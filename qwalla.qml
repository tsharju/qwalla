import Qt 4.7
import QtMobility.location 1.1

import "QwallaCore" 1.0 as Qwalla
import "js/gowalla.js" as Gowalla
import "js/storage.js" as Storage

Rectangle {
    id: application; width: 360; height: 640;
    state: "start"

    property string username
    property string password

    property double lat: 62.593341
    property double lon: 27.575684

    function callback(data) {
        var activity;
        for (activity in data.activity) {
            userListView.model.append(data.activity[activity]);
        }
        application.state = "activity"
    }

    function spotsCallback(data) {
        var spot;
        for (spot in data.spots) {
            spotsListView.model.append(data.spots[spot]);
        }
    }

    function startApp() {
        Storage.initialize();
        var user = Storage.getUser();
        if (user.username == "")  {
            application.state = "login";
        } else {
            application.username = user.username
            application.password = user.password
            application.state = "loggingIn";
            Gowalla.getFriendsActivity(application.callback, user.username, user.password);
        }
    }

    function getPosition() {/*
        if (positionSource.positioninMethod == PositionSource.NoPositioningMethod) {
            return { "lat": application.lat, "lon": application.lon }
        } else
            return { "lat": positionSource.position.latitude, "lon": positionSource.longitude }*/
        return { "lat": application.lat, "lon": application.lon }
    }

    PositionSource {
        id: positionSource
        active: true
        updateInterval: 1000
    }

    Rectangle {
        id: background
        anchors.fill: parent
        color: "grey"

        Qwalla.TopBar { id: topBar; height: 70 }

        Item {
            id: views
            width: parent.width
            height: parent.height - topBar.height - toolBar.height - 10
            y: topBar.height + 5

            Qwalla.UserListView {
                id: userListView
            }

            Qwalla.SpotsListView {
                id: spotsListView
            }

            Qwalla.LoginView {
                id: loginView
                visible: application.state == "login"
            }

            Qwalla.MapView {
                id: mapView
                visible: application.state == "map"
            }
        }
        Qwalla.Loading {
            anchors.centerIn: parent;
            visible: (application.state == "loading") || (application.state == "loggingIn")
        }
        Qwalla.ToolBar { id: toolBar; height: 70 }

        Component.onCompleted: startApp()
    }
    states: [
        State {
            name: "login"
            PropertyChanges { target: loginView; x: 0; focus: true }
        },/*
        State {
            name: "loggingIn"
            PropertyChanges { target: loginView; x: - width; focus: false }
        },*/
        /*State {
            name: "loggedIn"
            PropertyChanges { target: userListView; x: 0; focus: true }
        },*/
        State {
            name: "activity"
            PropertyChanges { target: userListView; opacity: 1; focus: true }
            PropertyChanges { target: spotsListView; opacity: 0; focus: false }
        },
        State {
            name: "spots"
            PropertyChanges { target: userListView; opacity: 0; focus: false }
            PropertyChanges { target: spotsListView; opacity: 1; focus: true }
        }

    ]
    /*
    transitions: [
        Transition { PropertyAnimation { properties: "x,opacity"; duration: 500; easing.type: Easing.InOutQuad } }
    ]
    */
}
