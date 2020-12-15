#ifndef THEMEMANAGER_H
#define THEMEMANAGER_H

#include <QObject>
#include <QFont>
#include <QColor>

#define ACCENTCOLOR_BLUE   0
#define ACCENTCOLOR_RED    1
#define ACCENTCOLOR_GREEN  2
#define ACCENTCOLOR_PURPLE 3
#define ACCENTCOLOR_PINK   4
#define ACCENTCOLOR_YELLOW 5

class ThemeManager : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool darkMode READ darkMode NOTIFY darkModeChanged)
    Q_PROPERTY(QColor accentColor READ accentColor NOTIFY accentColorChanged)

public:
    explicit ThemeManager(QObject *parent = nullptr);

    bool darkMode() { return m_darkMode; }
    QColor accentColor() { return m_accentColor; }

signals:
    void darkModeChanged();
    void accentColorChanged();

private slots:
    void initData();
    void initDBusSignals();
    void onDBusDarkModeChanged(bool darkMode);
    void onDBusAccentColorChanged(int accentColorID);

private:
    void setAccentColor(int accentColorID);

private:
    bool m_darkMode;
    int m_accentColorID;

    QColor m_accentColor;
    QColor m_blueColor   = QColor(34,  115, 230); // #2273E6
    QColor m_redColor    = QColor(232, 46,  62 ); // #E82E3E
    QColor m_greenColor  = QColor(53,  191, 86 ); // #35BF56
    QColor m_purpleColor = QColor(85,  66,  195); // #5542C3
    QColor m_pinkColor   = QColor(202, 100, 172); // #CA64AC
    QColor m_yellowColor = QColor(245, 184, 0);   // #F5B800
};

#endif // THEMEMANAGER_H
