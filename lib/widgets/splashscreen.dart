import 'package:Garage/model/staff_model.dart';
import 'package:Garage/widgets/adminhomepage.dart';
import 'package:Garage/widgets/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    final user = FirebaseAuth.instance.currentUser;
    Future.delayed(Duration(seconds: 2));
    //get admin status
    if (user != null) {
      final response = await FirebaseFirestore.instance
          .collection('staff')
          .doc(user?.uid)
          .get();
      final userModel = Staff.fromFirestore(response.data() ?? {});
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    userModel.isAdmin ? HomePageAdmin() : HomePage()));
      });
    } else {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      //App bar
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 60,
              width: 60,
              child: Icon(
                Icons.car_repair,
                color: Colors.grey[600],
                size: 50,
              ),
            ),
            Container(
              child: Text(
                "INVINCIBLE ",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.blue[900],
                  //fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Container(
              child: Text(
                "GARAGE",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.grey[600],
                  //fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
