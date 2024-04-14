import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddStaff extends StatefulWidget {
  const AddStaff({super.key});

  @override
  State<AddStaff> createState() => _AddStaffState();
}

class _AddStaffState extends State<AddStaff> {
  CollectionReference _staff = FirebaseFirestore.instance.collection('staff');
  int indexNum = 0;
  final transmission = ['Manual', 'Automatic', 'Semi Automatic', 'Other'];
  String? selectedGroup;
  bool isLoading = false;
  TextEditingController _staffname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phonenumber = TextEditingController();
  TextEditingController _designation = TextEditingController();
  TextEditingController _password = TextEditingController();

  void addstaff() async {
    try {
      setState(() {
        isLoading = true;
      });
      //create user
      final response = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _email.text, password: _password.text);
      await _staff
          .doc(response.user?.uid)
          .set({
            'staff_name': _staffname.text,
            'email': _email.text,
            'staff_phno': _phonenumber.text,
            'designation': _designation.text,
            'password': _password.text,
            'isActive': true,
            'isAdmin' : false
          })
          .then((value) => debugPrint("Staff Added"))
          .catchError((error) => debugPrint("Failed to add staff: $error"));
      setState(() {
        isLoading = false;
      });
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _email.dispose();
    super.dispose();
  }

  //validation
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ADD STAFFS"),
        //...rest of your app bar code
      ),
      //...rest of your scaffold code
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: _formKey,
              child: ListView(
                children: [
                  //...your existing UI code

                  Padding(
                    padding: const EdgeInsets.all(5.10),
                    child: Card(
                      elevation: 10,
                      child: Column(
                        children: [
                          //...your existing UI code

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: _staffname,
                              decoration: InputDecoration(
                                  labelText: "Staff Name",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: "Enter Staff Name",
                                  labelStyle: TextStyle(color: Colors.blue)),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Staff Name';
                                }
                                return null;
                              },
                              //...rest of your TextFormField code
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: _email,
                              decoration: InputDecoration(
                                  labelText: "Email",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: "Enter Email",
                                  labelStyle: TextStyle(color: Colors.blue)),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Email';
                                }
                                return null;
                              },
                              //...rest of your TextFormField code
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: _phonenumber,
                              decoration: InputDecoration(
                                  labelText: "Phone Number",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: "Enter Phone Number",
                                  labelStyle: TextStyle(color: Colors.blue)),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Phone Number';
                                }
                                return null;
                              },
                              //...rest of your TextFormField code
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: _designation,
                              decoration: InputDecoration(
                                  labelText: "Designation",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: "Enter Designation",
                                  labelStyle: TextStyle(color: Colors.blue)),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Designation';
                                }
                                return null;
                              },
                              //...rest of your TextFormField code
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: _password,
                              obscureText: true,
                              decoration: InputDecoration(
                                  labelText: "Password",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: "Enter Password",
                                  labelStyle: TextStyle(color: Colors.blue)),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Password';
                                }
                                return null;
                              },
                              //...rest of your TextFormField code
                            ),
                          ),

                          //...repeat the above pattern for other text form fields
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 10,
                    height: 30,
                  ),
                  //...more of your existing UI code

                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Only submit if the form is valid
                          addstaff();
                          Navigator.pushNamed(context, '/homepageadmin');
                        }
                      },
                      style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                              Size(double.infinity, 50)),
                          backgroundColor: MaterialStateProperty.all(
                              Colors.lightBlueAccent)),
                      child: Text(
                        "Submit",
                        style: TextStyle(fontSize: 20),
                      )) //...rest of your ElevatedButton code
                ],
              ),
            ),
    );
  }
}
