import Qt 4.7

Component {
    id: spotsListDelegate

    Rectangle {
        id: spotsListItem
        color: "#eeddcc"
        width: parent.width - 10
        anchors.horizontalCenter: parent.horizontalCenter
        height: 60
        radius: 5

        Row {
            spacing: 10
            Rectangle {
                height: spotsListItem.height
                width: spotsListItem.height
                //radius: 5
                color: "transparent"
                Image {
                    source: image_url
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
                Text { text: name; font { bold: true; pixelSize: 18 } }
                //Text { text: distance }
                /*Row {
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
                }*/
            }
        }
    }
}
