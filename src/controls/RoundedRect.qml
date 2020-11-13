import QtQuick 2.4
import QtQuick.Controls 2.5
import MeuiKit 1.0 as Meui

Rectangle {
    id: control

    property real roundedRadius: Meui.Theme.smallRadius
    property color backgroundColor: Meui.Theme.darkMode ? Qt.rgba(0, 0, 0, 0.45) : Qt.rgba(255, 255, 255, 0.6)

    radius: control.roundedRadius
    color: control.backgroundColor
    border.color: Qt.rgba(0, 0, 0, 0.4)
    border.width: 1
    antialiasing: true
    smooth: true

    Behavior on color {
        ColorAnimation {
            duration: 250
        }
    }

    Rectangle {
        id: innerBorder
        anchors.fill: parent
        anchors.margins: 1
        radius: control.roundedRadius
        color: "transparent"
        border.color: Qt.rgba(255, 255, 255, 0.4)
        border.width: 1
        antialiasing: true
        smooth: true
        visible: Meui.Theme.darkMode
    }
}