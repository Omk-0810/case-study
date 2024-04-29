
import 'package:case_study/authentication/logIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}
final firebaseApp = Firebase.app();
DatabaseReference databaseReference  =
FirebaseDatabase.instance.ref('users');
class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController name=TextEditingController();
  TextEditingController address=TextEditingController();



  Future <void>signup()async{
    try{
      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      // Get.offAll(Wrapper());
      final String userId = userCredential.user!.uid;
      final Map<String, dynamic> userDataMap = {
        "name": name.text,
        "email": email.text,
        "address": address.text,
        "id": userId,
        "role":"user",
      };
      await databaseReference.child(userId).set(userDataMap);
      SnackBar(content: Text('Accpunt created successfully!'));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Login()));
    }on FirebaseAuthException catch (e) {
      print(e.code);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message!)), // Display user-friendly error message
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent[700],

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
        
          child: Column(
            children: [
              SizedBox(child: Spacer(),height: 20,),
              Text('Create an Account',style: TextStyle(fontSize: 20,color: Colors.white),),
              SizedBox(height: 30,),

                  Container(
                         padding: EdgeInsets.all(15),
                         decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15)),
                   child: Form(
                     key: _formKey,
                     child: Column(
                       children: [
                         TextFormField(
                           controller: name,
                           decoration: InputDecoration(labelText: 'Name'),
                           validator: (value) {
                             if (value == null || value.isEmpty) {
                               return 'Please enter your name.';
                             }else if (value.split(' ').length < 2) {
                               return 'Please enter your name & surname';
                             }
                             return null;
                           },
                         ),
                         TextFormField(
                           controller: email,
                           decoration: InputDecoration(labelText: 'Email'),
                           validator: (value) {
                             if (value == null || value.isEmpty) {
                               return 'Please enter your email.';
                             }
                             return null;
                           },
                         ),
                         TextFormField(
                           controller: address,
                           decoration: InputDecoration(labelText: 'Address'),
                           validator: (value) {
                             if (value == null || value.isEmpty) {
                               return 'Please enter your address.';
                             }
                             return null;
                           },
                         ),
                         TextFormField(
                           controller: password,
                           obscureText: true,
                           decoration: InputDecoration(labelText: 'Password'),
                           validator: (value) {
                             if (value == null || value.isEmpty) {
                               return 'Please enter your password.';
                             }else if (value.length < 6) {
                               return 'Password must be at least 6 characters long.';
                             }
                             return null;
                           },
                         ),
                         SizedBox(height: 30),

                         ElevatedButton(onPressed: () {
                           if (_formKey.currentState!.validate()) {
                             signup();
                           }
                         }, child: const Text("SIGNUP",style: TextStyle(color: Colors.white),),

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

            ],
          ),
        ),
      ),
    );
  }
}
