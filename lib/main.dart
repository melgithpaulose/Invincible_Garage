import 'package:Garage/firebase_options.dart';
import 'package:Garage/widgets/adminhomepage.dart';
import 'package:Garage/widgets/brakeservice.dart';
import 'package:Garage/widgets/carwash.dart';
import 'package:Garage/widgets/enginesevice.dart';
import 'package:Garage/widgets/loginadmin.dart';
import 'package:Garage/widgets/myprofile.dart';
import 'package:Garage/widgets/oilservice.dart';
import 'package:Garage/widgets/resetpassword.dart';
import 'package:Garage/widgets/viewstaff.dart';
import 'package:Garage/widgets/viewwork.dart';
import 'package:Garage/widgets/viewworkstatus.dart';
import 'package:Garage/widgets/wheelsevice.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './widgets/splashscreen.dart';
import './widgets/login.dart';
import './widgets/home.dart';
import './widgets/add.dart';
import './widgets/view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "INVINCIBLE GARAGE",
        initialRoute: '/splash',
        routes: {
          '/profile': (context) => MyProfile(),
          "/splash": (context) => splash(),
          '/login': (context) => Login(),
          '/': (context) => HomePage(),
          '/add': (context) => AddUser(),
          '/wheelsevice': (context) => WheelService(),
          '/enginesevice': (context) => EngineService(),
          '/oilsevice': (context) => OilService(),
          '/brakesevice': (context) => BrakeService(),
          '/carwash': (context) => CarWash(),
          '/view': (context) => view(),

          '/reset' :(context) => ResetPassword(),

          '/loginadmin':(context) => LoginAdmin(),
          '/homepageadmin' :(context) => HomePageAdmin(),
          '/viewstaff' :(context) => viewstaff(),
          '/viewwork' :(context) => ViewWork(),
          '/viewworkstatus' :(context) => ViewWorkStatus(),
        });
  }
}
