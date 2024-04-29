import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {

ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
String  username = '';
String address = '';

class _ProfileScreenState extends State<ProfileScreen> {
  final user = FirebaseAuth.instance.currentUser;

  void initState() {
    super.initState();
    _getUserDetails();
  }

  signout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.snackbar("Logged Out!", "");
    } catch (error) {
      Get.snackbar("Logout Error", error.toString());
    }
  }

  Future<void> _getUserDetails() async {
    final userID = user?.uid;

    if (userID != null) {
      final userRef = FirebaseDatabase.instance.ref('users/$userID/name');
      final addressRef = FirebaseDatabase.instance.ref('users/$userID/address');


      userRef.onValue.listen((DatabaseEvent event) {
        final data = event.snapshot.value;
        setState(() {
          username = data.toString();
        });
      });
      addressRef.onValue.listen((DatabaseEvent event) {
        final data = event.snapshot.value;
        setState(() {
          address = data.toString();
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),

        backgroundColor: Colors.deepPurple[600],

      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(width: 100,
                height: 100,
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),),
              const SizedBox(height: 10),
              Text('${username}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
              Text('${address}',style: TextStyle(),),

              const SizedBox(height: 10),

              const Divider(),
              const SizedBox(height: 10),
              ListTile(
                onTap: () async{
                  await signout();
                  Navigator.of(context).popUntil((route) => route.isFirst);

                },
                leading: Container(
                  width: 30, height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),

                  ),
                  child: const Icon(Icons.logout, color: Colors.black,),
                ),
                title: const Text('Logout',),
              ),


            ],
          ),


        ),
      ),
    );
  }
}
