//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_blog/components/text_field.dart';
import 'package:my_blog/pages/sign_up_page.dart';
import 'package:my_blog/components/square%20tiles.dart';
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

  void signUserIn(){}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //resizeToAvoidBottomInset : false,
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
              
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTiles(imagePath: 'assets/google.png'),
        
                  SizedBox(width: 15,),
        
                  SquareTiles(imagePath: 'assets/apple.png'),
        
                  SizedBox(width: 15,),
        
                  SquareTiles(imagePath: 'assets/facebook.png')
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
