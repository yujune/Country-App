// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Flag {
  String? png;
  String? svg;
  String? alt;

  Flag({
    this.png,
    this.svg,
    this.alt,
  });

  Flag copyWith({
    String? png,
    String? svg,
    String? alt,
  }) {
    return Flag(
      png: png ?? this.png,
      svg: svg ?? this.svg,
      alt: alt ?? this.alt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'png': png,
      'svg': svg,
      'alt': alt,
    };
  }

  factory Flag.fromMap(Map<String, dynamic> map) {
    return Flag(
      png: map['png'] != null ? map['png'] as String : null,
      svg: map['svg'] != null ? map['svg'] as String : null,
      alt: map['alt'] != null ? map['alt'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Flag.fromJson(String source) =>
      Flag.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Flag(png: $png, svg: $svg, alt: $alt)';

  @override
  bool operator ==(covariant Flag other) {
    if (identical(this, other)) return true;

    return other.png == png && other.svg == svg && other.alt == alt;
  }

  @override
  int get hashCode => png.hashCode ^ svg.hashCode ^ alt.hashCode;
}
