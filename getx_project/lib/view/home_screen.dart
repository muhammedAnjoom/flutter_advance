import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:getx_project/res/routes/routes_name.dart';
import 'package:getx_project/view_models/controller/user_preferences/user_preference_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Home Screen"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(onPressed: (){
            UserPrefences().removeUser().then((value){
              Get.toNamed(RouteName.loginScreen);
            });
          }, icon: Icon(Icons.logout_outlined))
        ],
      ),
      body: SafeArea(child: Text("hellow")),
    );
  }
}