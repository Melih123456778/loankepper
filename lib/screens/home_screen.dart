import 'package:flutter/material.dart';
import 'package:loan_keeper/screens/create_match_screen.dart';
import 'package:loan_keeper/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Card> matchTiles = [];

  @override
  Widget build(BuildContext context) {
    const String vs = 'Vs';
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoanKeeper'),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateMatchScreen()),
          );
          if (result != null) {
            setState(() {
              matchTiles.add(result);
            });
          }
        },
        child: const Icon(Icons.add),
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
            itemCount: matchTiles.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfileScreen(),
                          ),
                        );
                      },
                      child: matchTiles[index]));
            },
          ),
        ],
      ),
    );
  }
}
