#ifndef ACCENTCOLORMANAGER_H
#define ACCENTCOLORMANAGER_H

#include <QObject>
#include <QColor>
#include <QDBusConnection>
#include <QDBusServiceWatcher>
#include <QDBusInterface>

#define ACCENTCOLOR_BLUE   0
#define ACCENTCOLOR_RED    1
#define ACCENTCOLOR_GREEN  2
#define ACCENTCOLOR_PURPLE 3
#define ACCENTCOLOR_PINK   4

class AccentColorManager : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QColor accentColor READ accentColor NOTIFY accentColorChanged)

public:
    explicit AccentColorManager(QObject *parent = nullptr);

    QColor accentColor() { return m_accentColor; }

private slots:
    void initData();
    void initDBusSignals();
    void onDBusAccentColorChanged(int accentColorID);

signals:
    void accentColorChanged();

private:
    int m_accentColorID;
    QColor m_accentColor;
    QColor m_blueColor   = QColor(34,  115, 230);
    QColor m_redColor    = QColor(232, 46,  62 );
    QColor m_greenColor  = QColor(53,  191, 86 );
    QColor m_purpleColor = QColor(85,  66,  195);
    QColor m_pinkColor   = QColor(202, 100, 172);
    void m_setAccentColor(int accentColorID);
};

#endif