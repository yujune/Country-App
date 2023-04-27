// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:country/models/flag.dart';

class Country {
  Name? name;
  Flag? flags;

  Country({
    this.name,
    this.flags,
  });

  Country copyWith({
    Name? name,
    Flag? flags,
  }) {
    return Country(
      name: name ?? this.name,
      flags: flags ?? this.flags,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name?.toMap(),
      'flags': flags?.toMap(),
    };
  }

  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
      name: map['name'] != null
          ? Name.fromMap(map['name'] as Map<String, dynamic>)
          : null,
      flags: map['flags'] != null
          ? Flag.fromMap(map['flags'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Country.fromJson(String source) =>
      Country.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Country(name: $name, flags: $flags)';

  @override
  bool operator ==(covariant Country other) {
    if (identical(this, other)) return true;

    return other.name == name && other.flags == flags;
  }

  @override
  int get hashCode => name.hashCode ^ flags.hashCode;
}

class Name {
  String? common;
  String? official;

  Name({
    this.common,
    this.official,
  });

  Name copyWith({
    String? common,
    String? official,
  }) {
    return Name(
      common: common ?? this.common,
      official: official ?? this.official,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'common': common,
      'official': official,
    };
  }

  factory Name.fromMap(Map<String, dynamic> map) {
    return Name(
      common: map['common'] != null ? map['common'] as String : null,
      official: map['official'] != null ? map['official'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Name.fromJson(String source) =>
      Name.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Name(common: $common, official: $official)';

  @override
  bool operator ==(covariant Name other) {
    if (identical(this, other)) return true;

    return other.common == common && other.official == official;
  }

  @override
  int get hashCode => common.hashCode ^ official.hashCode;
}
