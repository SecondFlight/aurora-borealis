import QtQuick 2.0

Item {
    id:root
    implicitWidth: 77
    implicitHeight: 18
    property alias text: label.text
    Row {
        spacing: 1
        width: root.width
        height: root.height
        Item {
            id: led
            width: 3
            height: root.height
            clip : true
            Rectangle {
                color: "#1BC18F"
                width:4
                height: parent.height
                radius: 1
            }
        }
        Item {
            id: labelContainer
            width: 73
            height: root.height


            Rectangle {
                anchors.fill: parent
                color: Qt.rgba(1,1,1,0.11)
                radius: 1
            }
            Rectangle {
                anchors.fill: parent
                color: "transparent"
                border.color: Qt.rgba(1,1,1,0.10)
                border.width: 1
                radius: 1
            }
            Text {
                id:label
                color: "#99ffffff"
                text: "Plugin Name"
                anchors.verticalCenterOffset: 1
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 2
                verticalAlignment: Text.AlignVCenter
                font.family: "Noto Sans Regular"
                font.pixelSize: 11
            }
        }
    }
}


