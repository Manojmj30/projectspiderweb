class WeatherModel {
  final String city;
  final double temperature;
  final int humidity;
  final double windSpeed;
  final String description;
  final String icon;

  WeatherModel({
    required this.city,
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.description,
    required this.icon,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      city: json['location']['name'],
      temperature: json['current']['temp_c'],
      humidity: json['current']['humidity'],
      windSpeed: json['current']['wind_kph'],
      description: json['current']['condition']['text'],
      icon: json['current']['condition']['icon'],
    );
  }
}
