/****************************************************************************
**
** Copyright (C) 2016 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the Qt Quick module of the Qt Toolkit.
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

import QtQuick 2.0

// Minimal slider implementation
Rectangle {
    id: slider

   // property alias text: buttonText.text
    Accessible.role: Accessible.Slider

    property int value: 50         // required
    property int minimumValue: 0  // optional (default INT_MIN)
    property int maximumValue: 100 // optional (default INT_MAX)
    property int stepSize: 1      // optional (default 1)

    width: 17
    height: 100
    border.color: "#12000000"
    border.width: 2
    radius: 2
    color:"#00000012"
    antialiasing: true

    Rectangle {
      //  visible: false
        id: indicator
        x: 1
        y: (parent.height - 2) - ((parent.height-2) / maximumValue) * value
        height: ((parent.height - 2) / maximumValue) * value
        width: parent.width - 2
        color: "#24FFFFFF"
       // color:"white"

        Behavior on y {
            NumberAnimation { duration: 100 }
        }
        Behavior on height {
            NumberAnimation { duration: 100 }
        }

    }
    Rectangle
    {
        id: line
        x: 1
        y: indicator.y
        height: 2
        width: parent.width - 2
        color: "#73FFFFFF"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
           var pos = maximumValue - mouse.y / slider.height * (maximumValue - minimumValue) + minimumValue
            console.log("mouse " + mouse.y)
            console.log("value" + pos)
            slider.value = pos
        }
//        onDragChanged: {
//            var pos = maximumValue - mouse.y / slider.height * (maximumValue - minimumValue) + minimumValue
//             console.log("mouse " + mouse.y)
//             console.log("value" + pos)
//             slider.value = pos
//        }
    }

    Keys.onLeftPressed: value > minimumValue ? value = value - stepSize : minimumValue
    Keys.onRightPressed: value < maximumValue ? value = value + stepSize : maximumValue
}
