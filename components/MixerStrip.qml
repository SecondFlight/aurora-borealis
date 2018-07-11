import QtQuick 2.0
import QtQuick.Controls 2.2


// for demo purpose only
//    property real fader_level:fader.value
//    property int volume_level: fader.value * 87
Column{
    id:root
    width: 77
    height: 272
    Item {
        id:clipHeader
        clip:true
        height: 21
        width:root.width
        Rectangle
        {
            id:header
            width: root.width
            height: clipHeader.height+1
            radius:1
            color: Qt.rgba(1,1,1,0.05)
            Text{
                anchors.fill: parent
                text: "FX1"
                font.pixelSize: 11
                font.family: "Noto Sans"
                color: Qt.rgba(1,1,1,0.6)


            }
        }
    }
    Rectangle {
        id: spacer
        height: 1
        color: "#00000000"
        width: root.width

    }

    Rectangle {
        id: middle
        width:root.width
        height: 137
        color: Qt.rgba(0,0,0,0.08)
        Column{
            spacing: 1
            Plugin{text: "Zyn Fusion"}
            Plugin{text: "SoundGoodizer"}
            Plugin{text: "OTT"}

        }
    }

    Item {
        id:clipBottom
        width:root.width
        height:153
        clip:true
        Rectangle {
            id: bottomPart
            anchors.bottom:parent.bottom
            height: 154
            color: Qt.rgba(1,1,1,0.05)
            width: root.width
            radius: 1

            Rectangle {
                id: rectangle
                y: 135
                width: 28
                height: 28
                color: "#37a483"
                radius: 1
                border.color: "#000000"
                anchors.left: parent.left
                anchors.leftMargin: 4
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 4

                Text {
                    id: text1
                    text: qsTr("1")
                    anchors.centerIn: parent
                    color: Qt.rgba(0,0,0,0.6)
                    font.pixelSize: 11
                }
            }
        }
        Rectangle{
            id: tempButton

            width: 20
            height: 20
            color: Qt.rgba(1,1,1,0.12)
            border.color: Qt.rgba(0,0,0,0.40)
            border.width: 1
            radius: 1
            anchors.right: parent.right
            anchors.rightMargin: 4
            anchors.top: parent.top
            anchors.topMargin: 4
            Text {
                text: "+"
                anchors.centerIn: parent
                color: Qt.rgba(1,1,1,0.6)
            }

        }
        Panner{
            anchors.top: parent.top
            anchors.topMargin: 28
            anchors.left: parent.left
            anchors.leftMargin: 4
            value:0.5
        }
        HeadPhoneButton {
            anchors.top: parent.top
            anchors.topMargin: 90
            anchors.left: parent.left
            anchors.leftMargin: 4
        }

        Row{
            id:row
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            anchors.right: parent.right
            anchors.rightMargin: 4
            spacing: 0
            VolumeMeter{
                id: volume
                volume: 75
            }
            Fader{
                id: fader
                value: 0.75
            }
        }
        Rectangle {
            width: 37
            height:14
            color: Qt.rgba(0,0,0,0.15)
            border.color: Qt.rgba(0,0,0,0.40)
            border.width: 1
            radius: 1
            anchors.right: parent.right
            anchors.rightMargin: 4
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 4
            Text {
                color: "#37a483"
                anchors.centerIn: parent
                text: "-40.06"
                font.family: "Noto Sans"
                font.pixelSize: 11
                horizontalAlignment: Text.AlignHCenter
            }

        }
        Rectangle {
            width: 37
            height:14
            color: Qt.rgba(0,0,0,0.15)
            border.color: Qt.rgba(0,0,0,0.40)
            border.width: 1
            radius: 1
            anchors.top: parent.top
            anchors.topMargin: 28
            anchors.right: parent.right
            anchors.rightMargin: 4
            Text {
                color: "#37a483"
                anchors.centerIn: parent
                text: "-inf"
                font.family: "Noto Sans"
                font.pixelSize: 11
                horizontalAlignment: Text.AlignHCenter
            }

        }

    }
}






//    Row{
//        id: row
//        spacing: 0
//        VolumeMeter{
//            id: volume
//            volume: root.volume_level
//        }
//        Fader{
//            id: fader
//            value: 0.5
//        }

//    }





