#include "todolist.h"

ToDoList::ToDoList(QObject *parent) : QObject(parent)
{
    mItems.append({true,"Wash the car"});
    mItems.append({false,"Fix the sink"});
}

QVector<ToDoItem> ToDoList::items() const
{
    return mItems;
}

bool ToDoList::setItemAt(int index, ToDoItem &item)
{
    if(index < 0 || index >= mItems.size())
        return false;

    const ToDoItem &oldItem = mItems.at(index);
    if(item.done == oldItem.done && item.description == oldItem.description)
        return false;

    mItems[index] = item;
    return true;
}

void ToDoList::appendItems()
{
    emit preItemsAppended();

    ToDoItem item;
    item.done = false;
    mItems.append(item);

    emit postItemsAppended();
}

void ToDoList::removeCompletedItems()
{
    for (int i=0;i<mItems.size();)
    {
        if(mItems.at(i).done)
        {
            emit preItemsRemoved(i);

            mItems.removeAt(i);

            emit postItemsRemoved();
        }
        else
        {
            ++i;
        }
    }
}
