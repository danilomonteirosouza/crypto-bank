import 'package:bank_geek/src/app/routes/routegenerator.dart';
import 'package:bank_geek/src/app/widgets_reusable/elevatedbuttonlong.dart';
import 'package:bank_geek/src/app/widgets_reusable/textfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Initial extends StatefulWidget {
  const Initial({Key? key}) : super(key: key);

  @override
  State<Initial> createState() => _InitialState();
}

class _InitialState extends State<Initial> {

  void routing(){
    Navigator.pushReplacementNamed(
        context,
        RouteGenerator.ROTA_LOGIN
    );
  }

  @override
  Widget build(BuildContext context) {
    if(defaultTargetPlatform == TargetPlatform.android){
      return Scaffold(
          body: Container(
              color: const Color(0xff320995),
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.zero,
                            child: Lottie.asset('assets/lotties/banking_splash.json'),
                          )
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 200),
                          child: BotaoCustomizadoLong(
                            onPressed: routing,
                            texto: 'Iniciar sessão',
                          )
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
                        child: Text(
                          '®CryptoBank.ltda',
                          style: TextStyle(
                              color: Color(0xff6E6E6E)
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
          )
      );
    } else if(defaultTargetPlatform == TargetPlatform.iOS){
      return const Text('iOS');
    } else {
      return const Text('System not detected');
    }
  }
}
