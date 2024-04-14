import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //App Bar
        appBar: AppBar(
          title: Text("INVINCIBLE GARAGE"),
          backgroundColor: Colors.blue[600],

          //Leading left side icon
          leading: Icon(Icons.menu),

          //Actions right side icon
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.account_circle_outlined),
            )
          ],

          //Shape
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(35))),

          //Elevation
          elevation: 30,
        ),
        body: Center(
          child: Text(
            "Garage",
            style: TextStyle(fontSize: 30),
          ),
        ));
  }
}
