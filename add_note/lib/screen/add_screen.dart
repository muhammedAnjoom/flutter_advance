import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

enum ActionType {
  addNote,
  editNote,
}

class AddScreen extends StatelessWidget {
  AddScreen({
    super.key,
    required this.type,
    this.id,
  });
  final ActionType type;
  String? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          type.name.toUpperCase(),
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
              switch (type) {
                case ActionType.addNote:
                  break;
                case ActionType.editNote:
                  break;
              }
            },
            icon: Icon(
              Icons.save,
              color: Colors.white,
            ),
            label: Text(
              "Save",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Title"),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Content", border: OutlineInputBorder()),
              minLines: 6,
              keyboardType: TextInputType.multiline,
              maxLines: null,
            )
          ],
        ),
      )),
    );
  }
}
