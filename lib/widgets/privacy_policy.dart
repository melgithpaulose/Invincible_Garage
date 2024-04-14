import 'package:flutter/material.dart';

// ignore: camel_case_types
class faq extends StatelessWidget {
  const faq({Key? key}) : super(key: key);

  get child => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy & Policy"),
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
                "Privacy & Policy",
                style: TextStyle(fontSize: 30),
              ),
              textColor: Colors.black,
              titleTextStyle:
                  TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text("1.Personal Information Collection"),
              subtitle: Text(
                  "Invincible Garage collects personal information during the visit, registration process, agreement execution, and various documents are received from the user or their associates or their parent concern/body"),
            ),
            ListTile(
              title: Text("2.Use of Personal Information"),
              subtitle: Text(
                  "When you use our App, you may provide personal information such as your name, contact details, vehicle information, and service requests.We collect device information, usage data, and analytics to improve our services.."),
            ),
            ListTile(
              title: Text("3. Security Measures"),
              subtitle: Text(
                  "We implement security measures to protect your data from unauthorized access or disclosure."),
            ),
            ListTile(
              title: Text("4.Contact Us"),
              subtitle: Text(
                  "If you have any questions or concerns about our privacy practices, please contact us at invinciblegarage@email.com."),
            ),
          ]))
        ],
      ),
    );
  }
}
