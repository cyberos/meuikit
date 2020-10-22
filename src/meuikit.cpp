#include "meuikit.h"
#include "theme.h"
#include "iconthemeprovider.h"

#include <QDebug>
#include <QQmlEngine>

void Plugin::initializeEngine(QQmlEngine *engine, const char *uri)
{
    Q_ASSERT(QLatin1String(uri) == QLatin1String("MeuiKit"));

    // Set base URL to the plugin URL
    engine->setBaseUrl(baseUrl());

    // For system icons
    engine->addImageProvider(QStringLiteral("icontheme"), new IconThemeProvider());
}

void Plugin::registerTypes(const char *uri)
{
    Q_ASSERT(QLatin1String(uri) == QLatin1String("MeuiKit"));

    qmlRegisterSingletonType(componentUrl(QStringLiteral("Units.qml")), uri, 1, 0, "Units");

    qmlRegisterSingletonType<Theme>(uri, 1, 0, "Theme", [](QQmlEngine *engine, QJSEngine *scriptEngine) -> QObject * {
        Q_UNUSED(engine)
        Q_UNUSED(scriptEngine)
        return new Theme;
    });
}

QUrl Plugin::componentUrl(const QString &fileName) const
{
    return QUrl(QStringLiteral("qrc:/meui/kit/") + fileName);
}
