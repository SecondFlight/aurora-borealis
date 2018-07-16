import QtQuick 2.0

Item {
    id: root
    property real value: 0.5
    property int minimumValue: 0
    property int maximumValue: 1
    implicitWidth: 20
    implicitHeight: 100
    onValueChanged: logValue()
    property bool isActive: false

    Rectangle
    {
        id: back
        height: root.height
        width: root.width
        color: "slate grey"
    }
    Rectangle
    {
        id: slider
        height: root.height * value
        width: root.width
        anchors.bottom: back.bottom
        color: "dark grey"
        anchors.bottomMargin: 0
    }
    Rectangle
    {
        id: handle
        height: 2
        anchors.top: slider.top
        anchors.topMargin: 0
        width: root.width

    }

    MouseArea{
        id: mouse_area
        anchors.fill: root
        cursorShape: pressed ? Qt.BlankCursor: Qt.ArrowCursor
        onPressedChanged:
        {
            pressed ? borealis.mouseHidden = true : borealis.mouseHidden = false
        }
        onReleased: backend.moveCursor()



        onMouseYChanged: {
            var pos = maximumValue - mouse.y / root.height * (maximumValue - minimumValue) + minimumValue
            root.value = Math.max(minimumValue, Math.min(pos, maximumValue))

        }

    }
    function logValue()
    {
        console.log(value)
    }


}
