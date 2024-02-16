import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loan_keeper/screens/home_screen.dart';
import 'package:loan_keeper/utils/image_path.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    const String cm = 'Cm';
    const String kg = 'Kg';
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(
            double.infinity,
            350,
          ),
          child: SafeArea(
            child: Container(
              color: Colors.lime,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomeScreen(),
                                  ));
                            },
                            icon: const Icon(Icons.arrow_back)),
                        const Text(
                          'Oyuncu Bilgileri',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              FirebaseAuth.instance.signOut();
                            },
                            icon: const Icon(Icons.logout)),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 40,
                    backgroundImage: AssetImage(ImagePath().initialGoalkeeper),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text(
                      'Eren Özdemir',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 100,
                    color: const Color.fromARGB(255, 188, 201, 78),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Mevki',
                              style: TextStyle(
                                color: Color.fromARGB(255, 53, 61, 65),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'Boy',
                              style: TextStyle(
                                color: Color.fromARGB(255, 53, 61, 65),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'Kilo',
                              style: TextStyle(
                                color: Color.fromARGB(255, 53, 61, 65),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'Yaş',
                              style: TextStyle(
                                color: Color.fromARGB(255, 53, 61, 65),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Kaleci',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '185 $cm',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '75 $kg',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '27',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
      body: Center(
        child: Column(
          children: [Text('Kullanıcı:${user.email!}')],
        ),
      ),
    );
  }
}
