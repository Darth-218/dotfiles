import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland

Item {
    width: parent ? parent.width : 28
    height: 100

    ColumnLayout {
        anchors.fill: parent
        spacing: 0
        Layout.alignment: Qt.AlignHCenter

        Repeater {
          model: Hyprland.workspaces
          delegate: Rectangle {
            id: wsRect
            property var ws: modelData
            Layout.fillWidth: true
            Layout.preferredHeight: 18    // controls vertical size
            radius: 4
            color: ws.focused ? "#ff8800" : (ws.active ? "#888888" : "#444444")

            Text {
              anchors.centerIn: parent
              text: ws.name ? ws.name : ws.id
              font.family: "JetBrains Mono"    // match rest of bar
              font.pixelSize: 12
              color: "white"
            }

            MouseArea {
              anchors.fill: parent
              onClicked: ws.activate()
            }

            Connections {
              target: ws
              function onFocusedChanged() {
                wsRect.color = ws.focused ? "#ff8800" : (ws.active ? "#888888" : "#444444")
              }
              function onActiveChanged() {
                wsRect.color = ws.focused ? "#ff8800" : (ws.active ? "#888888" : "#444444")
              }
            }
          }
        }
}
}

