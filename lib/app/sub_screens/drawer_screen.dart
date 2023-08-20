import 'package:flutter/material.dart';
import 'package:vester_driver/services/auth.dart';
import 'package:vester_driver/global/global.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vester_driver/splash.dart';
import "./profile_screen.dart";
import "./about_screen.dart";

class DrawerScreen extends StatelessWidget {
  final AuthBase auth = Auth();
  final getFirebase = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    print("13");
    print(userModelCurrentInfo);
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: userModelCurrentInfo != null
                ? Text(
                    userModelCurrentInfo?.name ?? "",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Text(""),
            accountEmail: null, // Remove account email
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://img.icons8.com/color/48/circled-user-male-skin-type-4--v1.png'), // Replace with user's profile image
            ),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              image: DecorationImage(
                fit: BoxFit.fill,
                // image: AssetImage('assets/images/cover.jpg'),
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1579267217516-b73084bd79a6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
                ),
              ),
            ),
            // otherAccountsPictures: [
            //   CircleAvatar(
            //     child: Text(
            //       'USER',
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 12,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //     backgroundColor: Colors.blue,
            //   ),
            // ],
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.verified_user),
                  title: Text('Edit Profile'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (c) => ProfileScreen()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.border_color),
                  title: Text('Feedback'),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.info_sharp),
                  title: Text('About Us'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (c) => AboutPage()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('Logout'),
                  onTap: () {
                    getFirebase.signOut();
                    Auth().signOut();
                    Navigator.push(
                        context, MaterialPageRoute(builder: (c) => Splash()));
                  },
                  iconColor: Colors.red,
                  textColor: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
