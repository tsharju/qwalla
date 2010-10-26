import Qt 4.7

Rectangle {
    id: topBar

    width: parent.width
    height: 50
    z: 100

    border.width: 0
    radius: 0.5
    smooth: true

    gradient: Gradient {
        GradientStop { id: topGrad; position: 0.0; color: Qt.darker(bottomGrad.color, 1.5) }
        GradientStop { id: bottomGrad; position: 1.0; color: "#666666" }
    }

    Image {
        id: gowallaLogo
        source: "../images/gowalla-logo.png"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        height: parent.height - 20
        smooth: true
        fillMode: Image.PreserveAspectFit
    }
}
