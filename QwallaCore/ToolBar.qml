import Qt 4.7

Rectangle {
    id: topBar

    width: parent.width
    height: 50

    border.width: 0
    radius: 0.5
    smooth: true

    y: parent.height - height
    z: 100

    gradient: Gradient {
        GradientStop { id: topGrad; position: 0.0; color: "#666666" }
        GradientStop { id: bottomGrad; position: 1.0; color: Qt.darker(topGrad.color, 1.5) }
    }
}
