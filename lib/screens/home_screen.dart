import 'package:flutter/material.dart';
import 'package:loan_keeper/screens/create_match_screen.dart';
import 'package:loan_keeper/screens/profile_screen.dart';
import 'package:loan_keeper/screens/tabbar/goalkeeper_screen.dart';
import 'package:loan_keeper/screens/tabbar/match_screen.dart';
import 'package:loan_keeper/utils/image_path.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  final List<Card> matchTiles = [];
  late TabBarController _tabBarController;

  @override
  void initState() {
    super.initState();
    _tabBarController = TabBarController();
    _tabBarController.tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabBarController.tabController.dispose();
    super.dispose();
  }

  void goToProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfileScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 163, 185, 161),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 163, 185, 161),
        title: const Text('LoanKeeper'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: goToProfile, icon: const Icon(Icons.person)),
        ],
        bottom: TabBar(
          controller: _tabBarController.tabController,
          indicatorColor: Colors.lime,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black45,
          tabs: const [
            Tab(text: 'Maç Bul'),
            Tab(text: 'Kaleci Bul'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabBarController.tabController,
        children: const [
          MatchScreen(),
          GoalKeeperScreen(),
        ],
      ),
    );
  }
}

class TabBarController {
  late TabController tabController;
}
