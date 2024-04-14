import 'package:Garage/firebase_auth_service/login_auth.dart';
import 'package:Garage/widgets/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_toastr/flutter_toastr.dart';

//import '/repository/auth_repository.dart';

// ignore: camel_case_types

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passswordController.dispose();
    // FirebaseAuth.instance.sendPasswordResetEmail(email: '');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App Bar
      appBar: AppBar(
        title: Text("...LogIn..."),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        backgroundColor: Colors.blue[900],

        //Actions right side icon

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
              controller: _emailController,
              decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  hintText: "Enter your Email",
                  prefixIcon: Icon(Icons.account_box),
                  labelStyle: TextStyle(color: Colors.blue)),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _passswordController,
              obscureText: true, // Set this to true to hide the text
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  labelText: "Password",
                  hintText: "Password",
                  prefixIcon: Icon(Icons.lock),
                  labelStyle: TextStyle(color: Colors.blue)),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue[900]),
                        minimumSize: MaterialStateProperty.all(Size(30, 50))),
                    onPressed: () {
                      _SignIn();
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => const HomePage(),
                      //     ));
                      //signup screen
                    },
                    child: Text("Sign In")),
                    
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/reset');
                  },
                  child: Container(
                    child: Text(
                      'Reset Password',
                      style: TextStyle(color: Color.fromARGB(255, 27, 17, 221)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 20,
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/loginadmin');
              },
              child: Container(
                child: Text(
                  'Go to Admin Login',
                  style: TextStyle(color: Color.fromARGB(255, 27, 17, 221)),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }

  void _SignIn() async {
    String email = _emailController.text;
    String password = _passswordController.text;

    User? user = await _auth.signinwithEmailAndPassword(email, password);

    if (user != null) {
      print("User is successfully login");
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
    } else {
      FlutterToastr.show("Invalid Username/Password", context);
    }
  }
}
// Future<void> authenticate(
//       BuildContext context, String username, String password) async {
//     final _auth = AuthRepository();
//     try {
//       setState(() {
//         isLoading = true;
//       });
//       //call login
//       final resp = await _auth.login(username, password);
//       if (resp?.status == 200) {
//         setState(() {
//           isLoading = false;
//         });
//         FlutterToastr.show('login successfull', context);

//         Navigator.pushAndRemoveUntil(
//             context,
//             MaterialPageRoute(
//               builder: (context) => home(),
//             ),
//             (route) => false);
//       } else {
//         setState(() {
//           isLoading = false;
//         });
//         FlutterToastr.show('invalid credentials', context);
//       }
//     } on DioException catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//       debugPrint(e.error.toString());
//       FlutterToastr.show('server error check connection', context);
//     }
//   }
// }