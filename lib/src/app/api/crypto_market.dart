import 'package:bank_geek/src/app/model/price.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const URL_BASE = 'https://www.mercadobitcoin.net/api/BTC/ticker/';

Future<Ticker> fetchBitcoinData() async {
  final response = await http.get(
      Uri.parse( URL_BASE ),
    );
  if (response.statusCode == 200) {
    String responseAPI = response.body;
    Map<String, dynamic> userMap = jsonDecode(responseAPI);
    Ticker ticker = Ticker.fromJson(userMap);
    print(ticker);
    return ticker;
  } else {
    print(response.statusCode);
    throw Exception( 'Failed to load album' );
  }
}
