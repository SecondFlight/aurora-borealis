TEMPLATE = app
TARGET = slider
QT += qml quick

SOURCES += \
    main.cpp
RESOURCES += \
    slider.qrc
OTHER_FILES += \
    main.qml

target.path = $$[QT_INSTALL_EXAMPLES]/quickcontrols/controls/slider
INSTALLS += target
