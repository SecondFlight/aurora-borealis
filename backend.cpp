#include "backend.h"

BackEnd::BackEnd(QObject *parent) :
    QObject(parent)
{
}

void BackEnd::moveCursor()
{
    cursor.setPos(0,0);
}
