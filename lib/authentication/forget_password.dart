import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logIn.dart';
class ForgotPass extends StatefulWidget {
  const ForgotPass({super.key});

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  forgetPass()async{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
    Get.to(const Login());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Spacer(),

            const SizedBox(
              height: 20,
              child: Spacer(),
            ),

            const Text('Enter an email ,you will receive the link to your      email id to reset the password.'),
            const SizedBox(child: Spacer(),height: 20,),
            TextField(
              controller: email,
              decoration: const InputDecoration(hintText:'Enter email' ),
            ),
            const SizedBox(child: const Spacer(),height: 20,),
            ElevatedButton(onPressed: (()=>forgetPass()), child: const Text("send link")),
            const Spacer(),

          ],
        ),
      ),


    );
  }
}