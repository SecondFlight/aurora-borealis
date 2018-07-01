/****************************************************************************
**
** Copyright (C) 2016 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.2
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Aurora Slider")
    color: "#3b3b3b"
    Item{
        id: backgr
         anchors.fill : parent
        Image {
            id: bg
            source: "images/panama.jpg"
            sourceSize: Qt.size(parent.width, parent.height)
            smooth: true
            fillMode: Image.PreserveAspectCrop
            visible: false
        }
        FastBlur {
            id: blurredbg
            visible: false
            anchors.fill: bg
            source: bg
            radius: 64
            transparentBorder: true
        }
    }
    Button {
        text: "Background"
        onClicked: blurredbg.visible = !blurredbg.visible
    }

    Rectangle{
        id: slider_container
        height: 105
        width: 18
        color : "transparent"
        border.color: Qt.rgba(0,0,0,0.4)
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        radius: 2
        antialiasing: true

        Slider {
            id: slider
            value: 0.5
            orientation: Qt.Vertical
            height: 103
            width: 16
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            background: Rectangle {
                        width: slider.width
                        height: slider.height
                        anchors.horizontalCenter: slider.horizontalCenter
                        antialiasing: true
                        color: Qt.rgba(0,0,0,0.07)
                        radius: 2

                        Rectangle {
                            y: slider.visualPosition * parent.height
                            width: slider.width
                            height: slider.position * parent.height
                            color: Qt.rgba(1,1,1,.14)
                         }
                    }
            handle: Rectangle {
                x: slider.leftPadding + (slider.availableWidth - width) / 2
                y: slider.visualPosition * parent.height
                width: 16
                height: 2
                color: slider.pressed ? Qt.rgba(1,1,1,0.75)  :  Qt.rgba(1,1,1,0.45)
            }

            }
        }
}
