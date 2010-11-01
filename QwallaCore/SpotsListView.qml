import Qt 4.7

ListView {
    id: spotsListView
    anchors.fill: parent
    model: ListModel { id: spotsListModel }
    delegate: SpotsListDelegate { id: spotsListDelegate }
    spacing: 5
}
