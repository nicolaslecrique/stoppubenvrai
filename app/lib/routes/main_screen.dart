import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:stoppubenvrai/model.dart';
import 'package:stoppubenvrai/routes/after_send_screen.dart';
import 'package:stoppubenvrai/stop_pub_screen_layout.dart';

class MainScreen extends StatelessWidget {

  static const route = "main_route";

  const MainScreen({super.key});


  void takePhoto(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo != null){
      if (!context.mounted) return;
      Model model = Provider.of<Model>(context, listen: false);
      model.uploadPhoto(photo);
      var navigator = Navigator.of(context);
      await navigator.pushNamed(AfterSendScreen.route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StopPubScreenLayout(
        message: 'Prenez une photo\n\n Nous ferons un rappel à la loi à l\'annonceur',
        buttonMessage: 'Prendre la pub en photo',
        buttonAction: takePhoto,
      );
    }
  }