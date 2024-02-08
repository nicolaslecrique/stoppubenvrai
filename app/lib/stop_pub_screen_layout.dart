import 'package:flutter/material.dart';

class StopPubScreenLayout extends StatelessWidget {
  final String message;
  final String buttonMessage;
  final Function(BuildContext context) buttonAction;

  const StopPubScreenLayout({
    super.key,
    required this.message,
    required this.buttonMessage,
    required this.buttonAction
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xff007F40),
              //Color(0xff007F40) ,
              Color(0xff34A247),
              //Color(0xff007F40),
              //Color(0xff34A247),
              //Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
            ],
          )),
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Faisons respecter notre autocollant',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto', // Utiliser Roboto pour tout le texte
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: double
                    .infinity, // Faire en sorte que le bouton occupe toute la largeur
                height: 200.0, // Définir une hauteur plus grande pour le bouton
                child: Image.asset(
                  'assets/stop_pub_sticker.png', // Chemin vers votre image de logo
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 48.0),
                    Text(
                      message,
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        fontFamily:
                            'Roboto', // Utiliser Roboto pour tout le texte
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double
                    .infinity, // Faire en sorte que le bouton occupe toute la largeur
                height: 80.0, // Définir une hauteur plus grande pour le bouton
                child: ElevatedButton.icon(
                  onPressed: () {
                    buttonAction(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xff34A247), // Fond rouge pour le bouton
                  ),
                  icon: const Icon(Icons.photo_camera, color: Colors.white),
                  label: Text(
                    buttonMessage,
                    style: const TextStyle(
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
      ),
    );
  }
}
