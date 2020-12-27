import QtQuick 2.15
import QtQuick.Window 2.3
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Shapes 1.12
import QtGraphicalEffects 1.0
import MeuiKit 1.0 as Meui

Window {
    id: root
    width: 640
    height: 480
    visible: true
    flags: Qt.FramelessWindowHint

    color: "transparent"

    property var edgeSize: 8

    property alias headerBar : _header.sourceComponent
    property alias content: _content.data

    function toggleMaximized() {
        if (root.visibility === Window.Maximized) {
            root.showNormal();
        } else {
            root.showMaximized();
        }
    }

    // Left top edge
    MouseArea {
        height: edgeSize
        width: height
        anchors.top: parent.top
        anchors.left: parent.left
        cursorShape: Qt.SizeFDiagCursor
        propagateComposedEvents: true
        preventStealing: false
        z: 999

        onPressed: mouse.accepted = false

        DragHandler {
            grabPermissions: TapHandler.CanTakeOverFromAnything
            target: null
            onActiveChanged: if (active) { root.startSystemResize(Qt.LeftEdge | Qt.TopEdge) }
        }
    }

    // Right top edge
    MouseArea {
        height: edgeSize
        width: height
        anchors.top: parent.top
        anchors.right: parent.right
        cursorShape: Qt.SizeBDiagCursor
        propagateComposedEvents: true
        preventStealing: false
        z: 999

        onPressed: mouse.accepted = false

        DragHandler {
            grabPermissions: TapHandler.CanTakeOverFromAnything
            target: null
            onActiveChanged: if (active) { root.startSystemResize(Qt.RightEdge | Qt.TopEdge) }
        }
    }

    // Left bottom edge
    MouseArea {
        height: edgeSize
        width: height
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        cursorShape: Qt.SizeBDiagCursor
        propagateComposedEvents: true
        preventStealing: false
        z: 999

        onPressed: mouse.accepted = false

        DragHandler {
            grabPermissions: TapHandler.CanTakeOverFromAnything
            target: null
            onActiveChanged: if (active) { root.startSystemResize(Qt.LeftEdge | Qt.BottomEdge) }
        }
    }

    // Right bottom edge
    MouseArea {
        height: edgeSize
        width: height
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        cursorShape: Qt.SizeFDiagCursor
        propagateComposedEvents: true
        preventStealing: false
        z: 999

        onPressed: mouse.accepted = false

        DragHandler {
            grabPermissions: TapHandler.CanTakeOverFromAnything
            target: null
            onActiveChanged: if (active) { root.startSystemResize(Qt.RightEdge | Qt.BottomEdge) }
        }
    }

    // Bottom edge
    MouseArea {
        height: edgeSize
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.leftMargin: edgeSize
        anchors.rightMargin: edgeSize
        cursorShape: Qt.SizeVerCursor
        z: 999

        onPressed: mouse.accepted = false

        DragHandler {
            grabPermissions: TapHandler.CanTakeOverFromAnything
            target: null
            onActiveChanged: if (active) { root.startSystemResize(Qt.BottomEdge) }
        }
    }

    // Top edge
    MouseArea {
        height: edgeSize
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.leftMargin: edgeSize
        anchors.rightMargin: edgeSize
        cursorShape: Qt.SizeVerCursor
        z: 999

        onPressed: mouse.accepted = false

        DragHandler {
            grabPermissions: TapHandler.CanTakeOverFromAnything
            target: null
            onActiveChanged: if (active) { root.startSystemResize(Qt.TopEdge) }
        }
    }

    // Left edge
    MouseArea {
        width: edgeSize
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: edgeSize
        anchors.bottomMargin: edgeSize
        cursorShape: Qt.SizeHorCursor
        z: 999

        onPressed: mouse.accepted = false

        DragHandler {
            grabPermissions: TapHandler.CanTakeOverFromAnything
            target: null
            onActiveChanged: if (active) { root.startSystemResize(Qt.LeftEdge) }
        }
    }

    // Right edge
    MouseArea {
        width: edgeSize
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: edgeSize
        anchors.bottomMargin: edgeSize
        cursorShape: Qt.SizeHorCursor
        z: 999

        onPressed: mouse.accepted = false

        DragHandler {
            grabPermissions: TapHandler.CanTakeOverFromAnything
            target: null
            onActiveChanged: if (active) { root.startSystemResize(Qt.RightEdge) }
        }
    }

    Rectangle {
        id: _background
        anchors.fill: parent
        anchors.margins: 0
        radius: Meui.Theme.bigRadius
        color: Meui.Theme.backgroundColor
        antialiasing: true

        Rectangle {
            anchors.fill: parent
            color: "transparent"
            radius: parent.radius
            border.color: "black"
            opacity: 0.7
            antialiasing: true
            visible: root.visibility !== Window.Maximized
            z: 999
        }

        Rectangle {
            anchors.fill: parent
            anchors.margins: 1
            color: "transparent"
            radius: parent.radius
            border.color: Meui.Theme.disabledTextColor
            antialiasing: true
            visible: root.visibility !== Window.Maximized && Meui.Theme.darkMode
            z: 999
        }

        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: Item {
                width: _background.width
                height: _background.height

                Rectangle {
                    anchors.fill: parent
                    radius: _background.radius
                }
            }
        }

        ColumnLayout {
            anchors.fill: parent

            Item {
                id: _titlebar
                Layout.fillWidth: true
                height: 40

                Item {
                    anchors.fill: parent

                    TapHandler {
                        onTapped: if (tapCount === 2) toggleMaximized()
                        gesturePolicy: TapHandler.DragThreshold
                    }

                    DragHandler {
                        acceptedDevices: PointerDevice.GenericPointer
                        grabPermissions:  PointerHandler.CanTakeOverFromItems | PointerHandler.CanTakeOverFromHandlersOfDifferentType | PointerHandler.ApprovesTakeOverByAnything
                        onActiveChanged: if (active) { root.startSystemMove() }
                    }
                }

                RowLayout {
                    anchors.fill: parent
                    anchors.topMargin: edgeSize / 2
                    anchors.leftMargin: edgeSize
                    anchors.rightMargin: Meui.Units.smallSpacing
                    spacing: Meui.Units.largeSpacing

                    Loader {
                        id: _header
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                    }

                    WindowButton {
                        size: _titlebar.height * 0.9
                        source: "qrc:/meui/kit/images/" + (Meui.Theme.darkMode ? "dark/" : "light/") + "minimize.svg"
                        onClicked: root.showMinimized()
                    }

                    WindowButton {
                        size: _titlebar.height * 0.9
                        source: "qrc:/meui/kit/images/" + (Meui.Theme.darkMode ? "dark/" : "light/") + "maximize.svg"
                        onClicked: root.toggleMaximized()
                    }

                    WindowButton {
                        size: _titlebar.height * 0.9
                        source: "qrc:/meui/kit/images/" + (Meui.Theme.darkMode ? "dark/" : "light/") + "close.svg"
                        onClicked: root.close()
                    }
                }
            }

            Item {
                Layout.fillHeight: true
                Layout.fillWidth: true

                RowLayout {
                    id: _content
                    anchors.fill: parent
                    anchors.rightMargin: edgeSize / 2
                }
            }
        }
    }
}
