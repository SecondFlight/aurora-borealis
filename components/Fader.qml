import QtQuick 2.0
import QtQuick.Controls 2.2

Item {
    id: root
    property alias value: fader.value
    implicitWidth: fader_container.width
    implicitHeight: fader_container.height

    Rectangle {
        id: fader_container
        height: 89
        width: 19
        color: "transparent"
        border.color: Qt.rgba(0, 0, 0, 0.4)
        radius: 2
        antialiasing: true

        Slider {
            id: fader
            value: 0.5
            wheelEnabled: true
            hoverEnabled: true
            orientation: Qt.Vertical
            height: fader_container.height - 2
            width: fader_container.width - 2
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter


            background: Rectangle {
                width: fader.width
                height: fader.height
                anchors.horizontalCenter: fader.horizontalCenter
                antialiasing: true
                color: Qt.rgba(0, 0, 0, 0.07)
                radius: 2

                Rectangle {
                    y: fader.visualPosition * parent.height
                    width: fader.width
                    height: fader.position * parent.height
                    color: Qt.rgba(1, 1, 1, .14)
                }
                Item {
                    id: dBlabels
                    height: fader.height
                    width: fader.width
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

            }
            handle: Rectangle {
                x: fader.leftPadding + (fader.availableWidth - width) / 2
                y: fader.visualPosition * (fader.height -1)
                width: fader.width
                height: 1
                color: "#1BC18F"
            }
        }
    }

}
