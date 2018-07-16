TEMPLATE = app
TARGET = Borealis
QT += qml quick

SOURCES += \
    main.cpp \
    backend.cpp
RESOURCES += \
    Borealis.qrc
OTHER_FILES += \
    main.qml

target.path = $$[QT_INSTALL_EXAMPLES]/quickcontrols/controls/slider
INSTALLS += target

#DISTFILES += \
#    WindowForm.ui.qml \
#    Window.qml \
#    ProgressCircle.qml \
#    components/NuSlider.qml

HEADERS += \
    backend.h
