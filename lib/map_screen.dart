import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart'; // url_launcher는 VenueDetailScreen에서 사용하므로 남겨둡니다.
import 'package:barzidorock_f/models/venue.dart';
import 'package:barzidorock_f/models/venues_data.dart';
import 'package:barzidorock_f/services/place_service.dart';
import 'package:barzidorock_f/screens/venue_detail_screen.dart';

class MapScreen extends StatefulWidget {
  final String initialCategory; // 초기 카테고리를 받을 필드 추가
  const MapScreen({super.key, this.initialCategory = '전체'}); // 기본값 '전체' 설정

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  late PlaceService _placeService;
  final LatLng _center = const LatLng(37.5665, 126.9780); // Seoul, South Korea

  Set<Marker> _markers = {};
  bool _isLoading = false;
  late String _selectedCategory; // 초기 카테고리를 위젯에서 받아오도록 변경

  // Google Places 검색을 위한 지역 정의
  static const LatLng _hongdaeLocation = LatLng(37.5576, 126.9219); // 홍대 중심
  static const LatLng _itaewonLocation = LatLng(37.5345, 126.9905); // 이태원 중심
  static const double _searchRadius = 2000; // 2km 반경

  @override
  void initState() {
    super.initState();
    _placeService = Provider.of<PlaceService>(context, listen: false);
    _selectedCategory = widget.initialCategory; // 위젯에서 초기 카테고리 설정
    // 앱 시작시 초기 필터 적용하여 마커 로드
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _applyFilter();
    });
  }

  // 위젯이 업데이트될 때 initialCategory가 변경되면 _selectedCategory도 업데이트
  @override
  void didUpdateWidget(covariant MapScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialCategory != oldWidget.initialCategory) {
      setState(() {
        _selectedCategory = widget.initialCategory;
        _applyFilter();
      });
    }
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
        title: Text('BarZidoROCK - $_selectedCategory'), // 선택된 카테고리 표시
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
}