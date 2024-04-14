import 'package:flutter/material.dart';

// ignore: camel_case_types
class terms extends StatelessWidget {
  const terms({Key? key}) : super(key: key);

  get child => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Terms of Services"),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        backgroundColor: Colors.blue[900],

        //Actions right side icon

        //Shape
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(1))),

        //Elevation
        elevation: 90,
      ),
      body: ListView(
        children: const [
          Card(
              child: Column(children: [
            const ListTile(
              title: Text(
                "Terms of Services ",
                style: TextStyle(fontSize: 30),
              ),
              textColor: Colors.black,
              titleTextStyle:
                  TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text("Introduction"),
              subtitle: Text(
                  "Welcome to our mobile app! By using this app, you agree to comply with the terms and conditions outlined below. If you do not agree with any part of these terms, please refrain from using the app."),
            ),
            ListTile(
              title: Text("User Responsibilities"),
              subtitle: Text(
                  " You must use the app in accordance with applicable laws and regulations. Keep your login credentials secure and do not share them with others. Users must not engage in fraudulent, harmful, or illegal activities while using the app. Respect our intellectual property rights"),
            ),
            ListTile(
              title: Text("Liabilities and Disclaimers"),
              subtitle: Text(
                  " We are not liable for any damages arising from app usage. The app is provided “as is,” and we make no warranties regarding its accuracy, reliability, or fitness for a particular purpose."),
            ),
            ListTile(
              title: Text("Governing Law"),
              subtitle: Text("These terms are governed by the laws ."),
            ),
          ]))
        ],
      ),
    );
  }
}
