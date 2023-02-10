import 'package:bank_geek/src/app/database_conection/firebase_options.dart';
import 'package:bank_geek/src/app/routes/routegenerator.dart';
import 'package:flutter/material.dart';
import 'package:bank_geek/src/app/database_conection/conectando.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MaterialApp(
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generateRoute,
      home: InitializeDB(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
