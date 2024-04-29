import 'package:case_study/authentication/verify_email.dart';
import 'package:case_study/dashboard/userDashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

import 'logIn.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}
final firebaseApp = Firebase.app();
final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseDatabase _database = FirebaseDatabase.instance;

class _WrapperState extends State<Wrapper> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: _auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final User? currentUser = snapshot.data;
          if (currentUser != null && currentUser.emailVerified ) {
            return StreamBuilder<DatabaseEvent>(
              stream: _database.ref('users/${currentUser.uid}/role').onValue,
              builder: (context, snapshot) {
                print(snapshot);
                if (snapshot.hasData) {
                  return UserDashboard(); // Handle routing based on role
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            );
          } else {
            return Verify();
          }
        }
        else {
          return Login();
        }
      },
    );
  }

  Widget getWidgetForRole(String role) {
    switch (role) {
      case 'user':
        return UserDashboard(); // Replace with admin-specific widget
      case 'admin':
        // return WelcomeScreen(); // Replace with user-specific widget
      default:
        return const Center(child: Text('Unauthorized Role'));
    }
  }
}
