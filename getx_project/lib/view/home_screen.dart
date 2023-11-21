import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:getx_project/data/response/status.dart';
import 'package:getx_project/res/components/general_expection.dart';
import 'package:getx_project/res/components/internet_expection_widget.dart';
import 'package:getx_project/res/routes/routes.dart';
import 'package:getx_project/res/routes/routes_name.dart';
import 'package:getx_project/view_models/controller/home/home_view_model.dart';
import 'package:getx_project/view_models/controller/user_preferences/user_preference_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.userListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Home Screen"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              onPressed: () {
                UserPrefences().removeUser().then((value) {
                  Get.toNamed(RouteName.loginScreen);
                });
              },
              icon: Icon(Icons.logout_outlined))
        ],
      ),
      body: Obx(() {
        switch (homeController.rxRequestStatus.value) {
          case Status.LOADING:
            return Center(
              child: CircularProgressIndicator(),
            );
          case Status.ERROR:
            if (homeController.error.value == 'No internet') {
              return Center(
                child: InternetExpectionWidget(onPressed: () {
                  homeController.refresheApi();
                }),
              );
            } else {
              return GeneralExpectionWidget(onPressed: (){
                homeController.refresheApi();
              });
            }
          case Status.COMPLETED:
            return ListView.builder(
              itemCount: homeController.userList.value.data!.length,
              itemBuilder: (context, index) {
                final item = homeController.userList.value.data![index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(item.avatar.toString())),
                    title: Text("${item.firstName} ${item.lastName}"),
                    subtitle: Text(item.email.toString()),
                  ),
                );
              },
            );
        }
      }),
    );
  }
}
