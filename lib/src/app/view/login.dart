import 'package:bank_geek/src/app/routes/routegenerator.dart';
import 'package:bank_geek/src/app/view/welcome.dart';
import 'package:bank_geek/src/app/widgets_reusable/elevatedbuttonshort.dart';
import 'package:bank_geek/src/app/widgets_reusable/textfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _controllerEmail = TextEditingController(
  );
  final TextEditingController _controllerPassword = TextEditingController(
  );
  FirebaseAuth auth = FirebaseAuth.instance;

  _makeLogin() async {
    if(_controllerEmail.text.isEmpty && _controllerPassword.text.isEmpty){
      showDialog(
          context: context,
          builder: (context){
            return AlertDialog(
              backgroundColor: const Color(0xff320995),
              title: const Text(
                'Atenção',
                style: TextStyle(
                    color: Colors.white
                ),
              ),
              content: const Text(
                'Todos os campos são obrigatórios!',
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
      return await auth.signInWithEmailAndPassword(
          email: _controllerEmail.text,
          password: _controllerPassword.text
      ).then((firebaseUser){
        Navigator.pushReplacementNamed(
            context,
            RouteGenerator.ROTA_WELCOME
        );
      })
          .catchError((error){
        showDialog(
            context: context,
            builder: (context){
              return AlertDialog(
                backgroundColor: const Color(0xff320995),
                title: const Text(
                  'Atenção',
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
                content: const Text(
                  'Usuário não localizado!',
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
      });
    }

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
                              'assets/lotties/register1.json',
                              repeat: false,
                            ),
                          ),
                          //TextFields
                          Padding(
                              padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                              child: InputCustomizado(
                                controller: _controllerEmail,
                                hint: 'Email',
                                obscure: false,
                              )
                          ),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                              child: InputCustomizado(
                                controller: _controllerPassword,
                                hint: 'Senha',
                                obscure: true,
                              )
                          ),
                          //Button
                          BotaoCustomizadoShort(
                            onPressed: _makeLogin,
                          ),
                          //Criar conta
                          const SizedBox(height: 15,),
                          TextButton(
                            onPressed: (){
                              Navigator.pushNamed(
                                  context,
                                  RouteGenerator.ROTA_REGISTER
                              );
                            },
                            child: const Text(
                              'CRIAR CONTA',
                              style: TextStyle(
                                  color: Color(0xff6E6E6E)
                              ),
                            ),
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
