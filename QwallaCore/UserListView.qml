import Qt 4.7

ListView {
    anchors.fill: parent
    model: ListModel { id: userListModel }
    delegate: UserListDelegate { id: userListDelegate }
    //highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
    spacing: 5
    width: parent.width - 10
    anchors.verticalCenter: parent.verticalCenter
}
