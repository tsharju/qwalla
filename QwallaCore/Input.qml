import Qt 4.7

FocusScope {
    id: container
    width: 220
    height: input.font.pixelSize + 20
    BorderImage {
        id: name
        source: "../images/lineedit-bg.png"
        width: parent.width; height: parent.height
        border { left: 10; top: 10; right: 10; bottom: 10 }
    }
    signal accepted
    property alias text: input.text
    property alias item: input
    TextInput {
        id: input
        width: parent.width - 20
        anchors.centerIn: parent
        maximumLength: 21
        font.pixelSize: 20
        font.bold: true
        color: "#000000"
        focus: true
        text: ""
        selectByMouse: true
    }
}
