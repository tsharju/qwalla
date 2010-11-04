import Qt 4.7
import QtMobility.location 1.1

Item {
    anchors.fill: parent
    focus: true

    Map {
        id: map
        size.width: parent.width
        size.height: parent.height
        zoomLevel: 10
        center: Coordinate {
                    latitude: application.lat
                    longitude: application.lon
                }
    }

    MouseArea {
        anchors.fill: parent

        property bool mouseDown : false
        property int lastX : -1
        property int lastY : -1

        onPressed : {
            mouseDown = true
            lastX = mouse.x
            lastY = mouse.y
        }
        onReleased : {
            mouseDown = false
            lastX = -1
            lastY = -1
        }
        onPositionChanged: {
            if (mouseDown) {
                var dx = mouse.x - lastX
                var dy = mouse.y - lastY
                map.pan(-dx, -dy)
                lastX = mouse.x
                lastY = mouse.y
            }
        }
        onDoubleClicked: {
            map.center = map.toCoordinate(Qt.point(mouse.x, mouse.y))
            if (map.zoomLevel < map.maximumZoomLevel)
                map.zoomLevel += 1
        }
    }

    Keys.onPressed: {
        if (event.key == Qt.Key_Plus) {
            if (map.zoomLevel < map.maximumZoomLevel)
                map.zoomLevel += 1
        } else if (event.key == Qt.Key_Minus) {
            if (map.zoomLevel > map.minimumZoomLevel)
                map.zoomLevel -= 1
        } else if (event.key == Qt.Key_T) {
            if (map.mapType == Map.StreetMap) {
                map.mapType = Map.SatelliteMapDay
            } else if (map.mapType == Map.SatelliteMapDay) {
                map.mapType = Map.StreetMap
            }
        }
    }
}
