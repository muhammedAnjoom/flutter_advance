import 'package:add_note/data/data.dart';
import 'package:add_note/model/add_data_model.dart';
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

  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  final _scafflodKey  = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scafflodKey,
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
                  saveNote();
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
              controller: _titleController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Title"),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _contentController,
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

  Future<void> saveNote() async {
    final title = _titleController.text;
    final content = _contentController.text;

    final newNote =  AddModel.create(
      sId: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      content: content,
    );
   final newData = await NoteDb().createNote(newNote);
   if(newData!=null){
    print("note save");
    Navigator.of(_scafflodKey.currentContext!).pop();
   }else{
    print("Error while saving note");
   }
  }
}
