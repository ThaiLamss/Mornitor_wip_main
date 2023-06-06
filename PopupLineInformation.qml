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
    property string timeFull: "value"
    property string timeAgv: "value"
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
            spacing: 25
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
                spacing: width-displayTimeSupply.width-rectSupply.width
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
                    id: displayTimeSupply
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
            Row{
                id: row2
                width: rectLine.width
                spacing: width-displayTimeFull.width-rectFull.width
                Rectangle{
                    id: rectFull
                    color: "green"
                    height: popupRect.height/5
                    width: (row2.width)*1.9/3
                    radius: 10
                    Text {
                        color: "white"
                        text: "Đủ vật liệu sản xuất"
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
                    id: displayTimeFull
                    border.color: "Green"
                    radius: 10
                    height: popupRect.height/5
                    width: rectLine.width*0.9/3
                    Text {
                        text: timeFull
                        anchors.centerIn: parent
                        wrapMode: Text.WordWrap
                        font.pointSize: parent.height/4
                    }
                }
            }
            Row{
                id: row3
                width: rectLine.width
                spacing: width-displayTimeAgv.width-rectAgv.width
                Rectangle{
                    id: rectAgv
                    color: "purple"
                    height: popupRect.height/5
                    width: (row1.width)*1.9/3
                    radius: 10
                    Text {
                        color: "white"
                        text: "Agv đang di chuyển"
                        anchors.centerIn: parent
                        wrapMode: Text.WordWrap
                        font.pointSize: parent.height/4
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            console.log(row3.width)
                        }
                    }
                }

                Rectangle{
                    id: displayTimeAgv
                    border.color: "purple"
                    radius: 10
                    height: popupRect.height/5
                    width: rectLine.width*0.9/3
                    Text {
                        text: timeAgv
                        anchors.centerIn: parent
                        wrapMode: Text.WordWrap
                        font.pointSize: parent.height/4
                    }
                }
            }
        }

    }

}
