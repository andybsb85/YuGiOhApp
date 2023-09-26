import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:yu_gi_oh_project/models/cardImage.dart';

/// Documentation
///
/// Modelo de Objeto Monster con constructores, getters y setters.

class Monster {
  int? id;
  String? name;
  String? type;
  String? frameType;
  String? desc;
  int? atk;
  String? race;
  String? attribute;
  String? archetype;
  int? linkval;
  List<CardImage>? cardImages;
  Monster({
    required this.id,
    required this.name,
    required this.type,
    required this.frameType,
    required this.desc,
    required this.atk,
    required this.race,
    required this.attribute,
    required this.archetype,
    required this.linkval,
    required this.cardImages,
  });

  Monster.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    frameType = json['frameType'];
    desc = json['desc'];
    atk = json['atk'];
    race = json['race'];
    attribute = json['attribute'];
    archetype = json['archetype'];
    linkval = json['linkval'];
    if (json['card_images'] != null) {
      cardImages = <CardImage>[];
      json['card_images'].forEach((v) {
        cardImages?.add(CardImage.fromJson(v));
      });
    }
  }

  Monster copyWith({
    int? id,
    String? name,
    String? type,
    String? frameType,
    String? desc,
    int? atk,
    String? race,
    String? attribute,
    String? archetype,
    int? linkval,
    List<CardImage>? cardImages,
  }) {
    return Monster(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      frameType: frameType ?? this.frameType,
      desc: desc ?? this.desc,
      atk: atk ?? this.atk,
      race: race ?? this.race,
      attribute: attribute ?? this.attribute,
      archetype: archetype ?? this.archetype,
      linkval: linkval ?? this.linkval,
      cardImages: cardImages ?? this.cardImages,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'frameType': frameType,
      'desc': desc,
      'atk': atk,
      'race': race,
      'attribute': attribute,
      'archetype': archetype,
      'linkval': linkval,
      'cardImages': cardImages?.map((x) => x.toMap()).toList(),
    };
  }

  factory Monster.fromMap(Map<String, dynamic> map) {
    return Monster(
      id: map['id']?.toDouble() ?? 0.0,
      name: map['name'] ?? '',
      type: map['type'] ?? '',
      frameType: map['frameType'] ?? '',
      desc: map['desc'] ?? '',
      atk: map['atk']?.toDouble() ?? 0.0,
      race: map['race'] ?? '',
      attribute: map['attribute'] ?? '',
      archetype: map['archetype'] ?? '',
      linkval: map['linkval']?.toDouble() ?? 0.0,
      cardImages: List<CardImage>.from(
          map['cardImages'].map((x) => CardImage.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  // factory Monster.fromJson(String source) =>
  //    Monster.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Monster(id: $id, name: $name, type: $type, frameType: $frameType, desc: $desc, atk: $atk, race: $race, attribute: $attribute, archetype: $archetype, linkval: $linkval, cardImages: $cardImages)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Monster &&
        other.id == id &&
        other.name == name &&
        other.type == type &&
        other.frameType == frameType &&
        other.desc == desc &&
        other.atk == atk &&
        other.race == race &&
        other.attribute == attribute &&
        other.archetype == archetype &&
        other.linkval == linkval &&
        listEquals(other.cardImages, cardImages);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        type.hashCode ^
        frameType.hashCode ^
        desc.hashCode ^
        atk.hashCode ^
        race.hashCode ^
        attribute.hashCode ^
        archetype.hashCode ^
        linkval.hashCode ^
        cardImages.hashCode;
  }
}
