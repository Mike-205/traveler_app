import 'package:flutter/material.dart';
import 'package:my_blog/pages/main_page.dart';
import 'package:my_blog/pages/sign_up_page.dart';
import 'package:my_blog/pages/welcome_page.dart';
import 'package:my_blog/widgets/detail_page.dart';
import 'package:my_blog/widgets/new_detail_page.dart';
import 'components/home_page.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
