// ignore_for_file: prefer_const_constructors

import 'package:entertaiment_app/constants.dart';
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/home', routes: {
      '/login': (context) => const LoginScreen(),
      '/signup': (context) => const SignUpScreen(),
      '/home': (context) => const HomeScreen(),
    });
  }
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: kBgPrimary,
          body: Column(
            children: [
              const Icon(Icons.add_ic_call_sharp),
              const SizedBox(
                height: 58.0,
              ),
              Container(
                color: kBgSeconday,
                margin: EdgeInsets.symmetric(horizontal: 24.0),
                padding: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32.0,
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    const TextField(
                        decoration: InputDecoration(
                      hintText: 'Email address',
                      hintStyle: TextStyle(color: kSecondaryColor),
                    )),
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(color: kSecondaryColor),
                      ),
                    ),
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'Repeat password',
                        hintStyle: TextStyle(color: kSecondaryColor),
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    TextButton(
                      onPressed: () => {print('login')},
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(kPrimaryColor),
                      ),
                      child: const Text(
                        'Create an account',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account? ",
                          style: TextStyle(color: Colors.white),
                        ),
                        GestureDetector(
                          child: const Text(
                            "Login",
                            style: TextStyle(color: kPrimaryColor),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ));
                          },
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
