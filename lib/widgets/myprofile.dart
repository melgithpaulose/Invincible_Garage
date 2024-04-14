import 'package:Garage/model/staff_model.dart';
import 'package:Garage/widgets/view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'editprofile.dart';
//import 'vehicle.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final User = FirebaseAuth.instance.currentUser;
  Staff? _staff;
  int indexNum = 0;

  @override
  void initState() {
    // TODO: implement
    _fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int indexNum = 0;
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
        //App bar
        appBar: AppBar(
          title: Text("My Profile"),
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

        bottomNavigationBar: BottomAppBar(
        child: Container(
          // decoration: BoxDecoration(
          //   color: Colors.blue[900],
          //   shape: BoxShape.rectangle,
          // ),
          // height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton.large(
                child: Icon(Icons.home),
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                backgroundColor: Colors.blue[900],
                foregroundColor: Colors.white,
              ),
            ],
          ),
        ),
      ),

        body: SingleChildScrollView(
          child: Center(
            heightFactor: 1.05,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.all(10.0),
              height: 800,
              width: 400,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Text(
                    '${_staff?.staffName} ',
                    style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${_staff?.designation} ',
                    style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  
                  const SizedBox(height: 40),
                  SizedBox(
                    width: 200,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[900],
                          side: BorderSide.none,
                          shape: const StadiumBorder()),
                      child: Text(
                        "Edit Profile",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => editProfile(),
                            ));
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Divider(
                    color: Colors.white,
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.blue[900],
                      ),
                      child: const Icon(
                        Icons.view_timeline_rounded,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      "View Jobs",
                      style: TextStyle(
                          color: Colors.blue[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    trailing: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.blue.withOpacity(0.1),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => view(),
                              ));
                        },
                        icon: const Icon(Icons.arrow_forward_ios_outlined),
                        color: Colors.blue[900],
                        iconSize: 18,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  _fetch() async {
    try {
      final firebaseuser = FirebaseAuth.instance.currentUser;

      final response = await FirebaseFirestore.instance
          .collection('staff')
          .doc(firebaseuser?.uid)
          .get();

      setState(() {
        _staff = Staff.fromFirestore(response.data() ?? {});
      });
    } on FirebaseException catch (e) {
      debugPrint(e.message);
    }
  }
}
