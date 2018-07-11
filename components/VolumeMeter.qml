import QtQuick 2.0

Item {
    id: root
    width: 18
    height: 89
    property real volume : 87
    Item{
        id: volumeLeft
        width:9
        height: root.height
        clip: true
        Rectangle
        {
            id: frameLeft
            width:10
            height:89
            color: Qt.rgba(0,0,0,.07)
            border.color: Qt.rgba(0, 0, 0, 0.4)
        }
        Item{
            id: clipL
            width:frameLeft.width- 2
            height: root.volume
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 1
            anchors.horizontalCenter: parent.horizontalCenter
            clip: true
            ColorBar{}

        }
    }

    Item{
        id: volumeRight
        width:9
        height: root.height
        anchors.left: volumeLeft.right
        anchors.leftMargin: 0
        clip: true

        Rectangle
        {
            id: frameRight
            width:10
            height:89
            color: Qt.rgba(0,0,0,.07)
            border.color: Qt.rgba(0, 0, 0, 0.4)
         }
        Item{
            id:clipR
            width:frameLeft.width- 2
            height: root.volume
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 1
            anchors.horizontalCenter: parent.horizontalCenter
            clip:true
            ColorBar{}
        }
}
}

