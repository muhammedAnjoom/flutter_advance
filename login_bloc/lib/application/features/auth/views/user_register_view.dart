import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserRegister extends StatelessWidget {
  UserRegister({super.key});

   final emailController =TextEditingController();
  final passwordController = TextEditingController();
     final nameController =TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body:  Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Register with email",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
              
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                   TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: "name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                   TextFormField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      hintText: "phone",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(height: 10,),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Login"),
                    
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}