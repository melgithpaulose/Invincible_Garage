import 'package:Garage/model/staff_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class editProfile extends StatefulWidget {
  const editProfile({super.key});

  @override
  State<editProfile> createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  bool isloading = false;
  Stream<QuerySnapshot<Map<String, dynamic>>> stram =
      FirebaseFirestore.instance.collection('staff').snapshots();
  get child => null;

  final User = FirebaseAuth.instance.currentUser;
  Staff? _staff;
  int indexNum = 0;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phnoController = TextEditingController();
  TextEditingController _desigController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String parentId = "";

  @override
  void initState() {
    // TODO: implement
    _fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Edit Profile"),
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

        body: Container(
          padding: const EdgeInsets.all(30.0),
          height: 800,
          width: 400,
          child: Column(
            children: [
              // Stack(
              //   children: [

              //     Positioned(
              //       bottom: 0,
              //       right: 0,
              //       child: Container(
              //         width: 35,
              //         height: 35,
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(100),
              //             color: Colors.white),
              //         child: const Icon(
              //           Icons.camera_alt_rounded,
              //           color: Colors.blue,
              //           size: 23,
              //         ),
              //       ),
              //     )
              //   ],
              // ),
              const SizedBox(height: 20),
              Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      label: Text(
                        'Name',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[900],
                            fontSize: 16),
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.blue[900],
                      ),
                    ),
                  ),
                  // TextFormField(
                  //   decoration: InputDecoration(
                  //       label: Text(
                  //         "Last Name",
                  //         style: TextStyle(
                  //             fontWeight: FontWeight.bold,
                  //             color: Colors.blue[900],
                  //             fontSize: 16),
                  //       ),
                  //       prefixIcon:
                  //           Icon(Icons.person, color: Colors.blue[900])),
                  // ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        label: Text(
                          'Email',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900],
                              fontSize: 16),
                        ),
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.blue[900],
                        )),
                  ),
                  TextFormField(
                    controller: _phnoController,
                    decoration: InputDecoration(
                        label: Text(
                          'Phone Number',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900],
                              fontSize: 16),
                        ),
                        prefixIcon: Icon(
                          Icons.phone_android,
                          color: Colors.blue[900],
                        )),
                  ),
                  TextFormField(
                    controller: _desigController,
                    decoration: InputDecoration(
                        label: Text(
                          'Designation',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900],
                              fontSize: 16),
                        ),
                        prefixIcon: Icon(
                          Icons.phone_android,
                          color: Colors.blue[900],
                        )),
                  ),

                  // TextFormField(
                  //   controller: _passwordController,
                  //   obscureText: true,
                  //   decoration: InputDecoration(
                  //       label: Text(
                  //         "Change Password",
                  //         style: TextStyle(
                  //             fontWeight: FontWeight.bold,
                  //             color: Colors.blue[900],
                  //             fontSize: 16),
                  //       ),
                  //       prefixIcon: Icon(
                  //         Icons.work_outline,
                  //         color: Colors.blue[900],
                  //       )),
                  // ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: 200,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[300],
                          side: BorderSide.none,
                          shape: const StadiumBorder()),
                      child: Text(
                        "Save Changes",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        updateStatus(parentId);
                        Navigator.pushNamed(context, '/profile');
                      },
                    ),
                  ),
                ],
              )
            ],
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
        _nameController.text = _staff?.staffName ?? "";
        _emailController.text = _staff?.email ?? "";
        _phnoController.text = _staff?.staffPhoneNumber ?? "";
        _desigController.text = _staff?.designation ?? "";
        _passwordController.text = _staff?.password ?? "";
        parentId = response.id;
      });
    } on FirebaseException catch (e) {
      debugPrint(e.message);
    }
  }

  void updateStatus(String parentId) {
    setState(() {
      isloading = true;
    });
    DocumentReference reference =
        FirebaseFirestore.instance.collection('staff').doc(parentId);
    reference
        .update(
          {
            'staff_name': _nameController.text,
            'email': _emailController.text,
            'staff_phno': _phnoController.text,
            'password': _passwordController.text
          },
        )
        .then((value) => debugPrint("User Added"))
        .catchError((error) => debugPrint("Failed to add user: $error"));
    setState(() {
      isloading = false;
    });
  }
}
