class City {
  final double lat;
  final double lon;

  City({required this.lat, required this.lon});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      lat: json["latitude"],
      lon: json["longitude"],
    );
  }
}
