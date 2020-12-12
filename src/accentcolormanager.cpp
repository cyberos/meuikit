#include "accentcolormanager.h"

static const QString Service = "org.cyber.Settings";
static const QString ObjectPath = "/Theme";
static const QString Interface = "org.cyber.Theme";

AccentColorManager::AccentColorManager(QObject *parent)
    : QObject(parent)
    , m_accentColor(m_blueColor)
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

// Helper function
void AccentColorManager::m_setAccentColor(int accentColorID) {
    if (m_accentColorID == accentColorID)
        return;
    m_accentColorID = accentColorID;

    switch(accentColorID) {
        default:
        case ACCENTCOLOR_BLUE:
            m_accentColor = m_blueColor;
            break;
        case ACCENTCOLOR_RED:
            m_accentColor = m_redColor;
            break;
        case ACCENTCOLOR_GREEN:
            m_accentColor = m_greenColor;
            break;
        case ACCENTCOLOR_PURPLE:
            m_accentColor = m_purpleColor;
            break;
        case ACCENTCOLOR_PINK:
            m_accentColor = m_pinkColor;
            break;
    }

    emit accentColorChanged();
}

void AccentColorManager::initData()
{
    QDBusInterface iface(Service, ObjectPath, Interface, QDBusConnection::sessionBus(), this);

    if (iface.isValid()) {
        int accentColorID = iface.property("accentColor").toInt();
        m_setAccentColor(accentColorID);
    }
}

void AccentColorManager::initDBusSignals()
{
    QDBusInterface iface(Service, ObjectPath, Interface, QDBusConnection::sessionBus(), this);

    if (iface.isValid()) {
        QDBusConnection::sessionBus().connect(Service, ObjectPath, Interface, "accentColorChanged",
                                              this, SLOT(onDBusAccentColorChanged(int)));
    }
}

void AccentColorManager::onDBusAccentColorChanged(int accentColorID) {
    m_setAccentColor(accentColorID);
}