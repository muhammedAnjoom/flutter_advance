import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/view/add_todo.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  ValueNotifier<bool> checkTodo = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        // index: 2,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Color(0xfffbe4b3),
        color: Colors.grey.shade200.withOpacity(0.99),
        onTap: (value) => Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => AddToDo(
                  type: ActionType.addTodo,
                ))),
        items: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/edit.svg",
              fit: BoxFit.scaleDown,
              width: 30,
              height: 30,
            ),
          ),
        ],
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
                      ListView.builder(
                          itemCount: 5,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            // print(index);
                            return Padding(
                              padding: const EdgeInsets.all(20),
                              child: Slidable(
                                key: ValueKey('$index'),
                                startActionPane: ActionPane(
                                  // openThreshold: ,
                                  dragDismissible: false,
                                  motion: DrawerMotion(),
                                  children: [
                                    SlidableAction(
                                      onPressed: (value) {
                                        print("editite $index");
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (ctx) => AddToDo(
                                                type: ActionType.addTodo),
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
                                  key: UniqueKey(),
                                  // dragDismissible: false,
                                  dismissible:
                                      DismissiblePane(onDismissed: () {}),
                                  motion: DrawerMotion(),
                                  children: [
                                    SlidableAction(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      borderRadius: BorderRadius.circular(15),
                                      onPressed: (value) {},
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
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "our journey",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xF47A4921),
                                            ),
                                          ),
                                          Spacer(),
                                          GestureDetector(
                                            onTap: () {
                                              checkTodo.value =
                                                  !checkTodo.value;
                                              checkTodo.notifyListeners();
                                              //  print(checkTodo.value);
                                            },
                                            child: ValueListenableBuilder(
                                                valueListenable: checkTodo,
                                                builder: (context, value, _) {
                                                  return Container(
                                                    width: 30,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: value
                                                        ? Icon(Icons.check)
                                                        : null,
                                                  );
                                                }),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
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
