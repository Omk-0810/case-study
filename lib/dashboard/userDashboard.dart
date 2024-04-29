import 'package:case_study/chatBot/chatbot.dart';
import 'package:case_study/profile/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashoboardState();
}


String username = '';


signout() async {
  try {
    await FirebaseAuth.instance.signOut();
    Get.snackbar("Logged Out!", "");
  } catch (error) {
    Get.snackbar("Logout Error", error.toString());
  }
}


class _UserDashoboardState extends State<UserDashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final user = FirebaseAuth.instance.currentUser;

  int _selectedIndex = 0;
  void initState() {
    super.initState();
    _getUsername();
  }

  Future<void> _getUsername() async {
    final userID = user?.uid;

    if (userID != null) {
      final userRef = FirebaseDatabase.instance.ref('users/$userID/name');

      userRef.onValue.listen((DatabaseEvent event) {
        final data = event.snapshot.value;
        setState(() {
          username = data.toString();
          print(username);
        });
      });
    }
  }

  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (_selectedIndex) {
        case 0:
          break;

        case 1:
         // Get.to();
          break;

        case 2:
        // Get.to();
          break;
        case 3:
        // Get.to();
          break;
        case 4:
        // Get.to();
          break;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent[700],
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent[700],
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
        ),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.deepPurpleAccent[700]),
            child: Row(
              children: [
                IconButton(
                  color: Colors.white,
                  onPressed: () {
                    Get.to(ProfileScreen());
                  },
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                    fill: 0.8,
                  ),
                ),
                IconButton(
                  color: Colors.blue,
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.white,
                    fill: 0.8,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text('Hello',
                        style: TextStyle(color: Colors.white, fontSize: 18),),
                      Text('${username}', style: TextStyle(fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),)
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child:

              Stack(
                  children:
                  [
                  Container(
                  padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Quick Actions', style: TextStyle(fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple[600]),),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              // Handle button tap
                              Get.back();
                            },
                            child: Image.asset(
                              'assets/images/bills.jpg',
                              width: 40,
                              height: 40,

                              fit: BoxFit.cover,
                            ),
                          ),
                          Text('Bills', style: TextStyle(fontSize: 12),),
                          SizedBox(height: 30,),
                          InkWell(
                            onTap: () {
                              // Handle button tap
                              Get.back();
                            },
                            child: Image.asset(

                              'assets/images/complaint.png',
                              width: 40,
                              height: 40,

                              fit: BoxFit.cover,
                            ),
                          ),
                          Text('Complaint', style: TextStyle(fontSize: 12),),


                        ],

                      ),
                      SizedBox(width: 18,),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              // Handle button tap
                              Get.back();
                            },
                            child: Image.asset(
                              'assets/images/disconnect.jpg',
                              width: 40,
                              height: 40,

                              fit: BoxFit.cover,
                            ),
                          ),
                          Text('Disconnect', style: TextStyle(fontSize: 12),),
                          SizedBox(height: 30,),
                          InkWell(
                            onTap: () {
                              // Handle button tap
                              Get.back();
                            },
                            child: Image.asset(

                              'assets/images/edit.png',
                              width: 40,
                              height: 40,

                              fit: BoxFit.cover,
                            ),
                          ),
                          Text('Update', style: TextStyle(fontSize: 12),),

                        ],
                      ),
                      SizedBox(width: 18,),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              // Handle button tap
                              Get.back();
                            },
                            child: Image.asset(
                              'assets/images/transfer.png',
                              width: 40,
                              height: 40,

                              fit: BoxFit.cover,
                            ),
                          ),
                          Text('Transfer', style: TextStyle(fontSize: 12),),
                          SizedBox(height: 30,),
                          InkWell(
                            onTap: () {
                              // Handle button tap
                              Get.back();
                            },
                            child: Image.asset(

                              'assets/images/edit.png',
                              width: 40,
                              height: 40,

                              fit: BoxFit.cover,
                            ),
                          ),
                          Text('Connection', style: TextStyle(fontSize: 12),),

                        ],
                      ),
                      SizedBox(width: 18,),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              // Handle button tap
                              Get.back();
                            },
                            child: Image.asset(
                              'assets/images/sevices.png',
                              width: 40,
                              height: 40,

                              fit: BoxFit.cover,
                            ),
                          ),
                          Text('Services', style: TextStyle(fontSize: 12),),
                          SizedBox(height: 30,),
                          InkWell(
                            onTap: () {
                              // Handle button tap
                              Get.back();
                            },
                            child: Image.asset(

                              'assets/images/edit.png',
                              width: 40,
                              height: 40,

                              fit: BoxFit.cover,
                            ),
                          ),
                          Text('outage', style: TextStyle(fontSize: 12),),


                        ],
                      ),


                    ],

                  ),
                  SizedBox(height: 30,),
                  Container(height: 10,color: Colors.grey[300]),
                  SizedBox(height: 20,),
                  Row(
                      children: [
                        Text('Gas |',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                        Text(' SA1234567',style: TextStyle(color: Colors.deepPurple[700],fontWeight: FontWeight.bold),)

                      ]
                  ),
                  SizedBox(height: 20,),

                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade100),

                    ),
                    child: ListTile(
                      leading: Icon(Icons.circle_outlined),
                      title: Text('Bills'),
                      subtitle: Text('20 Jan 2020'),
                      trailing: Text(r'43$',style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 20),),
                    ),
                  )



                ],
              ),
            )

          ]),

    ),
          ],
    ),
    bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
    items: const [
    BottomNavigationBarItem(icon: Icon(Icons.speed) ,label: "Dashboard"),
    BottomNavigationBarItem(icon: Icon(Icons.data_usage), label: "Usage"),
    BottomNavigationBarItem(icon: Icon(Icons.history) ,label: "History"),
    BottomNavigationBarItem(icon: Icon(Icons.support_agent) ,label: "Support"),


    ],
    currentIndex: _selectedIndex,
    selectedItemColor: Colors.amber[800],
    unselectedItemColor: Colors.grey,
    unselectedLabelStyle:TextStyle(color: Colors.grey),
    onTap: _onTapped,
    ),

    floatingActionButton: FloatingActionButton(
      onPressed: () {
        Get.to(ChatBot());
      },
      child: Column(
        children: [
          Spacer(),
          Icon(Icons.chat_bubble_outline,color: Colors.white,),
          Text('Chat Bot',style: TextStyle(color: Colors.white,fontSize: 10),),
          Spacer(),
        ],
      ),
      backgroundColor: Colors.deepPurple[600], // Logout button color (optional)
    ),
    );
  }
}
