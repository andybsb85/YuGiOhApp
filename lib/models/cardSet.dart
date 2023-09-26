import 'dart:convert';

/// Documentation
///
/// Modelo de Objeto CardSets con constructores, getters y setters.

class CardSet {
  String setName;
  String setCode;
  String setRarity;
  String setRarityCode;
  String setPrice;
  CardSet({
    required this.setName,
    required this.setCode,
    required this.setRarity,
    required this.setRarityCode,
    required this.setPrice,
  });

  CardSet copyWith({
    String? setName,
    String? setCode,
    String? setRarity,
    String? setRarityCode,
    String? setPrice,
  }) {
    return CardSet(
      setName: setName ?? this.setName,
      setCode: setCode ?? this.setCode,
      setRarity: setRarity ?? this.setRarity,
      setRarityCode: setRarityCode ?? this.setRarityCode,
      setPrice: setPrice ?? this.setPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'setName': setName,
      'setCode': setCode,
      'setRarity': setRarity,
      'setRarityCode': setRarityCode,
      'setPrice': setPrice,
    };
  }

  factory CardSet.fromMap(Map<String, dynamic> map) {
    return CardSet(
      setName: map['setName'] ?? '',
      setCode: map['setCode'] ?? '',
      setRarity: map['setRarity'] ?? '',
      setRarityCode: map['setRarityCode'] ?? '',
      setPrice: map['setPrice'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CardSet.fromJson(String source) =>
      CardSet.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CardSet(setName: $setName, setCode: $setCode, setRarity: $setRarity, setRarityCode: $setRarityCode, setPrice: $setPrice)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CardSet &&
        other.setName == setName &&
        other.setCode == setCode &&
        other.setRarity == setRarity &&
        other.setRarityCode == setRarityCode &&
        other.setPrice == setPrice;
  }

  @override
  int get hashCode {
    return setName.hashCode ^
        setCode.hashCode ^
        setRarity.hashCode ^
        setRarityCode.hashCode ^
        setPrice.hashCode;
  }
}
