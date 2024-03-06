import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/image_path.dart';
import '../utils/project_strings.dart';

class RegisterScreen extends StatefulWidget {
  final Function()? onTap;
  const RegisterScreen({
    super.key,
    this.onTap, //required
  });

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void signUserUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.lime,
          ),
        );
      },
    );
    try {
      //iki şifre eşleşiyor mu konrol ediyor
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        showErrorMessage('Şifreler birbiriyle eşleşmiyor');
      }
      // Giriş başarılı olduğunda yapılacak işlemler burada
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      //hata mesajı göster
      showErrorMessage(e.code);
    }
  }

  //error message to user
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(child: Text(message)),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Center(
            child: ListView(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                imageBox().animate().shimmer(duration: const Duration(seconds: 2)),
                loanKeeperRow(),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
                      child: TextField(
                        autocorrect: true,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          hintText: "Email",
                          prefixIcon: Image.asset('assets/soccer_ball.png'),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
                      child: TextField(
                        obscureText: true,
                        autocorrect: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          hintText: "Şifre",
                          prefixIcon: Image.asset('assets/goalkeeper.png'),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
                      child: TextField(
                        obscureText: true,
                        autocorrect: true,
                        controller: confirmPasswordController,
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          hintText: "Şifreyi Doğrula",
                          prefixIcon: Image.asset('assets/goalkeeper.png'),
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
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 18.0,
                    right: 18.0,
                    top: 10,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: signUserUp, child: ProjectText().signIn),
                  ),
                ),
                orRow(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: widget.onTap,
                      child: const Text('Giriş Yap'),
                    ),
                    IconButton(onPressed: () {}, icon: Image.asset(ImagePath().google)),
                  ],
                )
              ],
            ),
          ],
        )),
      ),
    );
  }

  Row orRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(
              color: Colors.lime,
              height: 2,
            ),
          ),
        ),
        ProjectText().or,
        const Expanded(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(
              color: Colors.lime,
              height: 2,
            ),
          ),
        ),
      ],
    );
  }

  Row loanKeeperRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: ProjectText().loanKeeper,
        ),
      ],
    );
  }

  SizedBox imageBox() {
    return SizedBox(
      width: double.infinity,
      height: 280,
      child: Image.asset(
        ImagePath().loginPhoto,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
