import Qt 4.7

ListView {
    id: userListView
    anchors.fill: parent
    model: ListModel { id: userListModel }
    delegate: UserListDelegate { id: userListDelegate }
    spacing: 5
}
