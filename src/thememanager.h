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

    bool darkMode() { return m_isDarkMode; }

signals:
    void darkModeChanged();

private:
    bool m_isDarkMode;
};

#endif // THEMEMANAGER_H
