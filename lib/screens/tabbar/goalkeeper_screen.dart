import 'package:flutter/material.dart';
import 'package:loan_keeper/screens/floatingactionbutton/create_goalkeeper_screen.dart';
import 'package:loan_keeper/screens/floatingactionbutton/create_match_screen.dart';
import 'package:loan_keeper/screens/profile_screen.dart';
import 'package:loan_keeper/utils/image_path.dart';

class GoalKeeperScreen extends StatefulWidget {
  const GoalKeeperScreen({Key? key}) : super(key: key);

  @override
  State<GoalKeeperScreen> createState() => _GoalKeeperScreenState();
}

class _GoalKeeperScreenState extends State<GoalKeeperScreen> with SingleTickerProviderStateMixin {
  final List<Card> goalkeeperTiles = [];

  void createGoalkeeper() async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CreateGoalkeeperScreen(),
        ));
    if (result != null) {
      setState(() {
        goalkeeperTiles.add(result);
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
          onPressed: createGoalkeeper,
          child: const Icon(Icons.add),
        ),
      ),
      body: ListView.builder(
        itemCount: goalkeeperTiles.length,
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
              child: goalkeeperTiles[index],
            ),
          );
        },
      ),
    );
  }
}
