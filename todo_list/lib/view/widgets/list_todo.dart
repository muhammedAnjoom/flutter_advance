import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_list/model/add_todo_model.dart';
import 'package:todo_list/services/data.dart';
import 'package:todo_list/view/add_todo.dart';

class ListTodoCard extends StatefulWidget {
  ListTodoCard({
    super.key,
  });

  @override
  State<ListTodoCard> createState() => _ListTodoCardState();
}

class _ListTodoCardState extends State<ListTodoCard> {
  final todoFunction = TodoDataFunction();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            // get todo item in todoItemNotifer
            ValueListenableBuilder(
                valueListenable: todoItemNotifier,
                builder: (context, item, _) {
                  return ListView.builder(
                      itemCount: item.length,
                      shrinkWrap: true,
                      physics:const  NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        // separated list item
                        final todo = item[index];
                        return Padding(
                          padding: const EdgeInsets.all(20),
                          child: Slidable(
                            // set last of item
                            key: Key("${item.length - 1}"),
                            startActionPane: ActionPane(
                              // openThreshold: ,
                              motion:const  DrawerMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (value) {
                                    // editing todo item
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (ctx) => AddToDo(
                                          type: ActionType.editTodo,
                                          id: todo.sId,
                                          todoData: todo,
                                        ),
                                      ),
                                    );
                                  },
                                  icon: Icons.edit_square,
                                  label: "Edite",
                                  backgroundColor: Colors.green,
                                  foregroundColor: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                )
                              ],
                            ),
                            endActionPane: ActionPane(
                              // key: ValueKey("$index"),
                              // dragDismissible: false,
                              dismissible: DismissiblePane(
                                key: Key("$index"),
                                onDismissed: () {
                                  todoFunction.deleteTodoData(todo.sId!);
                                  todoItemNotifier.value.removeAt(index);
                                  todoItemNotifier.notifyListeners();
                                },
                              ),
                              motion:const  DrawerMotion(),
                              children: [
                                SlidableAction(
                                  padding:const  EdgeInsets.symmetric(vertical: 10),
                                  borderRadius: BorderRadius.circular(15),
                                  onPressed: (value) {
                                    // deleted todo item
                                    todoFunction.deleteTodoData(todo.sId!);
                                    todoFunction.getTodoData();
                                  },
                                  icon: Icons.delete,
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                  label: "Delete",
                                )
                              ],
                            ),
                            child: Container(
                              padding:const  EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                              height: 150,
                              decoration: BoxDecoration(
                                  color: const Color(0xfffff4e4),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        todo.title ?? "our journey",
                                        style: TextStyle(
                                          decoration: todo.isCompleted!
                                              ? TextDecoration.lineThrough
                                              : TextDecoration.none,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0xF47A4921),
                                        ),
                                      ),
                                      const Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          // update todo is completed
                                          setState(() {
                                            todo.isCompleted =
                                                !todo.isCompleted!;
                                          });

                                          final todoData = AddTodoModel(
                                            title: todo.title,
                                            description: todo.description,
                                            isCompleted: todo.isCompleted,
                                          );
                                          // update complete Task in todo item
                                          todoFunction.completeTaskTodoData(
                                              todoData, todo.sId!);
                                        },
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              border: Border.all(),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: todo.isCompleted!
                                              ? const Icon(Icons.check)
                                              : null,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    todo.description ??
                                        "we meet at 2018,yap..and we meet again in 2022",
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                })
          ],
        ),
      ),
    );
  }
}