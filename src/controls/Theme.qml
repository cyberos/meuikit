pragma Singleton

import QtQuick 2.4
import MeuiKit.Core 1.0 as MeuiKitCore

QtObject {
    id: theme

    property bool darkMode: MeuiKitCore.ThemeManager.darkMode

    property color backgroundColor: darkMode ? "#3B3B3D" : "#FFFFFF"
    property color textColor: darkMode ? "#FFFFFF" : "#31363b"
    property color disabledTextColor: darkMode ? "#424242" : "#9931363b"

    property color highlightColor: darkMode ? "#3F72FF" : "#3F72FF"
    property color highlightedTextColor: darkMode ? "#CCCCCC" : "#eff0fa"

    property color activeTextColor: "#0176D3"
    property color activeBackgroundColor: "#0176D3"

    property color linkColor: "#2196F3"
    property color linkBackgroundColor: "#2196F3"
    property color visitedLinkColor: "#2196F3"
    property color visitedLinkBackgroundColor: "#2196F3"

    property font defaultFont: fontMetrics.font
    property font smallFont: {
        let font = fontMetrics.font
        if (!!font.pixelSize) {
            font.pixelSize =- 2
        } else {
            font.pointSize =- 2
        }
        return font
    }

    property list<QtObject> children: [
        TextMetrics {
            id: fontMetrics
        }
    ]
    function __propagateColorSet(object, context) {}
    function __propagateTextColor(object, color) {}
    function __propagateBackgroundColor(object, color) {}
    function __propagatePrimaryColor(object, color) {}
    function __propagateAccentColor(object, color) {}
}