import 'package:flutter/material.dart';
import 'package:loan_keeper/models/match.dart';

class MatchDetailScreen extends StatelessWidget {
  final MatchModel match;

  const MatchDetailScreen({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${match.team1} vs ${match.team2}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Konum: ${match.location}'),
            Text('Saat: ${match.time}'),
            // Diğer maç detaylarını buraya ekleyin
          ],
        ),
      ),
    );
  }
}
