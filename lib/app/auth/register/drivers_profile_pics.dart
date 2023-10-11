import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import './driver_info.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AvatarChangerPage extends StatefulWidget {
  @override
  _AvatarChangerPageState createState() => _AvatarChangerPageState();
}

class _AvatarChangerPageState extends State<AvatarChangerPage> {
  File? profile_image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        profile_image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Picture'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 80,
                backgroundImage:
                    profile_image != null ? FileImage(profile_image!) : null,
                child: profile_image == null
                    ? Icon(
                        Icons.person,
                        size: 60,
                      )
                    : null,
              ),
            ),
            SizedBox(height: 20),
            if (profile_image != null)
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (c) => DriverInformation(
                                profile_pic: profile_image!,
                              )));
                },
                child: Text('Set as Profile Picture'),
              ),
          ],
        ),
      ),
    );
  }
}
