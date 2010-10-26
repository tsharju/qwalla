import Qt 4.7

Component {
    id: spotsListDelegate

    Item {
        width: parent.width
        height: 80
        Row {
            spacing: 10
            Column {
                spacing: 5
                Text { text: user.first_name }
                Text { text: user.last_name }
            }
        }
    }
}
