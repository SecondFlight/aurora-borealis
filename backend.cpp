#include "backend.h"
#include <QDebug>

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

void BackEnd::setCursorShape(Qt::CursorShape shape)
{
    switch(shape)
    {
    case Qt::CursorShape::BlankCursor:
    {
        QGuiApplication::setOverrideCursor(QCursor(shape));
        break;
    }

    case Qt::CursorShape::ArrowCursor:
        {
            QGuiApplication::restoreOverrideCursor();
            break;
        }
    default: QGuiApplication::restoreOverrideCursor();
    }
}







