import 'package:bank_geek/src/app/routes/routegenerator.dart';
import 'package:bank_geek/src/app/widgets_reusable/elevatedbuttonshort.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final TextEditingController _controlleName = TextEditingController();
  final TextEditingController _controlleEmail = TextEditingController();
  final TextEditingController _controllePassword = TextEditingController();
  final CollectionReference _data = FirebaseFirestore.instance.collection('users');
  FirebaseAuth auth = FirebaseAuth.instance;

  void validarCampos(){
    if( _controlleName.text.isEmpty
        && _controlleEmail.text.isEmpty &&
        _controllePassword.text.isEmpty){
      showDialog(
          context: context,
          builder: (context){
            return AlertDialog(
              backgroundColor: const Color(0xff320995),
              title: const Text(
                'Atenção!',
                style: TextStyle(
                    color: Colors.white
                ),
              ),
              content: const Text(
                'Todos os campos são obrigatórios',
                style: TextStyle(
                    color: Colors.white
                ),
              ),
              actions: <Widget>[
                TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text(
                      'OK',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    )
                ),
              ],
            );
          }
      );

    } else {
      _addData();
      _registerUser();
      Navigator.pushNamedAndRemoveUntil(
          context,
          RouteGenerator.ROTA_LOGIN,
              (route) => false
      );
    }
  }

  Future<void> _registerUser() async {
    return await auth.createUserWithEmailAndPassword(
        email: _controlleEmail.text,
        password: _controllePassword.text
    ).then((firebaseUser) => print("User register successfully!"))
        .catchError((error){
      print("Error $error");
    });
  }

  Future<void> _addData() async {
    return await _data
        .add({
      "name": _controlleName.text.toString(),
      "email": _controlleEmail.text.toString(),
    })
        .then((value) => print("User add succesfully!"))
        .catchError((error) => print("Error $error"));
  }

  @override
  Widget build(BuildContext context) {
    if(defaultTargetPlatform == TargetPlatform.android){
      return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xff320995),
            elevation: 0,
          ),
          body: Container(
            color: const Color(0xff320995),
            child: Stack(
              children: <Widget>[
                CustomScrollView(
                  slivers: <Widget>[
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        children: <Widget>[
                          //Lottie
                          SizedBox(
                            height: 300,
                            child: Lottie.asset(
                              'assets/lotties/create-account.json',
                              repeat: false,
                            ),
                          ),
                          //TextFields
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                            child: TextField(
                              controller: _controlleName,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(20),
                                //labelText: "User",
                                hintText: "Name",
                                hintStyle: const TextStyle( // Altera a cor do texto dentro
                                    color: Color(0xffA5A5A5)
                                ),
                                filled: true,
                                fillColor: const Color(0xff320995),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xffA5A5A5),
                                    ),
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xffA5A5A5),
                                    ),
                                    borderRadius: BorderRadius.circular(20)
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                            child: TextField(
                              controller: _controlleEmail,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(20),
                                //labelText: "User",
                                hintText: "E-mail",
                                hintStyle: const TextStyle( // Altera a cor do texto dentro
                                    color: Color(0xffA5A5A5)
                                ),
                                filled: true,
                                fillColor: const Color(0xff320995),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xffA5A5A5),
                                    ),
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xffA5A5A5),
                                    ),
                                    borderRadius: BorderRadius.circular(20)
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                            child: TextField(
                              controller: _controllePassword,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(20),
                                //labelText: "User",
                                hintText: "Password",
                                hintStyle: const TextStyle( // Altera a cor do texto dentro
                                    color: Color(0xffA5A5A5)
                                ),
                                filled: true,
                                fillColor: const Color(0xff320995),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xffA5A5A5),
                                    ),
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xffA5A5A5),
                                    ),
                                    borderRadius: BorderRadius.circular(20)
                                ),
                              ),
                              obscureText: true,
                            ),
                          ),
                          //Button
                          BotaoCustomizadoShort(
                            onPressed: validarCampos,
                          ),
                          //Copyright
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
                            child: Text(
                              '®CryptoBank.ltda',
                              style: TextStyle(
                                  color: Color(0xff6E6E6E)
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
      );
    } else if(defaultTargetPlatform == TargetPlatform.iOS){
      return const Text('iOS');
    } else {
      return const Text('System not detected');
    }

  }
}
