import 'package:bank_geek/src/app/view/initial.dart';
import 'package:bank_geek/src/app/view/welcome.dart';
import 'package:flutter/material.dart';
import '../view/login.dart';
import '../view/register.dart';

class RouteGenerator {

  static const String ROTA_PRINCIPAL = "/initial";
  static const String ROTA_LOGIN = "/login";
  static const String ROTA_REGISTER = "/register";
  static const String ROTA_WELCOME = "/welcome";

  static Route<dynamic>? generateRoute( RouteSettings settings ){

    switch( settings.name ){
      case ROTA_PRINCIPAL :
        return MaterialPageRoute(
            builder: (_) => const Initial()
        );
      case ROTA_LOGIN :
        return MaterialPageRoute(
            builder: (_) => const Login()
        );
        case ROTA_REGISTER :
        return MaterialPageRoute(
            builder: (_) => const Register()
        );
      case ROTA_WELCOME :
        return MaterialPageRoute(
            builder: (_) => const Welcome()
        );
      default: _erroRota();
    }
    return null;
  }
  static Route<dynamic> _erroRota(){
    return MaterialPageRoute(
        builder: (_){
          return Scaffold(
            appBar: AppBar(title: const Text("Rota não encontrada"),),
            body: const Center(
              child: Text("Rota não encontrada"),
            ),
          );
        }
    );
  }
}
