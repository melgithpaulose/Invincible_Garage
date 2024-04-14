import 'package:Garage/model/staff_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(viewstaff());
// }

// ignore: camel_case_types
class viewstaff extends StatefulWidget {
  const viewstaff({Key? key}) : super(key: key);

  @override
  State<viewstaff> createState() => _viewState();
}

class _viewState extends State<viewstaff> {
  bool isLoading = false;
  Stream<QuerySnapshot<Map<String, dynamic>>> stram = FirebaseFirestore.instance
      .collection('staff')
      .where('isActive', isEqualTo: true)
      .snapshots();
  get child => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Staff Details"),
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
                  Navigator.pushNamed(context, '/homepageadmin');
                },
                backgroundColor: Colors.blue[900],
                foregroundColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: StreamBuilder<QuerySnapshot>(
              stream: stram,
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                if ((snapshot.data?.docs.length ?? 0) <= 0) {
                  return Text('NO DATA');
                }
                return ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;
                    final parentID = document.id;
                    Staff staff = Staff.fromFirestore(data);
                    debugPrint(staff.toString());
                    return ListTile(
                      trailing: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        child: Text(
                          "Remove",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onPressed: () => updateStatus(parentID),
                      ),
                      title: Text(
                        staff.staffName ?? "NO DATA",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),

                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            staff.email ?? "NO DATA",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ),
                          Text(
                            staff.staffPhoneNumber ?? "NO DATA",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ),
                          Text(
                            staff.designation ?? "NO DATA",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ),
                          // Add more subtitles here if needed
                        ],
                      ),

                      // Add more fields here if needed
                    );
                  }).toList(),
                );
              })),
    );
  }

  void updateStatus(String parentId) {
    setState(() {
      isLoading = true;
    });
    DocumentReference reference =
        FirebaseFirestore.instance.collection('staff').doc(parentId);
    reference
        .update(
          {'isActive': false},
        )
        .then((value) => debugPrint("User removed"))
        .catchError((error) => debugPrint("Failed to add user: $error"));
    setState(() {
      isLoading = false;
    });
  }
}
