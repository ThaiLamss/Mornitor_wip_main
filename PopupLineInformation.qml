import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.VirtualKeyboard 2.3

Popup {

    id: root
    visible: false
    modal: true
    focus: true
    closePolicy: Popup.CloseOnEscape|Popup.CloseOnPressOutside
    function show(line)
    {
        lineID = line
        visible =true;
    }

    property int lineID:0
    Rectangle
    {
        id: popupRect
        anchors.centerIn: parent
        height: root.height+20
        width: root.width+20
        color:"lightgray"
        radius:20
        Column {
            anchors.centerIn: parent
            spacing: 10
            Rectangle{
                id: rectLine
                width: popupRect.width *9/10
                height: popupRect.height/5
                radius: 10
                color: "blue"
                Text {
                    id: txtLineID
                    color: "white"
                    text: "Line "+root.lineID
                    anchors.centerIn: parent
                    wrapMode: Text.WordWrap
                    font.pointSize: parent.height*2/3
                }
            }
        }

    }

}
