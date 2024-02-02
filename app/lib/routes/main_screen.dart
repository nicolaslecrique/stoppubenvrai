import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
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
                  SizedBox(height: 24.0),
                  Text(
                    '800 000 tonnes de pubs vont droit à la poubelle chaque année.\n\nFaisons respecter notre autocollant STOP PUB.',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontFamily: 'Roboto', // Utiliser Roboto pour tout le texte
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    'En 2 secondes, envoyez anonymement un rappel à la loi à l\'annonceur',
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
              child: ElevatedButton(
                onPressed: () {
                  // Gérer le clic sur le bouton
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Fond rouge pour le bouton
                ),
                child: Text(
                  'Prendre la pub en photo',
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