import Qt 4.7

import "../js/gowalla.js" as Gowalla

Rectangle {
    id: topBar

    width: parent.width
    height: 50

    border.width: 0
    radius: 0.5
    smooth: true

    y: parent.height - height
    z: 100

    function spotsClicked() {
        if (application.state != "spots") {
            application.state = "loading"
            Gowalla.listNearbySpots(application.spotsCallback, "60.158568", "24.742734", "100");
            application.state = "spots"
        }
    }

    function activityClicked() {
        if (application.state != "activity") {
            application.state = "activity"
            //Gowalla.getFriendsActivity(screen.callback, screen.username, screen.password);
        }
    }

    gradient: Gradient {
        GradientStop { id: topGrad; position: 0.0; color: "#666666" }
        GradientStop { id: bottomGrad; position: 1.0; color: Qt.darker(topGrad.color, 1.5) }
    }

    Row {
        spacing: 10
        anchors.horizontalCenter: parent.horizontalCenter
        Text {
            text: "Activity"
            MouseArea {
                anchors.fill: parent
                onClicked: activityClicked()
            }
        }
        Text {
            text: "Spots"
            MouseArea {
                anchors.fill: parent
                onClicked: spotsClicked()
            }
        }
        Text {
            text: "Trips"
            MouseArea {
                anchors.fill: parent
                onClicked: console.log("Trips clicked!")
            }
        }
        Text {
            text: "Passport"
            MouseArea {
                anchors.fill: parent
                onClicked: console.log("Passport clicked!")
            }
        }
    }
}
