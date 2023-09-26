import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// Documentation
///
/// Modelo de Objeto CardImage con constructores, getters y setters, fromJson

class CardImage {
  int? id;
  String? imageUrl;
  String? imageUrlSmall;
  String? imageUrlCropped;
  CardImage({
    this.id,
    this.imageUrl,
    this.imageUrlSmall,
    this.imageUrlCropped,
  });

  CardImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['image_url'];
    imageUrlSmall = json['image_url_small'];
    imageUrlCropped = json['image_url_cropped'];
  }
  CardImage copyWith({
    ValueGetter<int?>? id,
    ValueGetter<String?>? imageUrl,
    ValueGetter<String?>? imageUrlSmall,
    ValueGetter<String?>? imageUrlCropped,
  }) {
    return CardImage(
      id: id != null ? id() : this.id,
      imageUrl: imageUrl != null ? imageUrl() : this.imageUrl,
      imageUrlSmall:
          imageUrlSmall != null ? imageUrlSmall() : this.imageUrlSmall,
      imageUrlCropped:
          imageUrlCropped != null ? imageUrlCropped() : this.imageUrlCropped,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'imageUrlSmall': imageUrlSmall,
      'imageUrlCropped': imageUrlCropped,
    };
  }

  factory CardImage.fromMap(Map<String, dynamic> map) {
    return CardImage(
      id: map['id']?.toInt(),
      imageUrl: map['imageUrl'],
      imageUrlSmall: map['imageUrlSmall'],
      imageUrlCropped: map['imageUrlCropped'],
    );
  }

  String toJson() => json.encode(toMap());

/*   factory CardImage.fromJson(String source) =>
      CardImage.fromMap(json.decode(source));
 */
  @override
  String toString() {
    return 'CardImage(id: $id, imageUrl: $imageUrl, imageUrlSmall: $imageUrlSmall, imageUrlCropped: $imageUrlCropped)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CardImage &&
        other.id == id &&
        other.imageUrl == imageUrl &&
        other.imageUrlSmall == imageUrlSmall &&
        other.imageUrlCropped == imageUrlCropped;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        imageUrl.hashCode ^
        imageUrlSmall.hashCode ^
        imageUrlCropped.hashCode;
  }
}
