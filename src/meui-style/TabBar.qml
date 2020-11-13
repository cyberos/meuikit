import QtQuick 2.6
import QtQuick.Templates 2.3 as T
import MeuiKit 1.0 as Meui

T.TabBar {
    id: control

    implicitWidth: Math.max(background.implicitWidth, contentItem.implicitWidth + Meui.Units.smallSpacing)
    implicitHeight: contentItem.implicitHeight

    spacing: 0

    contentItem: ListView {
        implicitWidth: contentWidth
        implicitHeight: control.contentModel.get(0).height

        model: control.contentModel
        currentIndex: control.currentIndex

        spacing: control.spacing
        orientation: ListView.Horizontal
        boundsBehavior: Flickable.StopAtBounds
        flickableDirection: Flickable.AutoFlickIfNeeded
        snapMode: ListView.SnapToItem

        highlightMoveDuration: 0
        highlightResizeDuration: 0
        highlightFollowsCurrentItem: true
        highlightRangeMode: ListView.ApplyRange
        preferredHighlightBegin: 48
        preferredHighlightEnd: width - 48

        highlight: Item {
            Rectangle {
                anchors {
                    fill: parent
                    margins: 2
                }
                color: Meui.Theme.darkMode ? Qt.lighter(Meui.Theme.backgroundColor, 1.6) : Meui.Theme.backgroundColor
                radius: Meui.Theme.smallRadius
            }
        }
    }

    background: Rectangle {
        color: Meui.Theme.darkMode ? Qt.lighter(control.Meui.Theme.viewBackgroundColor, 1.4)
                                   : Qt.darker(control.Meui.Theme.viewBackgroundColor, 1.05)
        radius: Meui.Theme.smallRadius
    }
}