import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FullScreen extends StatelessWidget {
  const FullScreen({super.key, required this.image});

  final String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.file(
                File(image),
                fit: BoxFit.cover,
              ),
              // alignment: Alignment.center,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 40,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
