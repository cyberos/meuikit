import QtQuick 2.4
import QtQuick.Controls 2.4
import MeuiKit 1.0 as Meui

Item {
    id: control

    property real radius: Meui.Theme.smallRadius
    property var color: Meui.Theme.backgroundColor

    Rectangle {
        id: _border
        anchors.fill: parent
        radius: control.radius
        color: "transparent"
        border.width: 1
        border.color: Qt.rgba(0, 0, 0, 0.5)
        smooth: true
        antialiasing: true
    }

    Rectangle {
        id: _border2
        anchors.fill: parent
        anchors.margins: 1
        radius: control.radius - 1
        color: "transparent"
        border.color: Qt.rgba(255, 255, 255, 0.3)
        border.width: 1
    }

    Rectangle {
        id: _background
        anchors.fill: parent
        anchors.margins: 2
        color: control.color
        radius: control.radius - 2
        antialiasing: true
        smooth: true
    }
}