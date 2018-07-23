import QtQuick 2.11
import QtQuick.Controls 2.2

Item {
    id:root
    width: 28
    height: 28
    property real value: 0.5
    property int minimumValue: 0
    property int maximumValue: 1
    property int angle: 0
    property int deltaY: 0
    property int oldX: 0
    property int oldY: 0
    property real step: 0.01
    property real offset: 2
    property variant mappedcursor // qml type : point

    Rectangle {
        id:back // aka line1
        width: root.width // 28
        height: root.height
        radius: root.width / 2
        anchors.centerIn: root
        border.width: 1
        border.color: Qt.rgba(0,0,0,0.40)
        color:"transparent"
    }
    Item {
        id:innerCircle
        width:root.width -2 // 26
        height: root.height -2
        anchors.centerIn: root


        Rectangle{
            id: line2
            anchors.centerIn: parent
            width: parent.width // 26
            height: parent.height
            border.width: 2
            border.color: Qt.rgba(0,0,0, 0.07)
            color: "transparent"
            radius: width / 2
        }
        Rectangle {
            id: line3
            anchors.centerIn: parent
            width: parent.width - 4 // 22
            height: parent.height - 4
            color: Qt.rgba(1, 1, 1, 0.12)
            border.color: Qt.rgba(0, 0, 0, 0.40)
            border.width: 1
            radius: width / 2
        }
        GradientBorder {
            id: line4
            anchors.centerIn: parent
            width: parent.width - 6 // 20
            height: parent.height - 6
            radius: width/2
            borderWidth: 1
        }
        Rectangle {

            id: dot
            visible: Math.round(root.value * 100) == 50 ? true : false
            width: 2
            height: 2
            radius: width / 2
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 5
        }
    }
    ProgressCircle{
        id:progress
        colorCircle: "#1BC18F"
        colorBackground: "#00000000"
        anchors.centerIn: parent
        animationDuration: 10
        beginAnimation: false
        endAnimation: false
        size: parent.width - 2
        lineWidth: 2
        arcBegin: root.angle < 0 ? root.angle : 0
        arcEnd: root.angle < 0 ? 0 : root.angle
    }

    MouseArea {
        id: dialMouseArea
        anchors.fill: parent
        hoverEnabled: true
        onContainsMouseChanged:
        {
            if (!pressed)
                root.state = "out"
            if (containsMouse)
                root.state = "in"
        }

        onMouseYChanged: {
            if (pressed)
            {
                calcValue(mouseY)
            }

        }

        onPressed: {
            // store mouse x / y
            mappedcursor = mapToGlobal(mouseX,mouseY)
        }
        onPressedChanged:
        {
            // hide cursor
            if (pressed)  {
                backend.setCursorShape(Qt.BlankCursor)
            }
        }
        onReleased:
        {
            // restore cursor and set cursor to previous position
            move_Cursor()
            backend.setCursorShape(Qt.ArrowCursor)
            root.state = "in"
        }
        onWheel:
        {
            //cursorShape=Qt.BlankCursor
            var wheelStep = wheel.angleDelta.y / 120 * root.step
            // console.log(wheelStep)
            value = value + wheelStep
            value = Math.max(minimumValue, Math.min(value, maximumValue))
            angle = (value-0.5) * 360
        }
    }
    state: "out"
    states: [
        State {
            name: "in"
            PropertyChanges {target: innerCircle;scale: 0.85}
            PropertyChanges {target: progress; lineWidth: 3}
        },

        State {
            name: "out"
            PropertyChanges {target: innerCircle;scale: 1.0}
            PropertyChanges {target: progress; lineWidth: 2}
        }
    ]
    transitions: [
        Transition {
            from: "out"
            to: "in"
            PropertyAnimation{ targets: innerCircle ;properties: "scale";duration: 200}
            PropertyAnimation{ target: progress; property: progress.lineWidth;duration: 200}
        },
        Transition {
            from: "in"
            to: "out"
            PropertyAnimation{ targets:innerCircle ;properties: "scale";duration: 200}
            PropertyAnimation{ target: progress; property: progress.lineWidth;duration: 200}
        }


    ]

    function calcValue(newY)
    {
        if (newY < deltaY) {
            value = value + step
        }
        else if (newY > deltaY ) {
            value = value - step
        }
        value = Math.max(minimumValue, Math.min(value, maximumValue))
        angle = (value-0.5) * 360
        // console.log(value + "," + angle)
        deltaY = newY

    }
    function move_Cursor()
    {
        backend.moveCursor(mappedcursor)
    }
}



