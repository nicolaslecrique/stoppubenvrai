import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stoppubenvrai/routes/after_send_screen.dart';
import 'package:stoppubenvrai/routes/main_screen.dart';

import 'firebase_options.dart';
import 'model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAuth.instance.signInAnonymously();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => Model())],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: MainScreen.route,
          routes: {
            MainScreen.route: (BuildContext context) => const MainScreen(),
            AfterSendScreen.route:  (BuildContext context) => AfterSendScreen(),
          }),
    );
  }
}