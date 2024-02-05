import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_blog/components/icons.dart';
import 'package:my_blog/pages/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../pages/login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  void signUserOut() async{
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const MainPage();
                          }
                        ));
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 25,
                        color: Colors.black,
                      )
                    ),

                    Expanded(child: Container()),

                    IconButton(
                      onPressed: (){},
                      icon: const Icon(
                        Icons.more_vert_outlined,
                        size: 30,
                        color: Colors.black,
                      )
                    )
                  ]
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        height: 140,
                        width: 140,
                        decoration: BoxDecoration(
                          //color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(90),
                          boxShadow: [
                            BoxShadow(
                              color:Colors.blue.withOpacity(0.2),
                              blurRadius: 4,
                              offset: const Offset(4, 8),
                            )
                          ],
                          image: const DecorationImage(
                            image: AssetImage("assets/27df110f-b9d9-4f00-83b1-f9cf4e3b8d19.jpg"),
                            fit: BoxFit.cover
                          )
                        ),
                        ),
                    ),

                    const SizedBox(width: 40),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 20,
                          padding: const EdgeInsets.only(right: 30),
                          child: const Text(
                            'Joined',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              //fontWeight: FontWeight.bold
                            ),
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.only(right: 30),
                          child: const Text(
                            '1 month ago',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),

                const SizedBox(height: 20,),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 32,
                            padding: const EdgeInsets.only(right: 40),
                            child: const Text(
                            'Mike',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          ),

                        Container(
                          padding: const EdgeInsets.only(right: 40),
                          child: const Text(
                            'Mwongela',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 30,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        )
                        ]
                      ),
                    ),
                  ]
                ),

                const SizedBox(height: 30,),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: const Text(
                          'Profile',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          )
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10,),

                Padding(padding: const EdgeInsets.only(left: 30, right: 20), child: ProfileIcons(icon: Icons.album_outlined, backgroundColor: Colors.deepOrange.withOpacity(.1), color: Colors.deepOrange.withOpacity(.7), text: 'Manage User')),

                const SizedBox(height: 30,),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: const Text(
                          'Settings',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          )
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10,),

                Padding(padding: const EdgeInsets.only(left: 30, right: 20), child: ProfileIcons(icon: Icons.notifications_none_outlined, backgroundColor: Colors.indigo.withOpacity(.1), color: Colors.indigo.withOpacity(.8), text: 'Notifications')),

                const SizedBox(height: 20,),

                Padding(padding: const EdgeInsets.only(left: 30, right: 20), child: ProfileIcons(icon: Icons.nights_stay_sharp, backgroundColor: Colors.blue.withOpacity(.1), color: Colors.blue.withOpacity(.7), text: "Dark Mode")),

                const SizedBox(height: 30,),

                Row(
                  children: [
                    GestureDetector(
                      onTap: signUserOut,
                      child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          margin: const EdgeInsets.only(left: 20),
                          height: 50,
                          width: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[200],
                          ),

                          child: InkWell(
                            onTap: signUserOut,
                            child: Text(
                              'Sign Out',
                              style: TextStyle(
                                  color: Colors.indigo.withOpacity(.7),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
