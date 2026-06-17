import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:barzidorock_f/models/venue.dart';
import 'package:barzidorock_f/models/venues_data.dart';
import 'package:barzidorock_f/services/place_service.dart';
import 'package:barzidorock_f/screens/venue_detail_screen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  late PlaceService _placeService;
  final LatLng _center = const LatLng(37.5665, 126.9780); // Seoul, South Korea

  Set<Marker> _markers = {};
  bool _isLoading = false;
  String _selectedCategory = '전체'; // Default filter

  // Google Places 검색을 위한 지역 정의
  static const LatLng _hongdaeLocation = LatLng(37.5576, 126.9219); // 홍대 중심
  static const LatLng _itaewonLocation = LatLng(37.5345, 126.9905); // 이태원 중심
  static const double _searchRadius = 2000; // 2km 반경

  @override
  void initState() {
    super.initState();
    _placeService = Provider.of<PlaceService>(context, listen: false);
    // 앱 시작시 전체 필터 적용하여 마커 로드
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _applyFilter();
    });
  }

  Future<List<Venue>> _searchPlaces(String query, LatLng location) async {
    try {
      final places = await _placeService.searchPlaces(query, location, _searchRadius);
      return places;
    } catch (e) {
      print('MapScreen: Error searching places: $e'); // 디버깅: 에러 출력
      return [];
    }
  }

  Future<void> _applyFilter() async {
    print('MapScreen: Applying filter for category: $_selectedCategory'); // 디버깅: 선택된 카테고리 출력

    setState(() {
      _isLoading = true;
      _markers.clear(); // 기존 마커 초기화
    });

    List<Venue> currentVenues = [];

    if (_selectedCategory == '전체') {
      final hongdaePlaces = getHongdaeVenues();
      final itaewonPlaces = getItaewonVenues();
      currentVenues.addAll(hongdaePlaces);
      currentVenues.addAll(itaewonPlaces);
    } else if (_selectedCategory == '홍대') {
      final localPlaces = getHongdaeVenues();
      currentVenues.addAll(localPlaces);
    } else if (_selectedCategory == '이태원') {
      final localPlaces = getItaewonVenues();
      currentVenues.addAll(localPlaces);
    }

    print('MapScreen: Number of venues received from _searchPlaces: ${currentVenues.length}'); // 디버깅: 검색된 장소 개수 출력

    setState(() {
      _markers.addAll(currentVenues.map((venue) {
        return Marker(
          markerId: MarkerId(venue.id),
          position: venue.location,
          infoWindow: InfoWindow(
            title: venue.name,
            snippet: venue.description,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VenueDetailScreen(venue: venue),
                ),
              );
            },
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue), // Google Places 마커는 파란색
        );
      }).toSet());
      print('MapScreen: Number of markers added: ${_markers.length}'); // 디버깅: 추가된 마커 개수 출력
      _isLoading = false;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('BarZidoROCK', softWrap: false),
            const SizedBox(width: 20),
            _buildFilterButton('전체', () {
              setState(() {
                _selectedCategory = '전체';
                _applyFilter();
              });
            }),
            const SizedBox(width: 8),
            _buildFilterButton('홍대', () {
              setState(() {
                _selectedCategory = '홍대';
                _applyFilter();
              });
            }),
            const SizedBox(width: 8),
            _buildFilterButton('이태원', () {
              setState(() {
                _selectedCategory = '이태원';
                _applyFilter();
              });
            }),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: _center,
                      zoom: 11.0,
                    ),
                    markers: _markers,
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String category, VoidCallback onPressed) {
    final isSelected = _selectedCategory == category;
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: isSelected ? Colors.white : Colors.white70,
        backgroundColor: isSelected ? Theme.of(context).colorScheme.primary : Colors.transparent,
        side: BorderSide(
          color: isSelected ? Theme.of(context).colorScheme.primary : Colors.white54,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        minimumSize: const Size(0, 36),
      ),
      child: Text(category, style: const TextStyle(fontSize: 13)),
    );
  }
}