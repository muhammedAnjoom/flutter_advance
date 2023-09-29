import 'package:flutter/material.dart';
import 'package:todo_list/model/add_todo_model.dart';
import 'package:todo_list/model/todo_data_model.dart';
import 'package:todo_list/services/data.dart';
import 'package:todo_list/view/home_screen.dart';

enum ActionType {
  addTodo,
  editTodo,
}

class AddToDo extends StatelessWidget {
  AddToDo({
    super.key,
    required this.type,
    this.id,
    this.todoData,
  });

  final String? id;
  final TodoDataModel? todoData;

  final ActionType type;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController decorationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (type == ActionType.editTodo) {
      if (id == null) {
        Navigator.of(context).pop();
      }
      titleController.text = todoData!.title ?? "no title";
      print(titleController.text);
      decorationController.text = todoData!.description ?? "no decripiton";
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffFBF3E1),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.arrow_back_sharp,
                        size: 28,
                      )),
                  TextButton(
                      onPressed: () async {
                        switch (type) {
                          case ActionType.addTodo:
                            //  addNote
                            final title = titleController.text;
                            final description = decorationController.text;
                            final data = AddTodoModel(
                                title: title,
                                description: description,
                                isCompleted: false);
                            await TodoDataFunction().addTodoData(data);
                            print("is added");
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => HomeScreen()));
                            break;
                          case ActionType.editTodo:
                            final title = titleController.text;
                            final description = decorationController.text;
                            final data = AddTodoModel(
                                title: title,
                                description: description,
                                isCompleted: false);
                            await TodoDataFunction()
                                .updateTodoData(data, todoData!.sId!);
                            print("is edited");
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => HomeScreen()));

                            break;
                        }
                      },
                      child: const Text(
                        "Done",
                        style: TextStyle(
                            fontSize: 22,
                            color: Color(0xff8B6521),
                            fontWeight: FontWeight.w400),
                      ))
                ],
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      TextField(
                        controller: titleController,
                        style: const TextStyle(
                            fontSize: 30,
                            color: Color(0xff8B6521),
                            fontWeight: FontWeight.w800),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: TextStyle(fontWeight: FontWeight.normal),
                            hintText: "Enter Title"),
                      ),
                      Expanded(
                        child: TextField(
                          controller: decorationController,
                          minLines: null,
                          maxLines: null,
                          expands: true,
                          style: const TextStyle(fontSize: 18),
                          decoration:
                              InputDecoration(hintText: "Enter decripiton"),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
