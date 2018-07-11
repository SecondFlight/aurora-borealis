import QtQuick 2.0
import QtQuick.Controls 2.2

Item {
    id:root
    property alias value : control.value
    implicitWidth: control.width
    implicitHeight: control.height

    Dial {
        id: control
        value: 0
        width: 19
        height: 19
        stepSize: 5.0
        to: 180
        from: -180
        wheelEnabled: true
        hoverEnabled: true
        snapMode: Dial.SnapAlways

        background: Rectangle {
            id: line1
            width: 28
            height: 28
            border.width: 2
            border.color: Qt.rgba(0, 0, 0, 0.40)
            color: "transparent"
            radius: width / 2

            Rectangle {
                id: line2
                anchors.centerIn: parent
                width: 26
                height: 26
                border.width: 2
                border.color: Qt.rgba(0, 0, 0, 0.07)
                color: "transparent"
                radius: width / 2
            }

            Rectangle {
                id: line3
                anchors.centerIn: parent
                width: 22
                height: 22
                color: Qt.rgba(1, 1, 1, 0.12)
                border.color: Qt.rgba(0, 0, 0, 0.40)
                border.width: 1
                radius: width / 2
            }

            Rectangle {
                id: line4
                anchors.centerIn: parent
                width: 20
                height: 20
                border.width: 1
                border.color: Qt.rgba(1, 1, 1, 0.10)
                color: Qt.rgba(0, 0, 0, 0)
                radius: width / 2
            }

            Rectangle {
                id: dot
                visible: Math.round(control.value) == 0 ? true : false
                width: 2
                height: 2
                radius: width / 2
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 6
            }
            ProgressCircle {
                id: progress
                colorCircle: "#1BC18F"
                colorBackground: "#00000000"
                anchors.centerIn: parent
                animationDuration: 10
                beginAnimation: true
                size: line1.width - 3
                lineWidth: 2
                endAnimation: true
                arcBegin: control.angle < 0 ? control.angle / 140 * 180 : 0
                arcEnd: control.angle < 0 ? 0 : control.angle / 140 * 180
            }
        }

        handle: Rectangle {
            id: handleItem
            // override the default handle
        }

}
}
