import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loan_keeper/screens/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    const String vs = 'Vs';
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: signUserOut, icon: const Icon(Icons.logout_sharp)),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/football_pitch.png",
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.4),
              colorBlendMode: BlendMode.darken,
            ),
          ),
          ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.all(12.0),
                child: Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text('Bastır Münih $vs Real Mardin'),
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
