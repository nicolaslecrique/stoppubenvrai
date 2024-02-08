import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:uuid/uuid.dart';

class Model extends ChangeNotifier {

  final User user;

  Model({required this.user});

  void uploadPhoto(XFile photo) async {
    final storage = FirebaseStorage.instance;
    final storageRef = storage.ref();
    final uuid = const Uuid().v4();
    final userUid = user.uid;
    final imageSuffix = extension(photo.path);
    final imageRef = storageRef.child("user/$userUid/$uuid.$imageSuffix");
    await imageRef.putFile(File(photo.path));
  }

}