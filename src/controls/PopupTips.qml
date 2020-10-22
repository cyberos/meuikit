import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 2.5
import MeuiKit 1.0 as Meui

Window {
    id: control
    visible: false
    color: "transparent"

    property string popupText

    flags: Qt.WindowStaysOnTopHint | Qt.WindowDoesNotAcceptFocus | Qt.ToolTip
    width: label.implicitWidth + Meui.Units.largeSpacing * 2
    height: label.implicitHeight + Meui.Units.largeSpacing * 2

    Rectangle {
        anchors.fill: parent
        radius: 4
        color: Qt.rgba(Meui.Theme.backgroundColor.r,
                        Meui.Theme.backgroundColor.g,
                        Meui.Theme.backgroundColor.b,
                        0.8)
        border.width: 1
        border.color: Qt.tint(Meui.Theme.textColor, Qt.rgba(Meui.Theme.backgroundColor.r,
                                                            Meui.Theme.backgroundColor.g,
                                                            Meui.Theme.backgroundColor.b, 0.7))

        Label {
            id: label
            anchors.centerIn: parent
            text: control.popupText
            color: Meui.Theme.textColor
        }
    }

    function show() {
        if (control.popupText)
            control.visible = true
    }

    function hide() {
        control.visible = false
    }
}