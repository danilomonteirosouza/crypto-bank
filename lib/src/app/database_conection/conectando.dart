import 'package:bank_geek/src/app/view/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class InitializeDB extends StatefulWidget {
  const InitializeDB({Key? key}) : super(key: key);
  @override
  _InitializeDBState createState() => _InitializeDBState();
}
class _InitializeDBState extends State<InitializeDB> {

  final Future<FirebaseApp> _initDB = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initDB,
        builder: (context, snapshot){
          if(snapshot.hasError){
            return const Text("Failed to communicate with database!");
          }else if(snapshot.connectionState == ConnectionState.done){
            return const SplashScreen();
          }else{
            return const CircularProgressIndicator();
          }
        }
    );
  }
}
