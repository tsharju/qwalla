import Qt 4.7
import "../js/pretty.js" as Pretty

Component {
    id: userListDelegate

    Rectangle {
        id: userListItem
        color: "#eeddcc"
        width: parent.width - 10
        anchors.horizontalCenter: parent.horizontalCenter
        height: 93
        radius: 5

        Row {
            spacing: 10
            Rectangle {
                height: userListItem.height
                width: userListItem.height
                radius: 5
                Image {
                    source: user.image_url
                    width: parent.width - 10
                    height: parent.height - 10
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    fillMode: Image.PreserveAspectFit
                    smooth: true
                }
            }
            Column {
                spacing: 3
                y: 5
                Text { text: user.first_name + " " + user.last_name; font { bold: true; pixelSize: 18 } }
                Text { text: message ? message : " " }
                Row {
                    spacing: 5
                    Image {
                        source: spot._image_url_50
                        width: 35
                        height: 35
                        fillMode: Image.PreserveAspectFit
                        smooth: true
                    }
                    Column {
                        Text { text: spot.name; font { pixelSize: 12; bold: true } }
                        Text { text: Pretty.prettyDate(created_at); font { pixelSize: 12 } }
                    }
                }
            }
        }
        ListView.onAdd: ScriptAction{ script: console.log("adding to list"); } /*SequentialAnimation {
            PropertyAction { target: userListItem; property: "height"; value: 0 }
            NumberAnimation { target: userListItem; property: "height"; to: 93; duration: 1000; easing.type: Easing.InOutQuad }
        }*/
        MouseArea {
            anchors.fill: parent
            onClicked: console.log("Clicked element! " + user.url);
        }
    }
}
