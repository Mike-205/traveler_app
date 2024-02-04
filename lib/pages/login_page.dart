//import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_blog/components/home_page.dart';
import 'package:my_blog/components/text_field.dart';
import 'package:my_blog/pages/sign_up_page.dart';
import 'package:my_blog/components/square%20tiles.dart';
import 'package:my_blog/services/auth_service.dart';
import 'package:my_blog/widgets/account_pages_title.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  // sign user in function

  void signUserIn() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text
      );
      Navigator.pop(context);
      //return loginSuccess();
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (kDebugMode) {
        print(e.code);
      }
      if (e.code == 'invalid-email') {
        return wrongUserEmail();
      } else if (e.code == 'invalid-credential') {
        return wrongUserCredential();
      } else if (e.code == 'too-many-requests') {
        return userDisabled();
      }else {
        return errorMessage();
      }
    }
  }
  void loginSuccess() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Login Success!', style: TextStyle(color: Colors.green),),
          content: const Text('successfully logged in'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK', style: TextStyle(color: Color(0xFF809fff))),
            )
          ],
        );
      }
    );
  }

  void wrongUserEmail() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Invalid Email', style: TextStyle(color: Colors.red),),
            content: const Text('Please enter a valid email'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK', style: TextStyle(color: Color(0xFF809fff)))
              )
            ],
          );
        }
    );
  }

  void wrongUserCredential() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Login failed', style: TextStyle(color: Colors.red),),
            content: const Text('The username or password you have entered is incorrect', ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK', style: TextStyle(color: Color(0xFF809fff))),
              )
            ],
          );
        }
    );
  }

  void errorMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Login Error', style: TextStyle(color: Colors.red),),
            content: const Text('No internet connection', ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK', style: TextStyle(color: Color(0xFF809fff))),
              )
            ],
          );
        }
    );
  }

  void userDisabled() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Oops!', style: TextStyle(color: Colors.red),),
            content: const Text('Your account has been temporarily disabled due to many failed login attempt. Please try again later', ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK', style: TextStyle(color: Color(0xFF809fff))),
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
      resizeToAvoidBottomInset : false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Image.asset('assets/login_image_first.jpg'),
              ),
        
              const SizedBox(height: 5,),
        
              const AccountPagesTitle(text: 'Login'),
        
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
                  isPassword: false,
                  obscured: false,
              ),
        
              const SizedBox(height: 30,),
        
              MyTextField(
                  controller: passwordController,
                  hint: 'Password',
                  label: 'Password',
                  prefixIcon: const Icon(
                    Icons.lock,
                    size: 25,
                    color: Color(0xFF809fff),
                  ),
                  isPassword: true,
              ),
        
              const SizedBox(height: 10,),
        
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'forgot password?',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 15
                      ),
                    ),
                  ],
                ),
              ),
        
              const SizedBox(height: 30,),
        
              GestureDetector(
                onTap: signUserIn,
                child: Container(
                  padding: const EdgeInsets.all(25),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    color: const Color(0xFF809fff),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
        
              const SizedBox(height: 30,),
        
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
        
              const SizedBox(height: 30,),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTiles(imagePath: 'assets/google.png', onTap: () async { await AuthService().signInWithGoogle();}),
        
                  const SizedBox(width: 15,),
        
                  SquareTiles(imagePath: 'assets/apple.png', onTap:(){}),
        
                  const SizedBox(width: 15,),
        
                  SquareTiles(imagePath: 'assets/facebook.png', onTap:() async { await AuthService().signInWithFacebook();}),
                ],
              ),
        
              const SizedBox(height: 20,),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.black
                    ),
                  ),
        
                  const SizedBox(width: 4,),
        
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const SignUpPage();
                          }
                        )
                      );
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}
