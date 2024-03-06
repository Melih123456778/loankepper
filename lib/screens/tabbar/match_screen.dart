import 'package:flutter/material.dart';
import 'package:loan_keeper/screens/floatingactionbutton/create_match_screen.dart';
import 'package:loan_keeper/screens/profile_screen.dart';
import 'package:loan_keeper/utils/image_path.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen({Key? key}) : super(key: key);

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> with SingleTickerProviderStateMixin {
  final List<Card> matchTiles = [];

  void createMatch() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CreateMatchScreen()),
    );
    if (result != null) {
      setState(() {
        matchTiles.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 195, 214, 193),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          backgroundColor: Colors.lime,
          onPressed: createMatch,
          child: const Icon(Icons.add),
        ),
      ),
      body: ListView.builder(
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
              child: matchTiles[index],
            ),
          );
        },
      ),
    );
  }
}
