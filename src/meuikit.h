#ifndef PLUGIN_H
#define PLUGIN_H

#include <QtQml/QQmlExtensionPlugin>

class Plugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlExtensionInterface_iid)

public:
    void initializeEngine(QQmlEngine *engine, const char *uri);
    void registerTypes(const char *uri);
};

#endif // PLUGIN_H