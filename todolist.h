#ifndef TODOLIST_H
#define TODOLIST_H

#include <QObject>
#include <QVector>

struct ToDoItem
{
    bool done;
    QString description;
};

class ToDoList : public QObject
{
    Q_OBJECT
public:
    explicit ToDoList(QObject *parent = nullptr);

    QVector<ToDoItem> items() const;

    bool setItemAt(int index,ToDoItem &item);

signals:
    void preItemsAppended();
    void postItemsAppended();

    void preItemsRemoved(int index);
    void postItemsRemoved();

public slots:
    void appendItems();
    void removeCompletedItems();

private:
    QVector<ToDoItem> mItems;
};

#endif // TODOLIST_H
