import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_blog/pages/login_page.dart';
import 'package:my_blog/components/square%20tiles.dart';
import 'package:my_blog/widgets/account_pages_title.dart';

import '../components/text_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController =TextEditingController();

  // sign user up function
  void signUserUp() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    );

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text
      );
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'email-already-in-use') {
        return userAlreadyExist();
      }  else if (e.code == 'weak-password') {
        return weakPassword();
      }
    }
    Navigator.pop(context);
  }

  void userAlreadyExist() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('User already exist', style: TextStyle(color: Colors.purple),),
          content: const Text('The account already exists for that email.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            )
          ],
        );
      }
    );
  }

  void weakPassword() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Weak password', style: TextStyle(color: Colors.purple),),
          content: const Text('Password should be at least 6 characters'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            )
          ],
        );
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Image.asset('assets/sign_up_image3.jpg'),
              ),
        
              const AccountPagesTitle(text: 'Create Account'),
        
              const SizedBox(height: 10,),
        
              MyTextField(
                  controller: fullNameController,
                  hint: 'Full name',
                  label: 'Full name',
                  prefixIcon: const Icon(
                    Icons.account_circle,
                    size: 25,
                    color: Color(0xFF809fff),
                  ),
                  obscured: false,
                  isPassword: false
              ),
        
              const SizedBox(height: 20,),
        
              MyTextField(
                  controller: emailController,
                  hint: 'example@gmail.com',
                  label: 'Email',
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    size: 25,
                    color: Color(0xFF809fff),
                  ),
                  obscured: false,
                  isPassword: false
              ),
        
              const SizedBox(height: 20,),
        
              MyTextField(
                  controller: passwordController,
                  hint: 'Password',
                  label: 'Password',
                  prefixIcon: const Icon(
                    Icons.lock,
                    size: 25,
                    color: Color(0xFF809fff),
                  ),
                  isPassword: true
              ),
        
              const SizedBox(height: 30,),
        
              GestureDetector(
                onTap: signUserUp,
                child: Container(
                  padding: const EdgeInsets.all(25),
                  margin: const EdgeInsets.symmetric(horizontal: 25.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFF809fff),
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: const Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
        
              const SizedBox(height: 20,),
        
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.black87,
                      ),
                    ),
                    Text(' or continue with ', style: TextStyle(fontSize: 18)),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
        
              const SizedBox(height: 20,),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTiles(imagePath: 'assets/google.png', onTap:(){}),
        
                  const SizedBox(width: 15,),
        
                  SquareTiles(imagePath: 'assets/apple.png', onTap:(){},),
        
                  const SizedBox(width: 15,),
        
                  SquareTiles(imagePath: 'assets/facebook.png', onTap:(){},),
                ],
              ),
        
              const SizedBox(height: 15),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                    ),
                  ),
        
                  const SizedBox(width: 4,),
        
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const LoginPage();
                          }
                        )
                      );
                    },
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.blue
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
