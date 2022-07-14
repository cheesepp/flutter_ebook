import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final userNameController = TextEditingController();
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _emailField(),
            const SizedBox(
              height: 20,
            ),
            _passwordField(),
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
                  key: Key("username"),
                  controller: userNameController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.account_circle_sharp),
                      border: InputBorder.none,
                      labelText: 'User name'),
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
                  key: Key("phone"),
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      border: InputBorder.none,
                      labelText: 'Phone'),
                  style: TextStyle(height: 0.5)),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                child: const Text('Sign up',
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
          ],
        ),
      ),
    );
  }

  Container _passwordField() {
    return Container(
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
                icon: Icon(
                    showPassword ? Icons.visibility_off : Icons.visibility),
              ),
              border: InputBorder.none,
              labelText: 'Password'),
          style: TextStyle(height: 0.5)),
    );
  }

  Container _emailField() {
    return Container(
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
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
