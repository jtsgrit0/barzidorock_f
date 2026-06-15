import 'package:google_maps_flutter/google_maps_flutter.dart';

class Venue {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final LatLng location;
  final double rating;
  final String category;
  final String? ticketUrl;
  final String? address; // 추가
  final String? phoneNumber; // 추가

  Venue({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.location,
    required this.rating,
    required this.category,
    this.ticketUrl,
    this.address, // 추가
    this.phoneNumber, // 추가
  });

  factory Venue.fromJson(Map<String, dynamic> json) {
    return Venue(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      location: LatLng(json['latitude'], json['longitude']),
      rating: json['rating'].toDouble(),
      category: json['category'],
      ticketUrl: json['ticketUrl'],
      address: json['address'], // 추가
      phoneNumber: json['phoneNumber'], // 추가
    );
  }
}