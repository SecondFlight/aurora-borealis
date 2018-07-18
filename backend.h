#ifndef BACKEND_H
#define BACKEND_H


#include <QObject>
#include <QCursor>
#include <QGuiApplication>

class BackEnd : public QObject
{
    Q_OBJECT

public:
    explicit BackEnd(QObject *parent = nullptr);

signals:

public slots:
    void moveCursor(QPointF p);
    void setCursorShape(Qt::CursorShape shape);
private:

};



#endif // BACKEND_H
