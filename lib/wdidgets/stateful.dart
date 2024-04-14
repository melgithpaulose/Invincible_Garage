import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App Bar
      appBar: AppBar(
        title: Text("LOGIN"),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
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
        elevation: 90,
      ),

      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(children: [
            Padding(
                padding: EdgeInsets.all(10.0),
                child: Image.asset("images/Invincible-Garage-Logo-JPG.jpg")),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: "User Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  hintText: "Enter your Username",
                  prefixIcon: Icon(Icons.account_box),
                  labelStyle: TextStyle(color: Colors.blue)),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  labelText: "Password",
                  hintText: "Password",
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.remove_red_eye),
                  helperText: "Password must be 6 character or more",
                  labelStyle: TextStyle(color: Colors.blue)),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        minimumSize: MaterialStateProperty.all(Size(30, 50))),
                    onPressed: () {},
                    key: onPressed,
                    child: Text("Sign In")),
                ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueGrey),
                        minimumSize: MaterialStateProperty.all(Size(30, 50))),
                    onPressed: () {},
                    key: onPressed,
                    child: Text("Register")),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
