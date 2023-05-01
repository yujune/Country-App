// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:country/models/flag.dart';

class Country {
  Name? name;
  Flag? flags;
  List<String>? capital;
  String? region;
  String? subregion;
  num? population;
  Country({
    this.name,
    this.flags,
    this.capital,
    this.region,
    this.subregion,
    this.population,
  });

  Country copyWith({
    Name? name,
    Flag? flags,
    List<String>? capital,
    String? region,
    String? subregion,
    num? population,
  }) {
    return Country(
      name: name ?? this.name,
      flags: flags ?? this.flags,
      capital: capital ?? this.capital,
      region: region ?? this.region,
      subregion: subregion ?? this.subregion,
      population: population ?? this.population,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name?.toMap(),
      'flags': flags?.toMap(),
      'capital': capital,
      'region': region,
      'subregion': subregion,
      'population': population,
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
      capital: map['capital'] != null
          ? List<String>.from(map['capital'] as List<String>)
          : null,
      region: map['region'] != null ? map['region'] as String : null,
      subregion: map['subregion'] != null ? map['subregion'] as String : null,
      population: map['population'] != null ? map['population'] as num : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Country.fromJson(String source) =>
      Country.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Country(name: $name, flags: $flags, capital: $capital, region: $region, subregion: $subregion, population: $population)';
  }

  @override
  bool operator ==(covariant Country other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.flags == flags &&
        listEquals(other.capital, capital) &&
        other.region == region &&
        other.subregion == subregion &&
        other.population == population;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        flags.hashCode ^
        capital.hashCode ^
        region.hashCode ^
        subregion.hashCode ^
        population.hashCode;
  }
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
