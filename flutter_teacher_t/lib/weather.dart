class Weather {
  final String description;
  final double temperature;
  final String place;

  Weather(
    {required this.description,
    required this.temperature,
    required this.place}
  );

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      description: json['weather'][0]['description'],
      temperature: json['main']['temp'],
      place: json['name'],
    );
  }
}