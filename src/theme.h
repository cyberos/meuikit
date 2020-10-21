#ifndef THEME_H
#define THEME_H

#include <QObject>

class Theme : public QObject
{
    Q_OBJECT

public:
    explicit Theme(QObject *parent = nullptr);
};

#endif // THEME_H