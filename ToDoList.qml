import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

import ToDo 1.0


ColumnLayout
{
//    property int impheight: 250
//    property int impwidth: 500
    Frame
    {
        id: frame
        ListView
        {
            //            height: impheight
            //            width: impwidth
            implicitHeight: 250
            implicitWidth: 500
            clip: true
            //anchors.fill: parent
            //anchors.horizontalCenter: parent.horizontalCenter

            model: ToDoModel
            {
                list: toDoList
            }

            delegate: RowLayout
            {
                width: parent.width
                CheckBox
                {
                    checked: model.done
                    onClicked: model.done = checked
                }
                TextField
                {
                    Layout.fillWidth: true
                    onEditingFinished: model.description = text
                    text: model.description
                }
            }
        }
    }
    RowLayout
    {
        //anchors.horizontalCenter: frame.horizontalCenter
        Button
        {
            text: qsTr("Add new item ")
            onClicked: toDoList.appendItems()
            //Layout.fillWidth: true
//            anchors.left: frame.left
//            anchors.top: frame.top
            width: parent / 2 -1
        }
        Button
        {
            text: qsTr("Remove completed")
            onClicked: toDoList.removeCompletedItems()
            //Layout.fillWidth: true
//            anchors.right: frame.right
//            anchors.top: frame.top
            width: parent / 2 -1
        }
    }
}
