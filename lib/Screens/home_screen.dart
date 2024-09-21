import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/weather_model.dart';
import '../services/weather_service.dart';

import '../widgets/weather_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  WeatherModel? _weather;
  bool _loading = false;
  String _errorMessage = '';

  void _searchWeather() async {
    setState(() {
      _loading = true;
      _errorMessage = '';
    });
    try {
      final weather = await Provider.of<WeatherService>(context, listen: false)
          .fetchWeather(_controller.text);
      setState(() {
        _weather = weather;
      });
    } catch (error) {
      setState(() {
        _errorMessage = error.toString();
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather Forecast')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter City or Zip Code',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _searchWeather,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,  // Border color
                    width: 2.0,  // Border width
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.blueAccent,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (_loading) const CircularProgressIndicator(),
            if (_errorMessage.isNotEmpty) Text(_errorMessage),
            if (_weather != null) WeatherItem(weather: _weather!),
          ],
        ),
      ),
    );
  }
}
