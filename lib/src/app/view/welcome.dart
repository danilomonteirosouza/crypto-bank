import 'package:bank_geek/src/app/api/crypto_market.dart';
import 'package:bank_geek/src/app/model/price.dart';
import 'package:bank_geek/src/app/widgets_reusable/elevatedbuttonlong.dart';
import 'package:flutter/material.dart';
import 'package:bank_geek/src/app/routes/routegenerator.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  FirebaseAuth auth = FirebaseAuth.instance;
  late Future<Ticker> futureCrypto;
  var f = NumberFormat("###,###.00#", "pt_BR");

  void updateScreen(){
    setState(() {
      futureCrypto = fetchBitcoinData();
    });
  }

  Future<void> _deslogarUsuario() async {
    return await auth.signOut();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureCrypto = fetchBitcoinData();
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff320995),
        elevation: 0,
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert,color: Colors.white),
            color: const Color(0xff320995),
            itemBuilder: (context){
                return [
                  const PopupMenuItem<int>(
                    value: 0,
                    child: Text(
                      "Logout",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  ),
                ];
              },
              onSelected: (value){
                if(value == 0){
                  _deslogarUsuario();
                  Navigator.pushReplacementNamed(
                    context,
                    RouteGenerator.ROTA_LOGIN
                  );
                }
              }
          ),
        ],
      ),
      body: Container(
        color: const Color(0xFF320995),
        child: Column(
          children: <Widget>[
            Lottie.asset(
                'assets/lotties/bitcoin.json',
                repeat: true
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
             child: Text(
               'Maior valor transacionado',
               style: TextStyle(
                   color: Colors.white,
                   fontSize: 30
               ),
             )
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: FutureBuilder<Ticker>(
                future: futureCrypto,
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    return Text(
                      'R\$: ${f.format(double.parse(snapshot.data!.price?.high
                      as String))}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30
                      ),
                    );
                  } else if( snapshot.hasError ){
                    return Text(snapshot.hasError as String);
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
            const SizedBox( height: 70),
            BotaoCustomizadoLong(
              onPressed: updateScreen,
              texto: 'Atualizar',
            )
          ],
        ),
      )
    );
  }
}
