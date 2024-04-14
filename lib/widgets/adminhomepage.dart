import 'package:Garage/widgets/addstaff.dart';
import 'package:Garage/widgets/loginadmin.dart';
import 'package:Garage/widgets/viewstaff.dart';
import 'package:Garage/widgets/viewwork.dart';
import 'package:Garage/widgets/viewworkstatus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(systemNavigationBarColor: Colors.blue[900]));
}

class HomePageAdmin extends StatefulWidget {
  const HomePageAdmin({super.key});

  @override
  State<HomePageAdmin> createState() => _HomePageState();
}

final List<String> imagesrc = [
  "images/service3.jpg",
  "images/servicing_cardimage.jpg",
  "images/oilservice.jpg",
];

final List<String> offers = [
  " ADMIN ",
  " INVINCIBLE GARAGE ",
  " ADMIN ",
];
final List<String> servicesleft = [
  "images/wheel.jpg",
  "images/caroil.jpg",
];
final List<String> servicesright = [
  "images/engineservice.png",
  "images/gasservice.jpg",
];
final List servicenrouteleft = [
  AddStaff(),
  ViewWork(),
];
final List servicenrouteright = [
  viewstaff(),
  ViewWorkStatus(),
];
final List<String> servicesnameleft = [
  "Add Staffs",
  "View Works",
];
final List<String> servicesnameright = [
  "View Staffs",
  "Work Status",
];

class _HomePageState extends State<HomePageAdmin> {
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

      // bottomNavigationBar: BottomAppBar(
      //   child: Container(

      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         FloatingActionButton.large(
      //           child: Text('Profile'),
      //           onPressed: () {
      //             Navigator.pushNamed(context, '/profile');
      //           },
      //           backgroundColor: Colors.blue[900],
      //           foregroundColor: Colors.white,
      //         ),
      //         FloatingActionButton.large(
      //           child: Icon(Icons.home),
      //           onPressed: () {
      //             Navigator.pushNamed(context, '/');
      //           },
      //           backgroundColor: Colors.blue[900],
      //           foregroundColor: Colors.white,
      //         ),
      //         FloatingActionButton.large(
      //           child: Text('View Jobs'),
      //           onPressed: () {
      //             Navigator.pushNamed(context, '/view');
      //           },
      //           backgroundColor: Colors.blue[900],
      //           foregroundColor: Colors.white,
      //         )
      //       ],
      //     ),
      //   ),
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

  void signout(BuildContext ctx) async{
    await FirebaseAuth.instance.signOut();
    Navigator.of(ctx).pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx1) => LoginAdmin()),
      (route) => false,
    );
  }
}
