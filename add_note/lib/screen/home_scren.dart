import 'package:add_note/data/data.dart';
// import 'package:add_note/model/add_data_model.dart';
import 'package:add_note/screen/add_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // final List<AddModel> notList = [];
  @override
  Widget build(BuildContext context) {
    // print(NoteDb.instance.noteListNotfier.value);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await NoteDb.instance.getAllNotes();

      // print(result);
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("All Notes"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ValueListenableBuilder(
              valueListenable: NoteDb.instance.noteListNotfier,
              builder: (context, list, _) {
                return GridView.builder(
                  itemCount: list.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    final note = list[index];
                    if (note.sId == null) {
                      return SizedBox();
                    } else {
                      return GridItem(
                        id: note.sId!,
                        title: note.title ?? "no title",
                        content: note.content ?? "no content",
                      );
                    }
                  },
                );
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => AddScreen(
              type: ActionType.addNote,
            ),
          ));
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class GridItem extends StatelessWidget {
  GridItem({
    super.key,
    required this.title,
    required this.content,
    required this.id,
  });
  final String id;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => AddScreen(
            type: ActionType.editNote,
            id: id,
          ),
        ));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      NoteDb.instance.deleteNote(id);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
              ],
            ),
            Text(
              content,
              maxLines: 5,
              style: TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
// {
//   "data":[
//     {
//     "_id":"id01",
//     "title":"daliy",
//     "content":"sample"
//     },
//   ]
// }