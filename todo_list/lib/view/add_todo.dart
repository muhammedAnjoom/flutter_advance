import 'package:flutter/material.dart';

enum ActionType {
  addTodo,
  editTodo,
}

class AddToDo extends StatelessWidget {
  const AddToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back_sharp,
                        size: 28,
                      )),
                  TextButton(
                      onPressed: () {
                        switch(ActionType){
                          case ActionType.addTodo:
                          //  addNote
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
                  child: const Column(
                    children: [
                      TextField(
                        style: TextStyle(
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
                          minLines: null,
                          maxLines: null,
                          expands: true,
                          style: TextStyle(fontSize: 18),
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
