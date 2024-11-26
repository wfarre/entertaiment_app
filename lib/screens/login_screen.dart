import 'package:entertaiment_app/main.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                margin: const EdgeInsets.symmetric(horizontal: 24.0),
                padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Login',
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
                    const SizedBox(
                      height: 40.0,
                    ),
                    TextButton(
                      onPressed: () => {print('login')},
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(kPrimaryColor),
                      ),
                      child: const Text(
                        'Login to your account',
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
                          "Don't have an account? ",
                          style: TextStyle(color: Colors.white),
                        ),
                        GestureDetector(
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(color: kPrimaryColor),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
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
