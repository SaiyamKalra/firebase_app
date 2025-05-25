import 'package:firebase_app/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  void signUserUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
    try {
      if (password.text == confirmPassword.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: username.text.trim(),
          password: password.text.trim(),
        );
      } else {
        showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: Text("Different Passwords"),
                content: Text("Different Password and Confirmed Password"),
              ),
        );
      }
      Navigator.pop(context);
    } catch (e) {
      Navigator.pop(context);
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: Text('Register Failed'),
              content: Text(e.toString()),
            ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 100),
                Center(child: Icon(Icons.lock, size: 150)),
                SizedBox(height: 50),
                Text(
                  'Welcome back you \'ve been missed!',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextField(
                    controller: username,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'UserName',
                      focusColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextField(
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Password',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextField(
                    controller: confirmPassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Confirm Password',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {
                    signUserUp();
                  },
                  child: Text('Sign Up'),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(thickness: 0.5, color: Colors.grey[400]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(thickness: 0.5, color: Colors.grey[400]),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50.0,
                    vertical: 10.0,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => AuthService().signInWithGoogle(),
                        child: Image.asset(
                          "assets/images/Google.png",
                          height: 150,
                          width: 150,
                        ),
                      ),
                      SizedBox(width: 40),
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          "assets/images/R.png",
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80.0),
                  child: Row(
                    children: [
                      Text('Already have an Account?'),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          if (widget.onTap != null) {
                            widget.onTap;
                          }
                        },
                        child: Text(
                          'Login Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
