import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_blog/components/home_page.dart';
import 'package:my_blog/misc/colors.dart';
import 'package:my_blog/pages/login_page.dart';
import 'package:my_blog/widgets/app_large_text.dart';
import 'package:my_blog/widgets/app_text.dart';
import 'package:my_blog/components/responsive_button.dart';

import 'main_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images =[
    'welcome-one.png',
    '6221846.png',
    'adventurer-walking-scene_18591-72589.png'
  ];

  List text = [
    'Mountain hikes give you an incredible sense of freedom along with endurance test.',
    'Mount Everest has the highest elevation above the sea level which is why it is called the highest point on Earth. The official height of Everest is 8,848 meters (29,028 feet).',
    'The tallest mountain measured from top to bottom is Mauna Kea, an inactive volcano on the island of Hawaii in the Pacific Ocean. Measured from the base,it stands 33,474 feet (10,203 meters) tall'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (_, index){
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/"+images[index]
                ),
                fit: BoxFit.cover
              )
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 120, left: 20, right: 20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLargeText(text: 'Trips'),
                      AppText(text: 'Mountain', size: 30,),

                      const SizedBox(height: 20,),

                      Container(
                        width: MediaQuery.of(context).size.width - 120,
                        child: AppText(
                          text: text[index],
                          //color:AppColors.textColor1,
                        ),
                      ),

                      const SizedBox(height: 30,),

                      ResponsiveButton(width: 120, page: const MainPage(),),
                    ],
                  ),

                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(3, (indexDots){
                          return Container(
                            margin: const EdgeInsets.only(left: 2),
                            width: 20,
                            height: index == indexDots? 12:8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: index == indexDots? AppColors.mainColor : AppColors.mainColor.withOpacity(.3)
                            ),
                          );
                        }),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    ) ;
  }
}
