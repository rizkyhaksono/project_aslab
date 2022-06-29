import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:test_firebase/Screens/Anjay/buktiTF_body.dart';
import 'package:test_firebase/constants.dart';
import 'Screens/Welcome/welcome_screen.dart';

// to run this app, you need to set the environment variable
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: backgroundcolor,
        //Warna Background aplikasi
        scaffoldBackgroundColor: backgroundcolor,
      ),
      // home: const WelcomeScreen(),
      home: const UploadImageScreen(),
    );
  }
}
