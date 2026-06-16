import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:barzidorock_f/models/venue.dart';

class VenueService {
  Future<List<Venue>> loadVenues() async {
    final String response = await rootBundle.loadString('assets/venues.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => Venue.fromJson(json)).toList();
  }
}