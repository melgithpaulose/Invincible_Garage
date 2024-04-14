import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController _controller = TextEditingController();
  //validation
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RESET PASSWORD"),
        //...rest of your app bar code
      ),
      //...rest of your scaffold code
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //...your existing UI code

            Padding(
              padding: const EdgeInsets.all(5.10),
              
              child: Column(
                
                children: [

                  Padding(
                padding: EdgeInsets.all(10.0),
                child: Image.asset("images/Invincible-Garage-Logo-JPG.jpg")),
                
                  //...your existing UI code

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      // controller: _staffname,
                      controller: _controller,
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

                  //...repeat the above pattern for other text form fields
                ],
              ),
            ),

            SizedBox(
              width: 10,
              height: 30,
            ),
            //...more of your existing UI code

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await FirebaseAuth.instance
                          .sendPasswordResetEmail(email: _controller.text);
                      // Only submit if the form is valid
                      Navigator.pushNamed(context, '/login');
                    }
                  },
                  style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(Size(double.infinity, 50)),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.lightBlueAccent)),
                  child: Text(
                    "Reset",
                    style: TextStyle(fontSize: 20),
                  )),
            ) //...rest of your ElevatedButton code
          ],
        ),
      ),
    );
  }
}
