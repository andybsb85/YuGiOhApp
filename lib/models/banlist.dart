import 'dart:convert';

class BanList {
  String banGoat;
  BanList({
    required this.banGoat,
  });

  BanList copyWith({
    String? banGoat,
  }) {
    return BanList(
      banGoat: banGoat ?? this.banGoat,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'banGoat': banGoat,
    };
  }

  factory BanList.fromMap(Map<String, dynamic> map) {
    return BanList(
      banGoat: map['banGoat'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BanList.fromJson(String source) =>
      BanList.fromMap(json.decode(source));

  @override
  String toString() => 'BanList(banGoat: $banGoat)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BanList && other.banGoat == banGoat;
  }

  @override
  int get hashCode => banGoat.hashCode;
}
