import 'package:contacts_app/src/core/common_widget/app_button.dart';
import 'package:contacts_app/src/core/constants/strings.dart';
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
              child: Padding(
        padding: const EdgeInsets.only(top: 250, left: 20, right: 20),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(label: Text(Strings.email)),
              validator:(value) {
                
              },
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(label: Text(Strings.password)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: AppButton(
                buttonTitle: Strings.login,
                onPressed: () {},
              ),
            )
            // TextFormField(
            //   decoration: InputDecoration(label: Text('Email')),
            // )
          ],
        ),
      ))),
    );
  }
}