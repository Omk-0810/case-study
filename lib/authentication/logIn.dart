import 'dart:ui';
import 'package:case_study/authentication/signUp.dart';
import 'package:case_study/dashboard/userDashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'forget_password.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isloading = false;

  signIn() async {
    setState(() {
      isloading = true;
    });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      Get.to(const UserDashboard());
    } on FirebaseAuthException catch (e) {
      Get.snackbar("error msg", e.code);
    } catch (e) {
      Get.snackbar("error msg", e.toString());
    }

    setState(() {
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) => isloading
      ? const Center(
          child: CircularProgressIndicator(),
        )
      : Scaffold(
          backgroundColor: Colors.deepPurpleAccent[700],

          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                      top: 50, left: 20, right: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Back!',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Log into your account',
                        style: TextStyle(color: Colors.white),
                      ),

                    ],
                  ),
                ),
                Stack(
                  children:[
                    Column(
                      children: [
                        const SizedBox(
                        height: 100,
                      ),
                        Container(
                          height: 550,
                          decoration: BoxDecoration(
                              color: Colors.grey[350],
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(14),
                                  topLeft: Radius.circular(14))),
                        ),
                      ],),

                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 80,left: 20,right: 20),
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            height: 300,
                            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                            child: Form(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextFormField(
                                    controller: email,
                                    decoration: const InputDecoration(
                                      hintText:'Enter the Email ID' ,),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your email';
                                      }
                                      return null;
                                    },
                                  ),

                                  TextField(
                                    controller: password,
                                    obscureText: true,
                                    decoration: const InputDecoration(hintText:'Password' ),
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(width: 150,),
                                      TextButton(onPressed: (()=>Get.to(const ForgotPass())),
                                      child: const Text("Forget Password?",style: TextStyle(color: Colors.deepPurple),)),

                                    ],
                                  ),
                                  const SizedBox(height: 15,),

                                  ElevatedButton(onPressed: (()=>signIn()), child: const Text("LOGIN",style: TextStyle(color: Colors.white),),

                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xffff7043),
                                      fixedSize: const Size(1000, 15),
                                      shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0.0),
                                  ),elevation: 5,),),


                                ],


                              ),
                            ),

                          ),

                        ),
                        Row(

                          children: [
                            const Spacer(),
                            const Text("Don't have an account?"),
                            TextButton(onPressed: (()=>Get.to(const Signup())),
                                child: const Text("Sign up",style: TextStyle(color: Colors.deepPurple),)),
                            const Spacer(),
                          ],
                        ),
                      ],
                    ),


    ]
                ),


              ],
            ),
          ),

        );
}
