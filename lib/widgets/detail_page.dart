import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_blog/components/responsive_button.dart';
import 'package:my_blog/misc/colors.dart';
import 'package:my_blog/widgets/app_buttons.dart';
import 'package:my_blog/widgets/app_large_text.dart';
import 'package:my_blog/widgets/app_text.dart';

class DetailPage extends StatefulWidget {
  final int imgIndex;
  const DetailPage({this.imgIndex = 0, super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gotten_stars =3;

  int selected_index = -1;

  bool icon_clicked = false;

  Map images = {
    'mount_stanley.png': "400",
    'mount_kenya.png': "150",
    'mountain_elgon.png': "200",
    'mount_kilimanjaro.png': "350",
    'mount-Karisimbi.png': "400",
    'atlas_mountains.png': "600",
    'mount_cameroon.png': "500",
    'Rwenzori.png': "300",
    'usambara_mountains.png': "250",
    'mount_meru.png': "300"
  };
  Map details ={
    "Mt.Stanley" : "Republic of Congo, Luolo",
    "Mt.Kenya": "Kenya, Kirinyaga",
    "Mt.Elgon": "Kenya, Kakamega",
    "Kilimanjaro": "Tanzania, Moshi",
    "Mt.Karisimbi": "Rwanda, Goma",
    "Atlas": "Morocco, Ifergane",
    "Mt.Cameroon": "Cameroon, Buea",
    "Rwenzori":"Uganda, Kalonge",
    "Usambara": "Tanzania, Tanga",
    "Mt.Meru": "Tanzania, Arusha"
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/" + images.keys.elementAt(widget.imgIndex)// image required
                        ),
                        fit: BoxFit.cover
                    )
                ),
              ),
            ),
            Positioned(
                left: 20,
                top: 50,
                right: 20,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.menu),
                        color: Colors.white,
                        iconSize: 30
                    ),
                    Expanded(child: Container()),

                    IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.more_vert_outlined),
                        color: Colors.white,
                        iconSize: 30
                    )
                  ],
                )
            ),
            Positioned(
              top: 290,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(text: details.keys.elementAt(widget.imgIndex), color: Colors.black.withOpacity(.8), size: 32,),  //text is required
                          AppLargeText(text: "\$ "+ images.values.elementAt(widget.imgIndex), color: Colors.purple.shade200, size: 32,), //Amount required

                        ],
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        children: [
                          const Icon(Icons.location_on, color: AppColors.mainColor,),
                          const SizedBox(width: 5,),
                          AppText(text: details.values.elementAt(widget.imgIndex), color: AppColors.mainColor,), //location required
                        ],
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        children: [
                          Wrap(
                              children:
                              List.generate(5, (index){
                                return Icon(Icons.star, color: index < gotten_stars? AppColors.starColor : AppColors.textColor2, size: 30); //random number generation
                              })
                          ),
                          const SizedBox(width: 5,),
                          AppText(text: "(3.0)", color: AppColors.textColor2, size: 20,),  //convert a float to string
                        ],
                      ),
                      const SizedBox(height: 20,),
                      AppLargeText(text: "People", color: Colors.black.withOpacity(.8), size: 24,),
                      //const SizedBox(height: 5,),
                      AppText(text: "Number of people in your group", color: AppColors.mainColor,),
                      const SizedBox(height: 10,),
                      Wrap(
                        children: List.generate(5, (index){
                          return InkWell(
                            onTap: (){
                              setState(() {
                                selected_index = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: AppButtons(
                                size: 50,
                                color: selected_index == index? Colors.white : Colors.black,
                                backgroundColor: selected_index == index? Colors.black : AppColors.buttonBackground,
                                borderColor: selected_index == index? Colors.black : AppColors.buttonBackground,
                                text: (index + 1).toString(),
                                //icon: Icons.favorite_border,
                                //isIcon: true,
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 10,),
                      AppLargeText(text: "Description", color: Colors.black.withOpacity(.8), size: 24,),
                      AppText(text: "You must travel to such a place where you can get rid of all pressure from your life. The place is full of natural beauty where you can enjoy your time with your family or friends.", color: AppColors.textColor2, size: 16,),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 5,
              left: 20,
              right: 20,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10,),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          icon_clicked = !icon_clicked;

                        });
                      },
                      child: AppButtons(
                        size: 60,
                        color: icon_clicked == true? Colors.red : AppColors.textColor1,
                        backgroundColor: Colors.white,
                        borderColor: AppColors.textColor2,
                        icon: icon_clicked == true? Icons.favorite :  Icons.favorite_border,
                        isIcon: true,
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10,),
                    child: ResponsiveButton(
                      isResponsive: true,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
