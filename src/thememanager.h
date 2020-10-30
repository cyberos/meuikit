#ifndef THEMEMANAGER_H
#define THEMEMANAGER_H

#include <QObject>
#include <QFont>
#include <QColor>

class ThemeManager : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool darkMode READ darkMode NOTIFY darkModeChanged)

public:
    explicit ThemeManager(QObject *parent = nullptr);

    bool darkMode() { return m_darkMode; }

private slots:
    void initData();
    void initDBusSignals();
    void onDBusDarkModeChanged(bool darkMode);

signals:
    void darkModeChanged();

private:
    bool m_darkMode;
};

#endif // THEMEMANAGER_H
