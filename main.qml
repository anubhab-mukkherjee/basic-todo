import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

ApplicationWindow
{
    visible: true
    width: 640
    height: 480
    title: qsTr("Tabs")

    FontLoader
    {
        id: dancing
        source: "qrc:/DancingScript-Regular.ttf"
    }
    ColumnLayout
    {
        anchors.horizontalCenter: parent.horizontalCenter
        Text
        {
            id: heading
            //y: 32
            text: qsTr("Your ToDo List")
            font.family: dancing.name
            font.pixelSize: 50
            //anchors.horizontalCenter: parent.horizontalCenter
        }

        ToDoList
        {
            id: todo
            width: 400
            height: 400
        }
    }
}
