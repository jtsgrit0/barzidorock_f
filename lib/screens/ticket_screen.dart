// lib/screens/ticket_screen.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('티켓'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '티켓 구매를 위해 아래 버튼을 눌러주세요.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => _launchUrl('https://jtsgrit0.github.io/barzidorock/tickets'),
              icon: const Icon(Icons.airplane_ticket),
              label: const Text('티켓 구매 페이지로 이동'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}