import 'package:flutter/material.dart';
import '../Model/weather_model.dart';

import 'package:cached_network_image/cached_network_image.dart';

class WeatherItem extends StatelessWidget {
  final WeatherModel weather;

  const WeatherItem({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          weather.city,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        CachedNetworkImage(
          imageUrl: 'https:${weather.icon}',
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Temperature : ',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
            Text('${weather.temperature}°C'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Humidity : ',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
            Text('${weather.humidity}%'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Wind speed : ',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
            Text('${weather.humidity} km/h'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Description : ',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
            Text(weather.description),
          ],
        ),

      ],
    );
  }
}
