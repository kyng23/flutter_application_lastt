// ignore_for_file: prefer_typing_uninitialized_variables

class WeatherForecast {
  final List dataseries;

  final timepoint;
  final cloudcover;
  final seeing;
  final transparency;
  final liftedIndex;
  final rh2m;
  final wind10m;
  final direction;
  final speed;
  final temp2m;
  final precType;

  WeatherForecast(
      {required this.dataseries,
      required this.timepoint,
      required this.cloudcover,
      required this.seeing,
      required this.transparency,
      required this.liftedIndex,
      required this.rh2m,
      required this.wind10m,
      required this.direction,
      required this.speed,
      required this.temp2m,
      required this.precType});

  factory WeatherForecast.fromJson(Map<String, dynamic> json) {
    return WeatherForecast(
        dataseries: json["dataseries"],
        timepoint: json["dataseries"][0]["timepoint"],
        cloudcover: json["dataseries"][0]["cloudcover"],
        seeing: json["dataseries"][0]["seeing"],
        transparency: json["dataseries"][0]["transparency"],
        liftedIndex: json["dataseries"][0]["lifted_index"],
        rh2m: json["dataseries"][0]["rh2m"],
        wind10m: json["dataseries"][0]["wind10m"],
        direction: json["dataseries"][0]["wind10m"]["direction"],
        speed: json["dataseries"][0]["wind10m"]["speed"],
        temp2m: json["dataseries"][0]["temp2m"],
        precType: json["dataseries"][0]["prec_type"]);
  }
}
