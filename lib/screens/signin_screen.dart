import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Lottie.asset(
                  "assets/lotties/auth.json",
                  height: size.height * 0.30,
                ),
              ),
              Container(
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(224, 79, 76, 76).withOpacity(0.3)),
                child: TextField(
                    key: const Key("signInEmail"),
                    controller: emailController,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        border: InputBorder.none,
                        labelText: 'Email'),
                    style: TextStyle(height: 0.5)),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(224, 79, 76, 76).withOpacity(0.3)),
                child: TextField(
                    key: const Key("signInPassword"),
                    controller: passwordController,
                    obscureText: showPassword,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                          icon: Icon(showPassword
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                        border: InputBorder.none,
                        labelText: 'Password'),
                    style: TextStyle(height: 0.5)),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  child: const Text('Sign in',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      primary: Colors.black,
                      onPrimary: Colors.white,
                      fixedSize: const Size(200,
                          60)), //El ancho de deja en 0 porque el "expanded" lo define.
                  onPressed: () {},
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    // ignore: prefer_const_constructors
                    icon: Icon(
                      Icons.home,
                    ),
                    onPressed: () {},
                  ),
                  Text.rich(
                    TextSpan(children: [
                      const TextSpan(text: 'Do not have an account? '),
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('Login Text Clicked');
                            },
                          text: 'Sign up!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
