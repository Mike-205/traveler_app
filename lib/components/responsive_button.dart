import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_blog/pages/login_page.dart';
import 'package:my_blog/widgets/app_text.dart';

import '../misc/colors.dart';


class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  var page;

  ResponsiveButton({super.key,
    this.width,
    this.isResponsive = false,
    this.page
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context){
              return page;
            }
          )
        );
      },
      child: Container(
        width: isResponsive == true ? MediaQuery.of(context).size.width * 0.7 : width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor
        ),
        child: Row(
          mainAxisAlignment: isResponsive == true? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
          children: [
            isResponsive == true? Container(margin: const EdgeInsets.only(left: 40), child: AppText(text: "Book Trip Now", color: Colors.white, fontweight: FontWeight.bold,)) : Container(),
            Image.asset('assets/button-one.png'),

          ],
        ),
      ),
    );
  }
}
