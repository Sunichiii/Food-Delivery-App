import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Pages/home_page.dart';
import 'package:food_delivery/services/Auth/login_or_register.dart';
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          //user is logged
          if(snapshot.hasData){
            return const HomePage();
          }
          //user is not logged in
          else{
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
