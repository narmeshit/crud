// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Geo {
  final String lat;
  final String lng;

  Geo({required this.lat, required this.lng});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lat': lat,
      'lng': lng,
    };
  }

  factory Geo.fromMap(Map<String, dynamic> map) {
    return Geo(
      lat: map['lat'] as String,
      lng: map['lng'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Geo.fromJson(String source) => Geo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Geo(lat: $lat, lng: $lng)';
}
