import 'package:vester_driver/Assistants/assistant_method.dart';
import 'package:vester_driver/splash.dart';
import 'package:flutter/material.dart';
import '../../global/global.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './home_tab.dart';

class ProfileTabPage extends StatefulWidget {
  const ProfileTabPage({super.key});

  @override
  State<ProfileTabPage> createState() => _ProfileTabPageState();
}

class _ProfileTabPageState extends State<ProfileTabPage> {
  final nameTextEditingController = TextEditingController();
  final addressTextEditingController = TextEditingController();
  final phoneTextEditingController = TextEditingController();

  DatabaseReference userRef = FirebaseDatabase.instance.ref().child("drivers");

  Future<void> showDriverNameDialogAlert(BuildContext context, String name) {
    nameTextEditingController.text = name;

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Update"),
            content: SingleChildScrollView(
                child: Column(children: [
              TextFormField(
                controller: nameTextEditingController,
              )
            ])),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: Colors.red),
                  )),
              TextButton(
                  onPressed: () {
                    userRef.child(firebaseAuth.currentUser!.uid).update({
                      "name": nameTextEditingController.text.trim(),
                    }).then((value) {
                      nameTextEditingController.clear();
                      Fluttertoast.showToast(msg: "Updated successfully");
                      AssistantMethods.driverInformation(context);
                    }).catchError((errorMessage) {
                      Fluttertoast.showToast(
                          msg: "Error Occured. \n $errorMessage");
                    });

                    Navigator.pop(context);
                  },
                  child: Text(
                    "Ok",
                    style: TextStyle(color: Colors.black),
                  ))
            ],
          );
        });
  }

  Future<void> showDriverPhoneDialogAlert(BuildContext context, String phone) {
    phoneTextEditingController.text = phone;

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Update"),
            content: SingleChildScrollView(
                child: Column(children: [
              TextFormField(
                controller: phoneTextEditingController,
              )
            ])),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: Colors.red),
                  )),
              TextButton(
                  onPressed: () {
                    userRef.child(firebaseAuth.currentUser!.uid).update({
                      "phone": nameTextEditingController.text.trim(),
                    }).then((value) {
                      nameTextEditingController.clear();
                      Fluttertoast.showToast(msg: "Updated successfully");
                      AssistantMethods.driverInformation(context);
                    }).catchError((errorMessage) {
                      Fluttertoast.showToast(
                          msg: "Error Occured. \n $errorMessage");
                    });

                    Navigator.pop(context);
                  },
                  child: Text(
                    "Ok",
                    style: TextStyle(color: Colors.black),
                  ))
            ],
          );
        });
  }

  Future<void> showDriverAddressDialogAlert(
      BuildContext context, String address) {
    addressTextEditingController.text = address;

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Update"),
            content: SingleChildScrollView(
                child: Column(children: [
              TextFormField(
                controller: addressTextEditingController,
              )
            ])),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: Colors.red),
                  )),
              TextButton(
                  onPressed: () {
                    userRef.child(firebaseAuth.currentUser!.uid).update({
                      "address": nameTextEditingController.text.trim(),
                    }).then((value) {
                      nameTextEditingController.clear();
                      Fluttertoast.showToast(msg: "Updated successfully");
                      AssistantMethods.driverInformation(context);
                    }).catchError((errorMessage) {
                      Fluttertoast.showToast(
                          msg: "Error Occured. \n $errorMessage");
                    });

                    Navigator.pop(context);
                  },
                  child: Text(
                    "Ok",
                    style: TextStyle(color: Colors.black),
                  ))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
            backgroundColor: Colors.black,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
                backgroundColor: Colors.transparent,
                leading: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back_ios, color: Colors.black)),
                title: Text("Profile Screen",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold))),
            body: ListView(
              padding: EdgeInsets.all(0),
              children: [
                Center(
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 50),
                        child: Column(
                          children: [
                            // Container(
                            //     padding: EdgeInsets.all(50),
                            //     decoration: BoxDecoration(
                            //       color: Colors.lightBlue,
                            //       shape: BoxShape.circle,
                            //     ),
                            //     child: Icon(
                            //       Icons.person,
                            //       color: Colors.white,
                            //     )),

                            CircleAvatar(
                              backgroundColor: Colors
                                  .blue, // Customize the background color as needed
                              radius: 30, // Customize the radius as needed
                              child: Text(
                                "${onlineDriverData.name![0].toUpperCase()}",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors
                                      .white, // Customize the text color as needed
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${onlineDriverData.name}",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      showDriverNameDialogAlert(
                                          context, onlineDriverData.name!);
                                    },
                                    icon: Icon(Icons.edit, color: Colors.blue))
                              ],
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.white,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${onlineDriverData.phone}",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      showDriverPhoneDialogAlert(
                                          context, onlineDriverData.phone!);
                                    },
                                    icon: Icon(Icons.edit, color: Colors.blue))
                              ],
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.white,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${onlineDriverData.address}",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      showDriverAddressDialogAlert(
                                          context, onlineDriverData.address!);
                                    },
                                    icon: Icon(Icons.edit, color: Colors.blue))
                              ],
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.white,
                            ),
                            Text("${onlineDriverData.email!}",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "${onlineDriverData.v_model} \n ${onlineDriverData.v_color} (${onlineDriverData.v_number})",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                Image.asset(
                                  onlineDriverData.car_type == "Taxi"
                                      ? "images/car.png"
                                      : "images/bike.png",
                                  width: 50,
                                )
                              ],
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                                onPressed: () {
                                  firebaseAuth.signOut();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (c) => Splash()));
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.redAccent),
                                child: Text("Log Out"))
                          ],
                        )))
              ],
            )));
  }
}
