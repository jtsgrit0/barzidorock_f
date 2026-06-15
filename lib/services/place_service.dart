import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:barzidorock_f/models/venue.dart';

class PlaceService {
  final String apiKey;

  PlaceService({required this.apiKey});

  Future<Map<String, dynamic>> getPlaceDetails(String placeId) async {
    final String url = 'https://maps.googleapis.com/maps/api/place/details/json?'
        'place_id=$placeId'
        '&fields=formatted_address,international_phone_number,website,rating,photos'
        '&key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['result'];
    } else {
      print('Failed to load place details for $placeId: ${response.statusCode}');
      throw Exception('Failed to load place details: ${response.statusCode}');
    }
  }

  Future<List<Venue>> searchPlaces(String query, LatLng location, double radius) async {
    final String url = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?'
        'location=${location.latitude},${location.longitude}'
        '&radius=${radius.toInt()}'
        '&type=bar|night_club|restaurant|point_of_interest' // bar, night_club, restaurant 등 관련 유형 검색
        '&keyword=$query'
        '&key=$apiKey';

    print('PlaceService: Requesting URL: $url'); // 디버깅: 요청 URL 출력

    final response = await http.get(Uri.parse(url));

    print('PlaceService: Response Status Code: ${response.statusCode}'); // 디버깅: 응답 상태 코드 출력
    print('PlaceService: Response Body: ${response.body}'); // 디버깅: 응답 본문 출력

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> results = data['results'];

      print('PlaceService: API Results count: ${results.length}'); // 디버깅: API 결과 개수 출력

      List<Venue> venues = [];
      for (var place in results) {
        final placeId = place['place_id'];
        final details = await getPlaceDetails(placeId); // 상세 정보 가져오기

        final location = place['geometry']['location'];
        venues.add(Venue(
          id: placeId,
          name: place['name'],
          description: details['formatted_address'] ?? place['vicinity'] ?? 'No description available',
          imageUrl: details['photos'] != null && details['photos'].isNotEmpty
              ? 'https://maps.googleapis.com/maps/api/place/photo?'
                  'maxwidth=400&photoreference=${details['photos'][0]['photo_reference']}'
                  '&key=$apiKey'
              : '',
          location: LatLng(location['lat'], location['lng']),
          rating: details['rating']?.toDouble() ?? 0.0,
          category: 'Google Place',
          ticketUrl: details['website'], // 웹사이트를 ticketUrl로 사용
          address: details['formatted_address'],
          phoneNumber: details['international_phone_number'],
        ));
      }
      print('PlaceService: Returning ${venues.length} venues.'); // 디버깅: 반환되는 Venue 개수 출력
      return venues;
    } else {
      print('PlaceService: Failed to load places: ${response.statusCode}'); // 디버깅: 장소 로드 실패
      throw Exception('Failed to load places: ${response.statusCode}');
    }
  }
}