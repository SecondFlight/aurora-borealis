import QtQuick 2.0

Item {
    id:root
    implicitWidth: parent.width
    implicitHeight: label.contentHeight
    property alias text: label.text
    property int dbValue: 0

    Text{
        id :label

        width: root.width -2
        height: contentHeight
        text: "0"
        renderType: Text.NativeRendering
        color: Qt.rgba(1,1,1,0.7)

        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
        font.family: "Courier New"
        font.pixelSize:11
        font.letterSpacing: -1
    }
    Rectangle{
        height: 1
        width: root.width - label.contentWidth -3
        y: root.height /2
        color: Qt.rgba(1,1,1,0.7)
     }

}
