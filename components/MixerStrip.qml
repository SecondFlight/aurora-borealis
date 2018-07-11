import QtQuick 2.0

Item {
    id:root
    width: 37
    height: 89
    property real fader_level:fader.value
    property int volume_level: fader.value * 87
    Row{
        id: row
        spacing: 0

        VolumeMeter{
            id: volume
            volume: root.volume_level
        }
        Fader{
            id: fader
           value: 0.5
        }

    }
}




