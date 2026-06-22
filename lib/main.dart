import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:barzidorock_f/home_screen.dart'; // HomeScreen import
import 'package:barzidorock_f/services/venue_service.dart';
import 'package:barzidorock_f/services/place_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<VenueService>(create: (_) => VenueService()),
        Provider<PlaceService>(create: (_) => PlaceService(apiKey: 'AIzaSyCPId3GB0P1xwt4hiSJlu-rV41pPOCOLG0')),
      ],
      child: const BarZidoRockApp(),
    ),
  );
}

class BarZidoRockApp extends StatelessWidget {
  const BarZidoRockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BarZidoROCK',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: const HomeScreen(), // HomeScreen으로 변경
    );
  }
}