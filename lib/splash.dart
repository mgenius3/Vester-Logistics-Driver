import 'package:vester_driver/Assistants/assistant_method.dart';
import 'package:flutter/material.dart';
import 'package:vester_driver/app/landing_page.dart';
import 'package:vester_driver/services/auth.dart';
import 'package:vester_driver/services/auth.dart';
import 'dart:async';
import "package:firebase_auth/firebase_auth.dart";
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vester_driver/app/auth/signIn/email_sign_in_page.dart';
import 'package:vester_driver/app/sub_screens/map_screen.dart';
import 'package:provider/provider.dart';
import 'package:vester_driver/app/auth/register/driver_info.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:vester_driver/app/auth/register/driver_info.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final auth = Auth();
  final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

  startTimer() {
    Timer(Duration(seconds: 3), () async {
      if (await FirebaseAuth.instance.currentUser != null) {
        databaseReference
            .child(
                'drivers/${FirebaseAuth.instance.currentUser!.uid}/information')
            .once()
            .then((snapData) {
          if (snapData.snapshot.value != null) {
            //if driver has registered his or her vehicle
            FirebaseAuth.instance.currentUser != null
                ? AssistantMethods.readCurrentOnlineUserInfo()
                : null;
            Navigator.push(
                context, MaterialPageRoute(builder: (c) => MapScreen()));
          } else {
            Navigator.push(context,
                MaterialPageRoute(builder: (c) => DriverInformation()));
          }
        }).catchError((error) {
          print('Error: $error');
        });
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => EmailSignInPage()));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/logo.png', // Replace with the path to your image
              fit: BoxFit.cover, // Adjust the image fit as needed
            ),
          ],
        ),
      ),
    );
  }
}
