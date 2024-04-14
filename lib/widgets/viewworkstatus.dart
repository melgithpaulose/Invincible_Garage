import 'package:Garage/model/vehicle_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ViewWorkStatus());
}

// ignore: camel_case_types
class ViewWorkStatus extends StatefulWidget {
  const ViewWorkStatus({Key? key}) : super(key: key);

  @override
  State<ViewWorkStatus> createState() => _viewState();
}

class _viewState extends State<ViewWorkStatus> {
  bool isLoading = false;
  Stream<QuerySnapshot<Map<String, dynamic>>> stram = FirebaseFirestore.instance
      .collection('customer')
      .where('isapproved', isEqualTo: true)
      .snapshots();
  get child => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Works Status"),
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
                return ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;
                    final parentID = document.id;
                    Customer customer = Customer.fromFirestore(data);
                    debugPrint(customer.toString());
                    return ListTile(
                        title: Text(
                          customer.service ?? "NO DATA",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              customer.vehicleNumber ?? "NO DATA",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                            ),
                            Text(
                              customer.vehicleBrand ?? "NO DATA",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                            ),
                            Text(
                              customer.customerName ?? "NO DATA",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                            ),
                            Text(
                              customer.phoneNumber ?? "NO DATA",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                            ),
                            // Add more subtitles here if needed
                          ],
                        ),
                        trailing: (customer.iscompleted ?? false)
                            ? Text("Completed",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold))
                            : Text(
                                "Not Completed",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              )
                        // Add more fields here if needed
                        );
                  }).toList(),
                );
              })),
    );
  }
}

// true ? <> : <> 
