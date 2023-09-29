import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/model/add_todo_model.dart';
import 'package:todo_list/services/data.dart';
import 'package:todo_list/view/add_todo.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:todo_list/view/widgets/list_todo.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

// check the tasks
  ValueNotifier<bool> checkTodo = ValueNotifier(false);

  final todoFunction = TodoDataFunction();

// search todo items
  void searchTod(String query) {
    final suggestion = todoItemNotifier.value.where((todo) {
      final todoTitle = todo.title!.toLowerCase();
      final input = query.toLowerCase();
      return todoTitle.contains(input);
    }).toList();
    if (query.isNotEmpty) {
      todoItemNotifier.value = suggestion;
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await todoFunction.getTodoData();
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xfffbe4b3),
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
              decoration: const BoxDecoration(color: Color(0xffffe4e4)),
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
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Shared note",
                      style: TextStyle(fontSize: 15, color: Colors.black54),
                    ),
                    const Text(
                      "I & You Space",
                      style: TextStyle(
                        fontSize: 34,
                        color: Color(0xff7a2c21),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      onChanged: (value) {
                        // check the query is empty
                        if (value.isEmpty) {
                          todoFunction.getTodoData();
                          return;
                        } else {
                          searchTod(value);
                        }
                      },
                      style: const TextStyle(fontSize: 20),
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
              child: ListTodoCard(),
            ),
          ],
        ),
      ),
    );
  }
}


