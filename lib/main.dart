import 'package:barbweb/pages/form_page.dart';
import 'package:barbweb/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  bool isUserLogged = FirebaseAuth.instance.currentUser != null;

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isUserLogged ? const FormPage() : const LoginPage(),
    ),
  );
}
