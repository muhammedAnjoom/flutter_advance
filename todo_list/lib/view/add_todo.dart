import 'package:flutter/material.dart';
import 'package:todo_list/model/add_todo_model.dart';
import 'package:todo_list/services/data.dart';

enum ActionType {
  addTodo,
  editTodo,
}

class AddToDo extends StatelessWidget {
  AddToDo({super.key, required this.type});

  final ActionType type;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController decorationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                      onPressed: () async{
                        switch (type) {
                          case ActionType.addTodo:
                            //  addNote
                             final title = titleController.text;
                             final description = decorationController.text;
                             final data = AddTodoModel(
                              title: title,
                              description: description,
                              isCompleted: false
                             );
                             await TodoDataFunction().addTodoData(data);
                             print("is added");
                             Navigator.of(context).pop();
                            break;
                          case ActionType.editTodo:
                            //  edittodo
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
                  child:  Column(
                    children: [
                      TextField(
                        controller: titleController,
                        style:const  TextStyle(
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
                          style:const TextStyle(fontSize: 18),
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
