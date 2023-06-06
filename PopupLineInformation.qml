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
    function show(index)
    {
        lineIndex = index
        lineID = lineModel.get(index,"mLineID")
        updateData()
        visible =true;
    }
    function updateData()
    {
        if(lineIndex <0 || lineModel.get(lineIndex,"mActive")===false)
        {
            curState=-1
            return
        }
        curState = lineModel.get(lineIndex,"mStateFront")
        timeCounter = lineModel.get(lineIndex,"mTimeFront")
    }

    property int lineIndex: -1
    property int lineID:0
    property int curState: -1
    property string timeCounter: "value"
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
                spacing: width-displaytimeSupply.width-rectSupply.width
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

                        }
                    }
                }

                Rectangle{
                    id: displaytimeSupply
                    border.color: "yellow"
                    radius: 10
                    height: popupRect.height/5
                    width: rectLine.width*0.9/3
                    Text {
                        id: txtTimeSupply
                        text: timeCounter
                        anchors.centerIn: parent
                        wrapMode: Text.WordWrap
                        font.pointSize: parent.height/4
                    }
                }
            }
            Row{
                id: row2
                width: rectLine.width
                spacing: width-displaytimeFull.width-rectFull.width
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
                    id: displaytimeFull
                    border.color: "Green"
                    radius: 10
                    height: popupRect.height/5
                    width: rectLine.width*0.9/3
                    Text {
                        id: txtTimeFull
                        text: timeCounter
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
                        id: txtTimeAgv
                        text: timeCounter
                        anchors.centerIn: parent
                        wrapMode: Text.WordWrap
                        font.pointSize: parent.height/4
                    }
                }

            }


            states: [
                State {
                    id: stateUnActive
                    name: "UnActive"
                    when: curState === -1
                    PropertyChanges {
                        target: txtTimeSupply
                        visible: false
                    }
                    PropertyChanges {
                        target: displaytimeSupply
                        color: "gray"
                    }
                    PropertyChanges {
                        target: txtTimeFull
                        visible: false
                    }
                    PropertyChanges {
                        target: displaytimeFull
                        color: "gray"
                    }
                    PropertyChanges {
                        target: txtTimeAgv
                        visible: false
                    }
                    PropertyChanges {
                        target: displayTimeAgv
                        color: "gray"
                    }
                },
                State {
                    id: stateIdle
                    name: "Idle"
                    when: curState == 0
                    PropertyChanges {
                        target: txtTimeSupply
                        visible: false
                    }
                    PropertyChanges {
                        target: displaytimeSupply
                        color: "gray"
                    }
                    PropertyChanges {
                        target: txtTimeFull
                        visible: false
                    }
                    PropertyChanges {
                        target: displaytimeFull
                        color: "gray"
                    }
                    PropertyChanges {
                        target: txtTimeAgv
                        visible: false
                    }
                    PropertyChanges {
                        target: displayTimeAgv
                        color: "gray"
                    }
                },
                State {
                    id: stateWaitSupply
                    name: "waitSupply"
                    when: curState == 1
                    PropertyChanges {
                        target: txtTimeSupply
                        visible: true
                        color:"white"
                    }
                    PropertyChanges {
                        target: displaytimeSupply
                        color: "orange"
                    }
                    PropertyChanges {
                        target: txtTimeFull
                        visible: false
                    }
                    PropertyChanges {
                        target: displaytimeFull
                        color: "gray"
                    }
                    PropertyChanges {
                        target: txtTimeAgv
                        visible: false
                    }
                    PropertyChanges {
                        target: displayTimeAgv
                        color: "gray"
                    }
                },
                State {
                    id: stateAgvRun
                    name: "agvRun"
                    when: curState == 2
                    PropertyChanges {
                        target: txtTimeSupply
                        visible: false
                    }
                    PropertyChanges {
                        target: displaytimeSupply
                        color: "gray"
                    }
                    PropertyChanges {
                        target: txtTimeFull
                        visible: false
                    }
                    PropertyChanges {
                        target: displaytimeFull
                        color: "gray"
                    }
                    PropertyChanges {
                        target: txtTimeAgv
                        visible: true
                        color:"white"
                    }
                    PropertyChanges {
                        target: displayTimeAgv
                        color: "purple"
                    }
                },
                State {
                    id: stateFull
                    name: "full"
                    when: curState == 3
                    PropertyChanges {
                        target: txtTimeSupply
                        visible: false
                    }
                    PropertyChanges {
                        target: displaytimeSupply
                        color: "gray"
                    }
                    PropertyChanges {
                        target: txtTimeFull
                        visible: true
                        color:"white"
                    }
                    PropertyChanges {
                        target: displaytimeFull
                        color: "green"
                    }
                    PropertyChanges {
                        target: txtTimeAgv
                        visible: false
                    }
                    PropertyChanges {
                        target: displayTimeAgv
                        color: "gray"
                    }
                }
            ]
        }

    }

}
