import Qt 4.7

Rectangle {
    id: loading

    property string text: "Loading..."

    width: 150
    height: 150
    radius: 10
    color: "#2e2e2e"
    Rectangle {
        width: 0.5 * parent.width
        height: 0.5 * parent.height
        anchors.centerIn: parent
        color: parent.color
    Column {
        anchors.fill: parent
        spacing: 10
    Image {
        anchors.horizontalCenter: parent.horizontalCenter
        source: "../images/loading.png"
        NumberAnimation on rotation {
            from: 0; to: 360; running: loading.visible == true; loops: Animation.Infinite; duration: 900
        }
    }
    Text {
        text: loading.text;
        color: "#ffffff";
        font.pixelSize: 18;
        font.bold: true;
        anchors.horizontalCenter: parent.horizontalCenter
    }
    }
}
}
