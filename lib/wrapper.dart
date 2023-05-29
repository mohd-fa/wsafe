import 'package:flutter/material.dart';
import 'package:wsafe/authenticate/sign_in.dart';
import 'package:wsafe/services/auth.dart';
import 'package:wsafe/screens/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthService();
    return StreamBuilder(
      stream: auth.authStateChanges,
      builder: (context, snapshot) =>
          snapshot.hasData ? const Home() : const SignIn(),
    );
  }
}
