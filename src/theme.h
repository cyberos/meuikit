#ifndef THEME_H
#define THEME_H

#include <QObject>
#include <QColor>

class Theme : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QColor textColor READ textColor NOTIFY darkModeChanged)
    Q_PROPERTY(QColor disabledTextColor READ disabledTextColor NOTIFY darkModeChanged)
    Q_PROPERTY(QColor highlightColor READ highlightColor NOTIFY darkModeChanged)
    Q_PROPERTY(QColor highlightedTextColor READ highlightedTextColor NOTIFY darkModeChanged)
    Q_PROPERTY(QColor backgroundColor READ backgroundColor NOTIFY darkModeChanged)
    Q_PROPERTY(QColor alternateBackgroundColor READ alternateBackgroundColor NOTIFY darkModeChanged)
    Q_PROPERTY(QColor activeTextColor READ activeTextColor NOTIFY darkModeChanged)
    Q_PROPERTY(QColor activeBackgroundColor READ activeBackgroundColor NOTIFY darkModeChanged)
    Q_PROPERTY(QColor linkColor READ linkColor NOTIFY darkModeChanged)
    Q_PROPERTY(QColor linkBackgroundColor READ linkBackgroundColor NOTIFY darkModeChanged)
    Q_PROPERTY(QColor visitedLinkColor READ visitedLinkColor NOTIFY darkModeChanged)
    Q_PROPERTY(QColor visitedLinkBackgroundColor READ visitedLinkBackgroundColor NOTIFY darkModeChanged)
    Q_PROPERTY(QColor buttonTextColor READ buttonTextColor NOTIFY darkModeChanged)
    Q_PROPERTY(QColor buttonBackgroundColor READ buttonBackgroundColor NOTIFY darkModeChanged)
    Q_PROPERTY(QColor buttonAlternateBackgroundColor READ buttonAlternateBackgroundColor NOTIFY darkModeChanged)
    Q_PROPERTY(QColor buttonHoverColor READ buttonHoverColor NOTIFY darkModeChanged)
    Q_PROPERTY(QColor buttonFocusColor READ buttonFocusColor NOTIFY darkModeChanged)

    Q_PROPERTY(int radius READ radius NOTIFY darkModeChanged)

public:
    explicit Theme(QObject *parent = nullptr);

    QColor textColor() { return QColor("#31363b"); }
    QColor disabledTextColor() { return QColor("#9931363b"); }

    QColor highlightColor() { return QColor("#1485FF"); }
    QColor highlightedTextColor() { return QColor("#eff0fa"); }
    QColor backgroundColor() { return QColor("#FFFFFF"); }
    QColor alternateBackgroundColor() { return QColor("#bdc3c7"); }

    QColor activeTextColor() { return QColor("#0176D3"); }
    QColor activeBackgroundColor() { return QColor("#0176D3"); }
    QColor linkColor() { return QColor("#2196F3"); }
    QColor linkBackgroundColor() { return QColor("#2196F3"); }
    QColor visitedLinkColor() { return QColor("#2196F3"); }
    QColor visitedLinkBackgroundColor() { return QColor("#2196F3"); }

    QColor buttonTextColor() { return QColor("#31363b"); }
    QColor buttonBackgroundColor() { return QColor("#eff0f1"); }
    QColor buttonAlternateBackgroundColor() { return QColor("#bdc3c7"); }
    QColor buttonHoverColor() { return QColor("#2196F3"); }
    QColor buttonFocusColor() { return QColor("#2196F3"); }

    int radius() { return 8; }

signals:
    void darkModeChanged();
};

#endif // THEME_H
