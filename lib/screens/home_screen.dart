import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/football_pitch.png",
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.4), // Resim üzerine opaklık ekleme
              colorBlendMode: BlendMode.darken, // Opaklık için karışım modu
            ),
          ),
          ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text('Maç Adı'),
                        subtitle: Row(
                          children: [
                            Text('Konum: Gaziosmanpaşa/ İstanbul'),
                            Spacer(),
                            Text('Saat: 20.00'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
