#include "backend.h"

BackEnd::BackEnd(QObject *parent) :
    QObject(parent)
{
}

void BackEnd::moveCursor(QPointF p)
{
    int x = p.x();
    int y = p.y();
    cursor.setPos(x,y);
}
