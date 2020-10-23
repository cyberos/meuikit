#include "meuikit.h"
#include "thememanager.h"
#include "iconthemeprovider.h"

#include <QDebug>
#include <QQmlEngine>
#include <QQuickStyle>

void MeuiKit::initializeEngine(QQmlEngine *engine, const char *uri)
{
    Q_ASSERT(QLatin1String(uri) == QLatin1String("MeuiKit"));

    // Set base URL to the plugin URL
    engine->setBaseUrl(baseUrl());

    // For system icons
    engine->addImageProvider(QStringLiteral("icontheme"), new IconThemeProvider());
}

void MeuiKit::registerTypes(const char *uri)
{
    Q_ASSERT(QLatin1String(uri) == QLatin1String("MeuiKit"));

    qmlRegisterSingletonType<ThemeManager>(uri, 1, 0, "ThemeManager", [](QQmlEngine *engine, QJSEngine *scriptEngine) -> QObject * {
        Q_UNUSED(engine)
        Q_UNUSED(scriptEngine)
        return new ThemeManager;
    });

    qmlRegisterSingletonType(componentUrl(QStringLiteral("Theme.qml")), uri, 1, 0, "Theme");
    qmlRegisterSingletonType(componentUrl(QStringLiteral("Units.qml")), uri, 1, 0, "Units");

    qmlRegisterType(componentUrl(QStringLiteral("PopupTips.qml")), uri, 1, 0, "PopupTips");

    qmlProtectModule(uri, 1);
}

QUrl MeuiKit::componentUrl(const QString &fileName) const
{
    return QUrl(QStringLiteral("qrc:/meui/kit/") + fileName);
}
