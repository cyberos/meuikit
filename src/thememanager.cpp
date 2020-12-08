#include "thememanager.h"

#include <QDBusConnection>
#include <QDBusServiceWatcher>
#include <QDBusInterface>
#include <QDebug>

static const QString Service = "org.cyber.Settings";
static const QString ObjectPath = "/Theme";
static const QString Interface = "org.cyber.Theme";

ThemeManager::ThemeManager(QObject *parent) 
    : QObject(parent)
    , m_darkMode(false)
{
    QDBusServiceWatcher *serviceWatcher = new QDBusServiceWatcher(Service, QDBusConnection::sessionBus(),
                                                                  QDBusServiceWatcher::WatchForRegistration);
    connect(serviceWatcher, &QDBusServiceWatcher::serviceRegistered, this, [=] {
        initData();
        initDBusSignals();
    });

    initDBusSignals();
    initData();
}

void ThemeManager::initData()
{
    QDBusInterface iface(Service, ObjectPath, Interface, QDBusConnection::sessionBus(), this);

    if (iface.isValid()) {
        m_darkMode = iface.property("isDarkMode").toBool();

        emit darkModeChanged();
    }
}

void ThemeManager::initDBusSignals()
{
    QDBusInterface iface(Service, ObjectPath, Interface, QDBusConnection::sessionBus(), this);

    if (iface.isValid()) {
        QDBusConnection::sessionBus().connect(Service, ObjectPath, Interface, "darkModeChanged",
                                              this, SLOT(onDBusDarkModeChanged(bool)));
    }
}

void ThemeManager::onDBusDarkModeChanged(bool darkMode)
{
    if (m_darkMode != darkMode) {
        m_darkMode = darkMode;

        emit darkModeChanged();
    }
}
