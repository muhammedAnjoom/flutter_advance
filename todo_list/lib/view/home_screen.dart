import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/model/add_todo_model.dart';
import 'package:todo_list/services/data.dart';
import 'package:todo_list/view/add_todo.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ValueNotifier<bool> checkTodo = ValueNotifier(false);

  final todoFunction = TodoDataFunction();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await todoFunction.getTodoData();
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xfffbe4b3),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => AddToDo(
                    type: ActionType.addTodo,
                  )));
        },
        child: SvgPicture.asset(
          "assets/icons/edit.svg",
          fit: BoxFit.scaleDown,
          width: 30,
          height: 30,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 280,
              decoration: BoxDecoration(color: Color(0xffffe4e4)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      "https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png?rev=2540745",
                      width: 60,
                      height: 60,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Shared note",
                      style: TextStyle(fontSize: 15, color: Colors.black54),
                    ),
                    Text(
                      "I & You Space",
                      style: TextStyle(
                        fontSize: 34,
                        color: Color(0xff7a2c21),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      // keyboardAppearance: ,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                          filled: true,
                          focusColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none),
                          fillColor: Colors.white,
                          hintText: "Search your notes",
                          suffixIcon: SvgPicture.asset(
                            "assets/icons/search.svg",
                            width: 15,
                            height: 15,
                            fit: BoxFit.scaleDown,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 15),
                          hintStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400)),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      ValueListenableBuilder(
                          valueListenable: todoItemNotifier,
                          builder: (context, item, _) {
                            return ListView.builder(
                                itemCount: item.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  print(index);
                                  final todo = item[index];
                                  //  item.sort((a,b){
                                  //   if(b.isCompleted!){
                                  //     return 1;
                                  //   }
                                  //   return -1;
                                  // });
                                  print(todo.sId);
                                  return Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Slidable(
                                      key: Key("${item.length - 1}"),
                                      startActionPane: ActionPane(
                                        // openThreshold: ,
                                        motion: DrawerMotion(),
                                        children: [
                                          SlidableAction(
                                            onPressed: (value) {
                                              print("editite");
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
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          )
                                        ],
                                      ),
                                      endActionPane: ActionPane(
                                        // key: ValueKey("$index"),
                                        // dragDismissible: false,
                                        dismissible: DismissiblePane(
                                          key: Key("$index"),
                                          onDismissed: () {
                                            // print(value.index);
                                            todoFunction
                                                .deleteTodoData(todo.sId!);
                                            todoItemNotifier.value
                                                .removeAt(index);
                                            todoItemNotifier.notifyListeners();
                                          },
                                        ),
                                        motion: DrawerMotion(),
                                        children: [
                                          SlidableAction(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            onPressed: (value) {
                                              todoFunction
                                                  .deleteTodoData(todo.sId!);
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
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 20),
                                        // margin: EdgeInsets.symmetric(
                                        //     vertical: 20, horizontal: 20),
                                        height: 150,
                                        decoration: BoxDecoration(
                                            color: Color(0xfffff4e4),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  todo.title ?? "our journey",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xF47A4921),
                                                  ),
                                                ),
                                                Spacer(),
                                                GestureDetector(
                                                  onTap: () {
                                                    // checkTodo.value =
                                                    //     !checkTodo.value;
                                                    // checkTodo.notifyListeners();
                                                    //  print(checkTodo.value);
                                                    setState(() {
                                                      todo.isCompleted =
                                                          !todo.isCompleted!;
                                                    });

                                                    final todoData =
                                                        AddTodoModel(
                                                      title: todo.title,
                                                      description:
                                                          todo.description,
                                                      isCompleted:
                                                          todo.isCompleted,
                                                    );
                                                    todoFunction
                                                        .completeTaskTodoData(
                                                            todoData,
                                                            todo.sId!);
                                                  },
                                                  child: Container(
                                                    width: 30,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: todo.isCompleted!
                                                        ? Icon(Icons.check)
                                                        : null,
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              todo.description ??
                                                  "we meet at 2018,yap..and we meet again in 2022",
                                              style: TextStyle(
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
