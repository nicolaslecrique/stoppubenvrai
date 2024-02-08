import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:stoppubenvrai/model.dart';
import 'package:stoppubenvrai/stop_pub_screen_layout.dart';

class AfterSendScreen extends StatelessWidget {

  static const route = "after_send_route";


  void takePhoto(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo != null){
      if (!context.mounted) return;
      Model model = Provider.of<Model>(context, listen: false);
      model.uploadPhoto(photo);
    }
  }
//Envoyez une autre pub',
  //'Merci pour votre aide!\n\nCet annonceur recevra un rappel à la loi et des sanctions encourues',
  @override
  Widget build(BuildContext context) {
    return StopPubScreenLayout(
      message: "Merci pour votre aide!\n\nNous contactons l'annonceur pour lui rappeler ses obligations",
      buttonMessage: 'Envoyez une autre pub',
      buttonAction: takePhoto,
    );
  }
}
