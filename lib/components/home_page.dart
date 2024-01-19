import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_blog/widgets/app_large_text.dart';
import 'package:my_blog/widgets/app_text.dart';

import '../misc/colors.dart';
import '../widgets/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images_2 = {
    "balloon.png": "Balloning",
    "hiking.png" : "Hiking",
    "kayaking.png" : "Kayaking",
    "snorkeling.png" : "Snorking"
  };
  List images = [
    'mount_stanley.png',
    'mount_kenya.png',
    'mountain_elgon.png',
    'mount_kilimanjaro.png',
    'mount-Karisimbi.png',
    'atlas_mountains.png',
    'mount_cameroon.png',
    'Rwenzori.png',
    'usambara_mountains.png',
    'mount_meru.png',
  ];

  Map locations = {
    "Mt.Stanley" : "Luolo, DRC",
    "Mt.Kenya" : "Kirinyaga, Kenya",
    "Mt.Elgon" : "Kakamega, Kenya",
    "Mt.Kilimanjaro" : "Moshi, Tanzania",
    "Mt.Karisimbi": "Goma, Rwanda",
    "Atlas": "Ifergane, Morocco",
    "Mt.Cameroon" : "Buea, Cameroon",
    "Rwenzori": "Kalonge, Uganda",
    "Usambara" : "Tanga, Tanzania",
    "Mt.Meru": "Arusha, Tanzania"
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController =TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(
            padding: const EdgeInsets.only(top: 70, left: 20),
            child: Row(
              children: [
                const Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.black,
                ),
                Expanded(child: Container()),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    //color: Colors.grey.withOpacity(.5),
                    image: const DecorationImage(
                      image: AssetImage("assets/profile.jpg"),
                      fit: BoxFit.scaleDown
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30,),

          Container(
            margin: const EdgeInsets.only(left: 20),
            child: AppLargeText(text: 'Discover'),
          ),

          const SizedBox(height: 20,),

          Container(
            child: Align(
              child: TabBar(
                dividerColor: Colors.transparent,
                labelPadding: const EdgeInsets.only(left: 0, right: 20),
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: const [
                  Tab(child: Text('Places', style: TextStyle(fontSize: 16))),
                  Tab(child: Text('Inspiration', style: TextStyle(fontSize: 16))),
                  Tab(child: Text('Emotion', style: TextStyle(fontSize: 16))),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController ,
              children: [
                ListView.builder(
                  itemCount: images.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context){
                              return DetailPage(imgIndex: index);
                            }
                          )
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 10, right: 15),
                        height: 300,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage('assets/'+ images[index]),
                                fit: BoxFit.cover
                            ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              padding: const EdgeInsets.only(top: 210),
                              child: Text(
                                locations.keys.elementAt(index),
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                )
                              )
                            ),
                            const SizedBox(height: 5),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: const Icon(
                                    Icons.location_on,
                                    size: 25,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 5,),
                                Container(
                                  child: Text(
                                    locations.values.elementAt(index),
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white
                                    )
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const Text('There'),
                const Text('Bye')
                ]
            ),
          ),
          const SizedBox(height: 30,),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                AppLargeText(text: "Explore more", size: 22,),
                Expanded(child: Container()),
                AppText(text: 'See all', color: AppColors.textColor1,),
              ],
            ),
          ),
          const SizedBox(height: 30,),
          Container(
            height: 120,
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 20),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (_, index){
                return Column(
                  children: [
                    Container(
                      //margin: EdgeInsets.only(right: 50),
                      margin: const EdgeInsets.only(right: 40),
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage('assets/'+ images_2.keys.elementAt(index)),
                        fit: BoxFit.cover
                        )
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 40),
                      child: Padding(padding: const EdgeInsets.only(left:5), child: AppText(text: images_2.values.elementAt(index), color: AppColors.textColor2,))
                    )
                  ],
                );
              }
          ),
          )
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    throw UnimplementedError();
  }
}

class _CiclePainter extends BoxPainter{
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // TODO: implement paint
  }

}