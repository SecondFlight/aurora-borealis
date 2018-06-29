import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4

ApplicationWindow {
	visible: true
	width: 640
	height: 480
	minimumWidth: 640
	minimumHeight: 480
	title: qsTr("Aurora")
	flags: Qt.FramelessWindowHint
	Rectangle {
		id: mainWindowBackground
		color: "#FF444444"
		width: parent.width
		height: parent.height
	}
}
