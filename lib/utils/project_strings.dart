import 'package:flutter/material.dart';

class ProjectText {
  final Text welcomeText = const Text(
    'Welcome to \nLoankeeper',
    style: TextStyle(
      letterSpacing: 3,
      color: Colors.black,
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
  );

  final Text initialDesc = const Text(
    "Kadron hazır ama kaleci mi eksik? Hiç dert etme aradığın kaleci LoanKeeper'da!!",
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
  );
  final Text alreadyRegistered = const Text(
    'Already registered?',
    style: TextStyle(
      color: Color.fromARGB(255, 97, 95, 95),
    ),
  );
  final Text login = const Text(
    'Log in',
    style: TextStyle(
      color: Color.fromARGB(255, 97, 95, 95),
    ),
  );
  final Text next = const Text(
    "Next",
    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
  );
  final Text signIn = const Text(
    "Kayıt Ol",
    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
  );
  final Text or = const Text(
    'OR',
    style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
  );
  final Text loanKeeper = const Text(
    'LoanKeeper',
    style: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 28,
    ),
  );
  final Text forgotPswd = const Text(
    'Şifreni mi unuttun?',
    style: TextStyle(
      fontWeight: FontWeight.bold,
    ),
  );
  final Text confirm = const Text(
    'Onayla',
    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
  );
}
