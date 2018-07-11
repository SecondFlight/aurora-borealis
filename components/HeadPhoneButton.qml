import QtQuick 2.0
import QtQuick.Controls 2.2

Button{
    id: control
    width: 28
    height: 28
    text: "\"\""
    display: AbstractButton.IconOnly

    contentItem: Image
    {
        id: headPhoneIcon
        width: 12
        height: 12
        sourceSize.height: 12
        sourceSize.width: 12
        anchors.centerIn: control
        fillMode: Image.PreserveAspectFit
        source: "../svg/HeadPhone_Icon.svg"
        opacity: 0.6
    }

    background:
       Rectangle {
            id: back
            implicitWidth: control.width
            implicitHeight: control.height
            // opacity: enabled ? 1 : 0.3
            color: Qt.rgba(1,1,1,0.12)
            border.color: Qt.rgba(0,0,0,0.40)
            border.width: 1
            radius: 1
    }
    GradientBorder {
        id: gradientborder
        width: control.width -2
        height: control.height -2
        borderWidth: 1
    }
}

