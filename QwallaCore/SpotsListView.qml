import Qt 4.7

ListView {
    anchors.fill: parent
    model: ListModel { id: spotsListModel }
    delegate: spotsListDelegate
    highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
    focus: true
}
