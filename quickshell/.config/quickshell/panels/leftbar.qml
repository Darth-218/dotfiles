import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io

PanelWindow {
  id: leftBar
  anchors { left: true; top: true; bottom: true }
  implicitWidth: 28
  color: "#222222"

  ColumnLayout {
    anchors.fill: parent
    spacing: 8

    // top Workspaces module
    Loader {
      source: "../modules/WorkspacesModule.qml"
      Layout.alignment: Qt.AlignHCenter
    }

    // spacer to push center content
    Item { Layout.fillHeight: true }

    // center Clock module
    Loader {
      source: "../modules/ClockModule.qml"
      Layout.alignment: Qt.AlignHCenter
    }

    // bottom spacer
    Item { Layout.fillHeight: true }

    // bottom Wifi module
    Loader {
      source: "../modules/WifiModule.qml"
      Layout.alignment: Qt.AlignHCenter
    }
  }
}

