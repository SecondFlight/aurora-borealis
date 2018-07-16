#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QCursor>

class BackEnd : public QObject
{
    Q_OBJECT

public:
    explicit BackEnd(QObject *parent = nullptr);

signals:

public slots:
    void moveCursor();

private:
    QCursor cursor;
};

#endif // BACKEND_H
