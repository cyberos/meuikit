import QtQuick 2.4
import QtQuick.Window 2.3
import QtQuick.Controls 2.5
import MeuiKit 1.0 as Meui

Window {
    id: control
    visible: false
    color: "transparent"

    property string popupText
    property point position: Qt.point(0, 0)

    flags: Qt.WindowStaysOnTopHint | Qt.WindowDoesNotAcceptFocus | Qt.ToolTip
    width: label.implicitWidth + Meui.Units.largeSpacing * 2
    height: label.implicitHeight + Meui.Units.largeSpacing * 2

    Meui.RoundedRect {
        anchors.fill: parent

        Label {
            id: label
            anchors.centerIn: parent
            text: control.popupText
            color: Meui.Theme.textColor
        }
    }

    // Rectangle {
    //     anchors.fill: parent
    //     radius: 4
    //     color: Qt.rgba(Meui.Theme.backgroundColor.r,
    //                     Meui.Theme.backgroundColor.g,
    //                     Meui.Theme.backgroundColor.b,
    //                     0.8)
    //     border.width: 1
    //     border.color: Qt.tint(Meui.Theme.textColor, Qt.rgba(Meui.Theme.backgroundColor.r,
    //                                                         Meui.Theme.backgroundColor.g,
    //                                                         Meui.Theme.backgroundColor.b, 0.7))

    //     Label {
    //         id: label
    //         anchors.centerIn: parent
    //         text: control.popupText
    //         color: Meui.Theme.textColor
    //     }
    // }

    onPositionChanged: adjustCorrectLocation()

    function adjustCorrectLocation() {
        var posX = control.position.x
        var posY = control.position.y

        // left
        if (posX < 0)
            posX = Meui.Units.smallSpacing

        // top
        if (posY < 0)
            posY = Meui.Units.smallSpacing

        // right
        if (posX + control.width > Screen.desktopAvailableWidth)
            posX = Screen.desktopAvailableWidth - control.width - Meui.Units.smallSpacing

        // bottom
        if (posY > control.height > Screen.desktopAvailableWidth)
            posY = Screen.desktopAvailableWidth - control.width - Meui.Units.smallSpacing

        control.x = posX
        control.y = posY
    }

    function show() {
        if (control.popupText)
            control.visible = true
    }

    function hide() {
        control.visible = false
    }
}
