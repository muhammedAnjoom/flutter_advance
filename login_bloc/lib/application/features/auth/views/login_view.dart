import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
   LoginView({super.key});

  final emailController =TextEditingController();
  final passwordController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                    "Login",
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
              InkResponse(
                onTap: (){
                  Navigator.pushNamed(context, '/register');
                },
                child: Text("Regsiter?",style: TextStyle(
                  color: Colors.blue
                ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
