// lib/home_screen.dart
import 'package:flutter/material.dart';
import 'package:barzidorock_f/map_screen.dart';
import 'package:barzidorock_f/screens/ticket_screen.dart'; // 나중에 생성할 TicketScreen

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // 현재 선택된 탭 인덱스

  // 각 탭에 해당하는 화면 목록
  late final List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      const MapScreen(initialCategory: '전체'),
      const MapScreen(initialCategory: '홍대'),
      const MapScreen(initialCategory: '이태원'),
      const TicketScreen(), // TicketScreen은 나중에 생성
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: '전체',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city),
            label: '홍대',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: '이태원',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplane_ticket),
            label: '티켓',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // 탭이 4개 이상일 때 고정
      ),
    );
  }
}