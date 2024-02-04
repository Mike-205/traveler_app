import 'package:flutter/material.dart';
import 'package:my_blog/pages/main_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
                            color:Colors.lightBlueAccent.withOpacity(0.4),
                            blurRadius: 10,
                            offset: const Offset(4, 10),
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
                        padding: const EdgeInsets.only(right: 40),
                        child: const Text(
                          'Joined',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                      const Text(
                        '1 year ago',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700
                        ),
                      )
                    ]
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
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                      ]
                    ),
                  ),
                ]
              )
            ],
          ),
        ),
      ),
    );
  }
}
