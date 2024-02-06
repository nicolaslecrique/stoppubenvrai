import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:stoppubenvrai/model.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.green[100], // Couleur verte claire pour une impression de nature
        ),
        padding: EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/stop_pub_sticker.png', // Chemin vers votre image de logo
                    width: 300, // Ajustez la largeur selon vos besoins
                    height: 150, // Ajustez la hauteur selon vos besoins
                  ),
                  SizedBox(height: 48.0),
                  Text(
                    'Merci pour votre aide!\n\nCet annonceur recevra un rappel à la loi et des sanctions encourues',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontFamily: 'Roboto', // Utiliser Roboto pour tout le texte
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity, // Faire en sorte que le bouton occupe toute la largeur
              height: 80.0, // Définir une hauteur plus grande pour le bouton
              child: ElevatedButton(
                onPressed: () {
                  takePhoto(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Fond rouge pour le bouton
                ),
                child: Text(
                  'Envoyez une autre pub',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Texte blanc pour le bouton
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}