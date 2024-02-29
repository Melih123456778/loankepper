import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loan_keeper/screens/home_screen.dart';
import 'package:loan_keeper/utils/image_path.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    const String cm = 'Cm';
    const String kg = 'Kg';

    // Kullanıcıyı alırken null kontrolü yapın
    final user = FirebaseAuth.instance.currentUser;

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
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                      const Text(
                        'Oyuncu Bilgileri',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      IconButton(
                        onPressed: signUserOut,
                        icon: const Icon(Icons.logout),
                      ),
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
        ),
      ),
      body: Center(
        child: Column(
          children: [
            // Kullanıcı null değilse email'i göster, null ise bir yedek değer göster
            Text('Kullanıcı: ${user?.email ?? 'Giriş Yapılmadı'}'),
          ],
        ),
      ),
    );
  }
}
