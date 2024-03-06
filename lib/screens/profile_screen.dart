import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loan_keeper/screens/home_screen.dart';
import 'package:loan_keeper/services/comment_service.dart';
import 'package:loan_keeper/utils/image_path.dart';
import 'package:loan_keeper/utils/project_strings.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final CommentService _commentService = CommentService();
  final List<String> _comments = [];
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  void showCommentBottomSheet() {
    TextEditingController commentController = TextEditingController();
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 300,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18),
                  child: TextField(
                    controller: commentController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: "Yorum",
                      prefixIcon: const Icon(Icons.comment),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(color: Colors.lime),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(color: Colors.lime.shade700),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      await _commentService.addStatus(commentController.text);
                      Navigator.pop(context);
                      setState(() {
                        _comments.add(commentController.text);
                      });
                    },
                    child: const Text('Gönder'))
              ],
            ),
          ),
        );
      },
    );
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
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
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
                            Navigator.pop(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            );
                          },
                          icon: const Icon(Icons.arrow_back),
                        ),
                        ProjectText().playerInfo,
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            playerInfoTitle('Mevki'),
                            playerInfoTitle('Boy'),
                            playerInfoTitle('Kilo'),
                            playerInfoTitle('Yaş'),
                          ],
                        ),
                        const Row(
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
                        ),
                      ],
                    ),
                  ),
                  // Kullanıcı null değilse email'i göster, null ise bir yedek değer göster
                  Text('Kullanıcı: ${user?.email ?? 'Giriş Yapılmadı'}'),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Yorumlar',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _comments.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(_comments[index]),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: showCommentBottomSheet,
              child: const Text('Yorum Yazın'),
            ),
          ],
        ),
      ),
    );
  }

  Text playerInfoTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Color.fromARGB(255, 53, 61, 65),
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
