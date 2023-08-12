import 'dart:io';

import 'package:camera_photo/full_screen_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:local_image_provider/local_image_provider.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:local_image_provider/local_image_provider.dart' as lip;

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

String? _image;
List<String> listImages = [];

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    _getImageSave();
    // listImages.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (ctx) {
                          return AlertDialog(
                            title: const Text("Delete"),
                            content: const Text("Delete All Image from view"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                                child: Text(
                                  "no",
                                  style: TextStyle(color: Colors.green),
                                ),
                              ),
                              TextButton(
                                onPressed: () async {
                                  final SharedPreferences preferences =
                                      await SharedPreferences.getInstance();
                                  setState(() {
                                    preferences.clear();
                                    listImages.clear();
                                  });
                                  Navigator.of(ctx).pop();
                                },
                                child: Text(
                                  "Yes",
                                  style: TextStyle(color: Colors.red),
                                ),
                              )
                            ],
                          );
                        },
                      );
                    },
                    child: const Text(
                      "Delete All",
                    ),
                  ),
                ),
                const PopupMenuItem(
                  child: Text("About"),
                )
              ];
            },
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _loadImage(ImageSource.camera);
          setState(() {
            GallerySaver.saveImage(_image ?? "");
          });
        },
        child: const Icon(Icons.camera),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: GridView.builder(
            itemCount: listImages.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3 / 4),
            itemBuilder: (context, index) {
              // print(listImages);
              final image = listImages[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => FullScreen(image: image),
                  ));
                },
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(image: FileImage(File(image)))),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _loadImage(ImageSource imageSource) async {
    List<String> imgess = [];
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    // int count=0;
    final XFile? image = await ImagePicker().pickImage(source: imageSource);

    setState(() {
      _image = image!.path;
    }); // var count = cou

    imgess.add(image!.path);
    setState(() {
      listImages.add(image.path);
      preferences.setStringList('image', listImages);
    });
    // preferences.clear();
    // _getImageSave();
  }

  Future<void> _getImageSave() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final data = preferences.getStringList('image');
    if (data == null) {
      [];
    } else {
      // print(data);
      setState(() {
        listImages = data;
      });
    }
  }
}
