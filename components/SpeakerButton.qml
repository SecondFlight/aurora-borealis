import QtQuick 2.0
import QtQuick.Controls 2.2

Item {
    id:root
    width: 28
    height: 28

    Button{
        id: control
        width: root.width
        height: root.height
        text: "\"\""
        display: AbstractButton.IconOnly

        contentItem: Image
        {
            id: speakerIcon
            width: 12
            height: 12
            sourceSize.height: 12
            sourceSize.width: 12
            anchors.centerIn: control
            fillMode: Image.PreserveAspectFit
            source: "../svg/Speaker_Icon.svg"
            opacity: 0.6
        }

        background:
           Rectangle {
                id: greenBack
                implicitWidth: root.width - 2
                implicitHeight: root.height - 2
                anchors.centerIn: control
                // opacity: enabled ? 1 : 0.3
                color: "#37A583"
                radius: 1
                antialiasing: true
//                border.width: 1
//                border.color: Qt.rgba(0,0,0,0.40)


        }
        Rectangle {
            id: border
            implicitHeight: root.height
            implicitWidth: root.width
            radius: 1
            color: "transparent"
            border.width: 1
            border.color: Qt.rgba(0,0,0,0.40)
            antialiasing: true
        }

        GradientBorder {
            id: gradientborder
            width: root.width -2
            height: root.height -2
            borderWidth: 1
            radius:1
        }
    }

}

