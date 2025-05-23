import 'package:firebase_app/home_page.dart';
import 'package:firebase_app/login_or_register_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream:
            FirebaseAuth.instance
                .authStateChanges(), //checks if the user is logged in or not
        builder: (context, snapshot) {
          //snapshot is used to check if th euser is logged in or not
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}
