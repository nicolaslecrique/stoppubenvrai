import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:uuid/uuid.dart';

class Model extends ChangeNotifier {

  late User _user;

  void init() {
    _user = FirebaseAuth.instance.currentUser!;
  } // it's called after the currentUser is defined (at startup)


  void uploadPhoto(XFile photo) async {
    final storage = FirebaseStorage.instance;
    final storageRef = storage.ref();
    final uuid = const Uuid().v4();
    final userUid = _user.uid;
    final imageSuffix = extension(photo.path);
    final imageRef = storageRef.child("user/$userUid/$uuid.$imageSuffix");
    await imageRef.putFile(File(photo.path));
  }



}