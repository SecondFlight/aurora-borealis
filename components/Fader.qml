import QtQuick 2.11

Item {
    id: root
    implicitWidth: 19
    implicitHeight: 89

    property real value: 0
    property int minimumValue: 0
    property int maximumValue: 1
    property variant mappedcursor

    Rectangle {
        id: frame // just the frame
        height: root.height
        width: root.width
        color: "transparent"
        border.color: Qt.rgba(0, 0, 0, 0.4)
        radius: 2
        antialiasing: true
    }
    Rectangle {
        id: back // background of fader
        height: root.height - 2
        width: root.width - 2
        anchors.centerIn: root
        color: Qt.rgba(0,0,0, 0.07)
    }
    Rectangle {
        id: slider //
        height: Math.max((root.height -2) * value,2)
        width: root.width -2
        anchors.bottom: back.bottom
        color: Qt.rgba(1,1,1,0.14)
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Rectangle {
        id: handle
        height: 2
        width: root.width -2
        anchors.top: slider.top
        anchors.topMargin: 0
        color: mouse_area.pressed ? "#1BC18F":Qt.rgba(1,1,1,0.65)
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Item {
        id: dBlabels
        height: root.height -2
        width: root.width -2
        anchors.centerIn: parent
        property real db_pixel_multiplier: 1.63
        property int db0_pixel_offset: 0
        DbLabel{
            text: "0"
            dbValue: 0
            y: dBlabels.db0_pixel_offset + (dbValue * dBlabels.db_pixel_multiplier)
        }
        DbLabel{
            text: "10"
            dbValue: 10
            y: dBlabels.db0_pixel_offset + (dbValue * dBlabels.db_pixel_multiplier)
        }
        DbLabel{
            text: "20"
            dbValue: 20
            y: dBlabels.db0_pixel_offset + (dbValue * dBlabels.db_pixel_multiplier)
        }
        DbLabel{
            text: "30"
            dbValue: 30
            y: dBlabels.db0_pixel_offset + (dbValue * dBlabels.db_pixel_multiplier)
        }
        DbLabel{
            text: "40"
            dbValue: 40
            y: dBlabels.db0_pixel_offset + (dbValue * dBlabels.db_pixel_multiplier)
        }
        Text{
            id: dBinf
            text: "∞"
            width: parent.width - 1
            horizontalAlignment: Text.AlignRight
            color: Qt.rgba(1,1,1,0.5)
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -6
            font.family: "Noto Sans"
            font.pixelSize:17
        }
    }
    MouseArea{
        id: mouse_area
        width: root.width -2
        height: root.height -2
        anchors.centerIn: parent
        onPressedChanged:
        {
            if (pressed)  {
                backend.setCursorShape(Qt.BlankCursor)
            }
        }
        onReleased:
        {
            move_Cursor()
            backend.setCursorShape(Qt.ArrowCursor)
        }
        onMouseYChanged: {
            var pos = maximumValue - mouse.y / height * (maximumValue - minimumValue) + minimumValue
            root.value = Math.max(minimumValue, Math.min(pos, maximumValue))
        }
    }
    function move_Cursor()
    {
        mappedcursor = mapToGlobal(handle.width / 2,handle.y)
        console.log(mappedcursor)
        backend.moveCursor(mappedcursor)
    }
}
