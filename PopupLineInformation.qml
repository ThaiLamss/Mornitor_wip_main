import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.VirtualKeyboard 2.3
import QtQuick.Layouts 1.12
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
    property string timeSupply: "value"
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
            Row{
                id: row1
                width: rectLine.width
                spacing: width-displayTimeSupple.width-rectSupply.width
                Rectangle{
                    id: rectSupply
                    color: "orange"
                    height: popupRect.height/5
                    width: (row1.width)*1.9/3
                    radius: 10
                    Text {
                        color: "white"
                        text: "Cần cung cấp vật liệu"
                        anchors.centerIn: parent
                        wrapMode: Text.WordWrap
                        font.pointSize: parent.height/4
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            console.log(row1.width)
                        }
                    }
                }

                Rectangle{
                    id: displayTimeSupple
                    border.color: "yellow"
                    radius: 10
                    height: popupRect.height/5
                    width: rectLine.width*0.9/3
                    Text {
                        text: timeSupply
                        anchors.centerIn: parent
                        wrapMode: Text.WordWrap
                        font.pointSize: parent.height/4
                    }
                }
            }
        }

    }

}
