import QtQuick 2.6
import QtQuick.Templates 2.3 as T
import QtGraphicalEffects 1.0
import MeuiKit 1.0 as Meui

T.Slider {
    id: control

    property int sliderTrackHeight: 5

    implicitWidth: background.implicitWidth
    implicitHeight: background.implicitHeight
    snapMode: T.Slider.SnapOnRelease

    handle: Rectangle {
        id: handleRect
        x: control.leftPadding + (control.horizontal ? control.visualPosition * (control.availableWidth - width) : (control.availableWidth - width) / 2)
        y: control.topPadding + (control.horizontal ? (control.availableHeight - height) / 2 : control.visualPosition * (control.availableHeight - height))

        width: Meui.Units.iconSizes.medium
        height: width
        radius: width / 2
        color: "white"
        border.color: Qt.tint(Meui.Theme.textColor, Qt.rgba(Meui.Theme.backgroundColor.r,
                                                            Meui.Theme.backgroundColor.g,
                                                            Meui.Theme.backgroundColor.b, 0.7))

        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
            radius: 16
            samples: 5
            horizontalOffset: 0
            verticalOffset: 0
            color: Qt.rgba(0, 0, 0, 0.11)
        }
    }

    background: Item {
        implicitWidth: control.horizontal ? 200 : 18
        implicitHeight: control.horizontal ? 18 : 200

        x: control.leftPadding + (control.horizontal ? 0 : (control.availableWidth - width) / 2)
        y: control.topPadding + (control.horizontal ? (control.availableHeight - height) / 2 : 0)
        width: control.horizontal ? control.availableWidth : implicitWidth
        height: control.horizontal ? implicitHeight : control.availableHeight

        scale: control.horizontal && control.mirrored ? -1 : 1

        Rectangle {
            x: control.horizontal ? 0 : (parent.width - width) / 2
            y: control.horizontal ? (parent.height - height) / 2 : 0
            width: control.horizontal ? parent.width : sliderTrackHeight
            height: !control.horizontal ? parent.height : sliderTrackHeight
            radius: !control.horizontal ? parent.width / 2 : sliderTrackHeight / 2
            color: Meui.Theme.darkMode ? Qt.rgba(255, 255, 255, 0.5) : Qt.rgba(0, 0, 0, 0.3)
        }

        Rectangle {
            x: control.horizontal ? 0 : (parent.width - width) / 2
            y: control.horizontal ? (parent.height - height) / 2 : control.visualPosition * parent.height
            width: control.horizontal ? control.position * parent.width : sliderTrackHeight
            height: !control.horizontal ? control.position * parent.height : sliderTrackHeight
            radius: !control.horizontal ? parent.width / 2 : sliderTrackHeight / 2

            color: control.Meui.Theme.highlightColor
        }
    }
}
