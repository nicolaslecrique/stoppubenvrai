import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:stoppubenvrai/model.dart';
import 'package:stoppubenvrai/routes/after_send_screen.dart';

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
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xff007F40) ,
                Color(0xff34A247) ,
                //Color(0xff007F40),
                //Color(0xff34A247),
                Colors.white,
                Colors.white,
                Colors.white,
              ],
            )
        ),
        padding: EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity, // Faire en sorte que le bouton occupe toute la largeur
              height: 300.0, // Définir une hauteur plus grande pour le bouton
              child: Image.asset(
                'assets/stop_pub_sticker.png', // Chemin vers votre image de logo
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Faisons respecter notre autocollant STOP PUB',
                    style: TextStyle(
                      fontSize: 24.0,

                      fontFamily: 'Roboto', // Utiliser Roboto pour tout le texte
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 48.0),
                  Text(
                    'En un instant et anonymement, envoyez un rappel à la loi à l\'annonceur',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
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
              child: ElevatedButton.icon(
                onPressed: () {
                  takePhoto(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff34A247) , // Fond rouge pour le bouton
                ),
                icon: Icon(Icons.photo_camera, color: Colors.white),
                label: Text(
                  'Prendre la pub en photo',
                  style: TextStyle(
                    fontSize: 20.0,
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