import Quickshell
import QtQuick

Item {
    width: parent ? parent.width : 28
    height: 64

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }

    Text {
        anchors.centerIn: parent
        text: Qt.formatDateTime(clock.date, "dd\n-\nhh\nmm")
        font.family: "JetBrains Mono"
        font.pixelSize: 12
        color: "white"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WrapAnywhere
    }
}

