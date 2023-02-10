class Ticker {
  final Crypto? price;
  const Ticker({ this.price });
  factory Ticker.fromJson(Map<String, dynamic> json) {
    return Ticker(
      price: Crypto.fromJson(json['ticker']),
    );
  }
  @override
  String toString() {
    return '$price';
  }
}

class Crypto {
  final String? high;
  const Crypto({this.high});
  factory Crypto.fromJson(Map<String, dynamic> json) {
    return Crypto(
        high: json['low'],
    );
  }
  @override
  String toString() {
    return '$high';
  }
}
