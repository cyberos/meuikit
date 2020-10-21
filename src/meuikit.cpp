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

    qmlRegisterType<Theme>(uri, 1, 0, "Theme");
}