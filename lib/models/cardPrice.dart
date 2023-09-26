import 'dart:convert';

/// Documentation
///
/// Modelo de Objeto CardPrice con constructores, getters y setters, , fromJson

class CardPrice {
  String cardMarketPrice;
  String tcgplayerPrice;
  String ebayPrice;
  String amazonPrice;
  String coolstuffincPrice;
  CardPrice({
    required this.cardMarketPrice,
    required this.tcgplayerPrice,
    required this.ebayPrice,
    required this.amazonPrice,
    required this.coolstuffincPrice,
  });

  CardPrice copyWith({
    String? cardMarketPrice,
    String? tcgplayerPrice,
    String? ebayPrice,
    String? amazonPrice,
    String? coolstuffincPrice,
  }) {
    return CardPrice(
      cardMarketPrice: cardMarketPrice ?? this.cardMarketPrice,
      tcgplayerPrice: tcgplayerPrice ?? this.tcgplayerPrice,
      ebayPrice: ebayPrice ?? this.ebayPrice,
      amazonPrice: amazonPrice ?? this.amazonPrice,
      coolstuffincPrice: coolstuffincPrice ?? this.coolstuffincPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cardMarketPrice': cardMarketPrice,
      'tcgplayerPrice': tcgplayerPrice,
      'ebayPrice': ebayPrice,
      'amazonPrice': amazonPrice,
      'coolstuffincPrice': coolstuffincPrice,
    };
  }

  factory CardPrice.fromMap(Map<String, dynamic> map) {
    return CardPrice(
      cardMarketPrice: map['cardMarketPrice'] ?? '',
      tcgplayerPrice: map['tcgplayerPrice'] ?? '',
      ebayPrice: map['ebayPrice'] ?? '',
      amazonPrice: map['amazonPrice'] ?? '',
      coolstuffincPrice: map['coolstuffincPrice'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CardPrice.fromJson(String source) =>
      CardPrice.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CardPrice(cardMarketPrice: $cardMarketPrice, tcgplayerPrice: $tcgplayerPrice, ebayPrice: $ebayPrice, amazonPrice: $amazonPrice, coolstuffincPrice: $coolstuffincPrice)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CardPrice &&
        other.cardMarketPrice == cardMarketPrice &&
        other.tcgplayerPrice == tcgplayerPrice &&
        other.ebayPrice == ebayPrice &&
        other.amazonPrice == amazonPrice &&
        other.coolstuffincPrice == coolstuffincPrice;
  }

  @override
  int get hashCode {
    return cardMarketPrice.hashCode ^
        tcgplayerPrice.hashCode ^
        ebayPrice.hashCode ^
        amazonPrice.hashCode ^
        coolstuffincPrice.hashCode;
  }
}
