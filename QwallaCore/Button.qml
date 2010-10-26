import Qt 4.7

Rectangle {
    id: button

    property alias text: textItem.text
    property alias font: textItem.font

    signal clicked

    width: textItem.width + 60; height: textItem.height + 14
    border.width: 0
    radius: height/4
    smooth: true

    gradient: Gradient {
        GradientStop { id: topGrad; position: 0.0; color: "#ff9900" }
        GradientStop { id: bottomGrad; position: 1.0; color: "#cc6600" }
    }

    Text {
        id: textItem
        x: parent.width/2 - width/2; y: parent.height/2 - height/2
        font.pixelSize: 20
        font.bold: true
        color: "white"
        style: Text.Raised
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: button.clicked()
    }

    states: State {
        name: "pressed"; when: mouseArea.pressed && mouseArea.containsMouse
        PropertyChanges { target: topGrad; color: "#ff9933" }
        PropertyChanges { target: bottomGrad; color: "#cc6633" }
        PropertyChanges { target: textItem; x: textItem.x + 1; y: textItem.y + 1; explicit: true }
    }
}
