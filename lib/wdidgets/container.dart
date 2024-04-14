import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App Bar
      appBar: AppBar(
        title: Text("INVINCIBLE GARAGE"),
        backgroundColor: Colors.blue[600],

        //Leading left side icon
        leading: Icon(Icons.menu),

        //Actions right side icon
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.account_circle_outlined),
          )
        ],

        //Shape
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(35))),

        //Elevation
        elevation: 90,
      ),

      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            elevation: 10,
            child: Column(children: []),
          ),
        ),
      ]),
      drawer: Drawer(
        //  backgroundColor: Colors.blue[600],
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Garage'),
              accountEmail: Text('binav@gmail.com'),
              currentAccountPicture: (CircleAvatar(
                backgroundImage: AssetImage('images/ig.jpg'),
                backgroundColor: Colors.pink,
              )),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(
                "Home",
                style: TextStyle(fontSize: 20),
              ),
              textColor: Colors.black,
            ),
            ListTile(
              leading: Icon(Icons.bar_chart_rounded),
              title: Text(
                "Account",
                style: TextStyle(fontSize: 20),
              ),
              textColor: Colors.black,
            ),
            ListTile(
              leading: Icon(Icons.garage_sharp),
              title: Text(
                "In & Out",
                style: TextStyle(fontSize: 20),
              ),
              textColor: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
