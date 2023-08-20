import 'dart:async';

import 'package:vester_driver/model/direction_details_info.dart';
import 'package:vester_driver/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:vester_driver/model/driver_data.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
UserModel? userModelCurrentInfo;
User? currentUser;
Position? driverCurrentPosition;

DirectionDetailsInfo? tripDirectionDetailsInfo;
DriverData onlineDriverData = DriverData();

String? driverVehicleType = "";

String titleStarsRating = "";

StreamSubscription<Position>? streamSubscriptionPosition;
StreamSubscription<Position>? streamSubscriptionDriverLivePosition;

AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
