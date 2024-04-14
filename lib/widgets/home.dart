import 'package:Garage/model/staff_model.dart';
import 'package:Garage/widgets/add.dart';
import 'package:Garage/widgets/brakeservice.dart';
import 'package:Garage/widgets/carwash.dart';
import 'package:Garage/widgets/enginesevice.dart';
import 'package:Garage/widgets/login.dart';
import 'package:Garage/widgets/oilservice.dart';
import 'package:Garage/widgets/terms.dart';
import 'package:Garage/widgets/wheelsevice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'privacy_policy.dart';
import 'myprofile.dart';
import 'view.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(systemNavigationBarColor: Colors.blue[900]));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final List<String> imagesrc = [
  "images/service3.jpg",
  "images/servicing_cardimage.jpg",
  "images/oilservice.jpg",
];

final List<String> offers = [
  " ON WHEEL SERVICES ",
  " ON ENGINE SERVICES ",
  " ON OIL SERVICES ",
];
final List<String> offersvalue = [
  " 40% OFF ",
  " 10% OFF ",
  " 50% OFF ",
];
final List<String> offercodes = [
  " Code: ABC123 ",
  " Code: DEF456 ",
  " Code: GHI789 ",
];
final List<String> servicesleft = [
  "images/wheel.jpg",
  "images/caroil.jpg",
  "images/mirrorservice.jpg",
];
final List<String> servicesright = [
  "images/engineservice.png",
  "images/gasservice.jpg",
  "images/brakeservice.jpg",
];
final List servicenrouteleft = [
  WheelService(),
  OilService(),
  CarWash(),
];
final List servicenrouteright = [
  EngineService(),
  BrakeService(),
  AddUser(),
];
final List<String> servicesnameleft = [
  "Wheel Service",
  "Oil Service",
  "Car Wash",
];
final List<String> servicesnameright = [
  "Engine Service",
  "Brake Service",
  "Others",
];

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;
  Staff? _staff;
  int indexNum = 0;

  @override
  void initState() {
    // TODO: implement initState
    _fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("INVINCIBLE GARAGE"),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        backgroundColor: Colors.blue[900],

        //Actions right side icon
        actions: [
          IconButton(
            onPressed: () {
              signout(context);
            },
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
          )
        ],

        //Shape
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(1))),

        //Elevation
        elevation: 90,
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[300],
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.blue[900]),
                accountName: Text('${_staff?.staffName} '),
                accountEmail: Text('${user?.email}'),
              ),
            ),
            ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  "Profile",
                  style: TextStyle(fontSize: 20),
                ),
                textColor: Colors.black,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyProfile(),
                      ));
                }),
            ListTile(
                leading: Icon(Icons.view_timeline_outlined),
                title: Text(
                  "View Jobs",
                  style: TextStyle(fontSize: 20),
                ),
                textColor: Colors.black,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const view(),
                      ));
                }),
            ListTile(
                leading: Icon(Icons.shield_outlined),
                title: Text(
                  "Privacy policy",
                  style: TextStyle(fontSize: 20),
                ),
                textColor: Colors.black,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const faq(),
                      ));
                }),
            ListTile(
                leading: Icon(Icons.info_outline),
                title: Text(
                  "Terms of Services",
                  style: TextStyle(fontSize: 20),
                ),
                textColor: Colors.black,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const terms(),
                      ));
                }),
            ListTile(
                leading: Icon(Icons.logout),
                title: Text(
                  "Logout",
                  style: TextStyle(fontSize: 20),
                ),
                textColor: Colors.black,
                onTap: () {
                  signout(context);
                }),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   elevation: 20.0,
      //   onPressed: () {
      //     Navigator.pushNamed(context, '/add');
      //   },
      //   foregroundColor: Colors.white,
      //   backgroundColor: Colors.blue[900],
      //   // label: Text('Add Job'),
      //   child: Icon(Icons.add),
      // ),

      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
                child: Text('Profile'),
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
                backgroundColor: Colors.blue[900],
                foregroundColor: Colors.white,
              ),
              FloatingActionButton.large(
                child: Icon(Icons.home),
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                backgroundColor: Colors.blue[900],
                foregroundColor: Colors.white,
              ),
              FloatingActionButton.large(
                child: Text('View Jobs'),
                onPressed: () {
                  Navigator.pushNamed(context, '/view');
                },
                backgroundColor: Colors.blue[900],
                foregroundColor: Colors.white,
              )
            ],
          ),
        ),
      ),

      //  box
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.home,
      //         color: Color.fromARGB(255, 2, 10, 146),
      //       ),
      //       label: "home",
      //       backgroundColor: Color.fromARGB(255, 2, 10, 146),
      //     ),
      //     // BottomNavigationBarItem(
      //     //     icon: Icon(Icons.add_business_rounded),
      //     //     label: "Add Jobs",
      //     //     backgroundColor: Color.fromARGB(255, 2, 10, 146)),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.view_timeline_rounded,
      //           color: Color.fromARGB(255, 2, 10, 146),
      //         ),
      //         label: "View Jobs",
      //         backgroundColor: Color.fromARGB(255, 2, 10, 146)),
      //     // BottomNavigationBarItem(
      //     //     icon: Icon(Icons.logout),
      //     //     label: "Logout",
      //     //     backgroundColor: Color.fromARGB(255, 2, 10, 146)),
      //   ],
      //   currentIndex: indexNum,
      //   onTap: (int index) {
      //     setState(() {
      //       indexNum = index;
      //     });
      //   },
      // ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 2.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: <Color>[
                        Color(0xFF2508FF),
                        Color(0xFFFF1000)
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),

                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: imagesrc.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width - 40,
                              child: Card(
                                color: Colors.transparent,
                                elevation: 0,
                                child: Container(
                                  child: Center(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.asset(
                                        imagesrc[index],
                                        fit: BoxFit.fill,
                                        width: double.infinity,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white,
                                  ),
                                  child: Text(
                                    offersvalue[index],
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white,
                                  ),
                                  child: Text(
                                    offers[index],
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white,
                                  ),
                                  child: Text(
                                    offercodes[index],
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          height: 2.5,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: <Color>[
                              Color(0xFFFF1000),
                              Color(0xFF2508FF)
                            ]),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Text("Available Services  ",
                          style: TextStyle(
                              color: Color(0xFFFF1000),
                              fontSize: 15,
                              fontWeight: FontWeight.normal),
                          textAlign: TextAlign.center),
                      Expanded(
                        child: Container(
                          height: 2.5,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: <Color>[
                              Color(0xFF2508FF),
                              Color(0xFFFF1000)
                            ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

//------------------------------------------------------------------------------------

            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height / 2.5,
                child: Expanded(
                  child: ListView.builder(
                    itemCount: servicesleft.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: <Widget>[
                          Container(
                            width: (MediaQuery.of(context).size.width - 25) / 2,
                            height: 100,
                            color: Colors.transparent,
                            child: GestureDetector(
                              onTap: () {
                                //futter navigation
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      servicenrouteleft[index],
                                ));
                                //go router
                              },
                              child: Card(
                                color: Colors.grey[100],
                                elevation: 2,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    ClipOval(
                                      child: Container(
                                        child: Image.asset(
                                          servicesleft[index],
                                          fit: BoxFit.fill,
                                          width: 55,
                                          height: 55,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Flexible(
                                      child: Text(
                                        servicesnameleft[index],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: (MediaQuery.of(context).size.width - 25) / 2,
                            height: 100,
                            color: Colors.transparent,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      servicenrouteright[index],
                                ));
                              },
                              child: Card(
                                color: Colors.grey[100],
                                elevation: 2,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    ClipOval(
                                      child: Container(
                                        child: Image.asset(
                                          servicesright[index],
                                          fit: BoxFit.fill,
                                          width: 55,
                                          height: 55,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Flexible(
                                      child: Text(
                                        servicesnameright[index],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
//------------------------------------------------------------------------------------
          ],
        ),
      ),
    );
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

  void signout(BuildContext ctx) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(ctx).pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx1) => Login()),
      (route) => false,
    );
  }
}
