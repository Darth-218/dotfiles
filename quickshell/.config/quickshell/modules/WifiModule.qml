import QtQuick
import Quickshell
import Quickshell.Io

Item {
    width: parent ? parent.width : 28
    height: 28

    property string connType: "none"  // wifi / ethernet / none

    // --- FileView reads network status JSON ---
    FileView {
        id: netFile
        path: "/home/darth/.config/quickshell/scripts/network-status.json"

        onFileChanged: {
            if (content) {
                try {
                    var data = JSON.parse(content)
                    connType = data.type
                } catch(e) {
                    console.log("JSON parse error:", e)
                }
            }
        }
    }

    // --- Display Nerd Font icon ---
    Text {
        anchors.centerIn: parent
        font.family: "JetBrains Mono Nerd Font"
        font.pixelSize: 12
        color: "white"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        text: {
          "t"
            // if (connType === "none") "\uF07F"        // disconnected
            // else if (connType === "wifi") "\uF1EB"   // wifi
            // else if (connType === "ethernet") "\uF796" // ethernet
            // else "\uF07F"
        }
    }
}

