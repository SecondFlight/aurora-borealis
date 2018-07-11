import QtQuick 2.0

Item
{
    id: root
    width: 8
    height: 87
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.bottom: parent.bottom

    Rectangle {
        id: orange
        width: 8
        height: 32
        color: "#da691a"
        border.width: 0
    }
    Rectangle {
        id: yellow
        width: 8
        height: 8
        color: "#f3d444"
        anchors.top: orange.bottom
        anchors.topMargin: 0
    }

    Rectangle
    {
        id: green
        width: 8
        height: 47
        anchors.top: yellow.bottom
        anchors.topMargin: 0
        border.width: 0
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#0AC48C"
            }

            GradientStop {
                position: 1
                color: "#07835E"
            }
        }
    }
}
