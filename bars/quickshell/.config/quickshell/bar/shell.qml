//@ pragma UseQApplication

import QtQuick
import Quickshell
import Quickshell.Wayland

ShelllRoot {
    PanelWindow {
        anchors {
            top: true
            left: true
            right: true
        }
        height: 40
        color: "#1e1e2e" // A nice Catppuccin-style dark background

        // This reserves space on the desktop
        exclusionMode: ExclusionMode.Exclusive
    }
}
