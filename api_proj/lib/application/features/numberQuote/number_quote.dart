

import 'package:flutter/material.dart';

class NumberQuoteScreen extends StatelessWidget {
  const NumberQuoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Material(
                elevation: 20,
                borderRadius: BorderRadius.circular(15),
                child: const SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                        "4 is the number of human blood groups (A, B, O, AB)."),
                  ),
                ),
              ),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: Colors.red,
                    ),
                    Text("No data in recode")
                    // CircularProgressIndicator()
                  ],
                ),
              ),
              Row(
                children: [
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: Colors.black26)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: Colors.black26)),
                          hintText: "Enter Number"),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(8),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Icon(Icons.add),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
