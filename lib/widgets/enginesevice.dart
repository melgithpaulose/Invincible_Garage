import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EngineService extends StatefulWidget {
  const EngineService({super.key});

  @override
  State<EngineService> createState() => _AddUserState();
}

class _AddUserState extends State<EngineService> {
  CollectionReference _customer =
      FirebaseFirestore.instance.collection('customer');
  int indexNum = 0;
  final transmission = ['Manual', 'Automatic', 'Semi Automatic', 'Other'];
  String? selectedGroup;
  bool isLoading = false;
  TextEditingController _vehicleNumber = TextEditingController();
  TextEditingController _vehiclebrand = TextEditingController();
  TextEditingController _service = TextEditingController();
  TextEditingController _customername = TextEditingController();
  TextEditingController _phonenumber = TextEditingController();

  void adduser() async {
    setState(() {
      isLoading = true;
    });
    await _customer
        .add({
          'vehicle_number': _vehicleNumber.text,
          'vehicle_brand': _vehiclebrand.text,
          'service': _service.text,
          'customer_name': _customername.text,
          'phone_number': _phonenumber.text,
          'isapproved' : false,
          'iscompleted': false
        })
        .then((value) => debugPrint("User Added"))
        .catchError((error) => debugPrint("Failed to add user: $error"));
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _service.text = "Engine service";
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _vehicleNumber.dispose();
    super.dispose();
  }

  //validation
  final _formKey = GlobalKey<FormState>();

  

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Engine Services"),
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
                            controller: _vehicleNumber,
                            decoration: InputDecoration(
                                labelText: "Vehicle Number",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: "Enter Vehicle Number",
                                labelStyle: TextStyle(color: Colors.blue)),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter vehicle number';
                              }
                              return null;
                            },
                            //...rest of your TextFormField code
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _vehiclebrand,
                            decoration: InputDecoration(
                                labelText: "Vehicle Brand",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: "Enter Vehicle Brand",
                                labelStyle: TextStyle(color: Colors.blue)),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter vehicle brand';
                              }
                              return null;
                            },
                            //...rest of your TextFormField code
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: "Vehicle Engine Number",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: "Enter Engine Number",
                                labelStyle: TextStyle(color: Colors.blue)),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter vehicle Engine Number';
                              }
                              return null;
                            },
                            //...rest of your TextFormField code
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _service,
                            decoration: InputDecoration(
                                labelText: "Service",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: "Enter job/service",
                                labelStyle: TextStyle(color: Colors.blue)),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter service';
                              }
                              return null;
                            },
                            //...rest of your TextFormField code
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _customername,
                            decoration: InputDecoration(
                                labelText: "Customer Name",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: "Enter Customer Name",
                                labelStyle: TextStyle(color: Colors.blue)),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter customer name';
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
                                return 'Please enter phone number';
                              }
                              return null;
                            },
                            //...rest of your TextFormField code
                          ),
                        ),
                        
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            maxLines: 5,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                labelText: "Note(Optional)",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: "Other details",
                                labelStyle: TextStyle(color: Colors.blue)),
                          ),
                        ),

                        //...repeat the above pattern for other text form fields

                      ],
                    ),
                  ),
                ),

                SizedBox(
                    width: 10,
                    height: 10,
                  ),
                //...more of your existing UI code

                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Only submit if the form is valid
                      adduser();
                      Navigator.pushNamed(context, '/');
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
                            )
                            )//...rest of your ElevatedButton code
              ],
            ),
          ),
  );
}

}
