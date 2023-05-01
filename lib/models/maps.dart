// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Maps {
  String? googleMaps;
  String? openStreetMaps;
  Maps({
    this.googleMaps,
    this.openStreetMaps,
  });

  Maps copyWith({
    String? googleMaps,
    String? openStreetMaps,
  }) {
    return Maps(
      googleMaps: googleMaps ?? this.googleMaps,
      openStreetMaps: openStreetMaps ?? this.openStreetMaps,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'googleMaps': googleMaps,
      'openStreetMaps': openStreetMaps,
    };
  }

  factory Maps.fromMap(Map<String, dynamic> map) {
    return Maps(
      googleMaps:
          map['googleMaps'] != null ? map['googleMaps'] as String : null,
      openStreetMaps: map['openStreetMaps'] != null
          ? map['openStreetMaps'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Maps.fromJson(String source) =>
      Maps.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Maps(googleMaps: $googleMaps, openStreetMaps: $openStreetMaps)';

  @override
  bool operator ==(covariant Maps other) {
    if (identical(this, other)) return true;

    return other.googleMaps == googleMaps &&
        other.openStreetMaps == openStreetMaps;
  }

  @override
  int get hashCode => googleMaps.hashCode ^ openStreetMaps.hashCode;
}
