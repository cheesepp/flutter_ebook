import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key, required this.onClicked}) : super(key: key);
  VoidCallback onClicked;

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                child: const Text('Sign in!',
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
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text.rich(
                  TextSpan(children: [
                    const TextSpan(text: 'Do not have an account? '),
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = widget.onClicked,
                        text: 'Sign up!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black)),
                  ]),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 3,
              endIndent: 100,
              indent: 100,
              color: Colors.black12,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: ImageIcon(
                    AssetImage('assets/images/twitter.png'),
                    color: Colors.blue,
                  ),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {},
                  icon: ImageIcon(
                    AssetImage('assets/images/google.png'),
                    color: Colors.red,
                  ),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {},
                  icon: ImageIcon(
                    AssetImage('assets/images/facebook.png'),
                    size: 28,
                    color: Color(0xff3b5998),
                  ),
                  color: Colors.white,
                ),
              ],
            )
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
