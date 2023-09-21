import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
              child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(label: Text('Email:')),
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(label: Text('Password:')),
          ),
          ElevatedButton(onPressed: () {}, child: Text('Login'))
          // TextFormField(
          //   decoration: InputDecoration(label: Text('Email')),
          // )
        ],
      ))),
    );
  }
}
