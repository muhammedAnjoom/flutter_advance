import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

List<String> listImage = [];

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

String? _image;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () async{
            await GallerySaver.saveImage(_image.toString(),albumName: "anjoom");
          }, icon: Icon(Icons.save))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _loadImage(ImageSource.camera);
        },
        child: Icon(Icons.camera),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: FileImage(
                  File(_image.toString()),
                ),
              )),
            ),
            Text("hai")
            // ListView.builder(
            //   shrinkWrap: true,
            //   itemBuilder: (context, index) {
            //     return Container();
            //   },
            // )
          ],
        ),
      ),
    );
  }

  Future<void> _loadImage(ImageSource imageSource) async {
    // int count=0;
    final XFile? image = await ImagePicker().pickImage(source: imageSource);    // var count = cou
    setState(() {
      _image = image!.path;
    });
  }

}
