import 'package:contacts_app/src/core/common_widget/app_button.dart';
import 'package:contacts_app/src/core/constants/strings.dart';
import 'package:contacts_app/src/core/helpers/validation_helper.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatefulWidget {
  SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

final GlobalKey<FormState> _formKey = GlobalKey();

class _SigninPageState extends State<SigninPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController unameController = TextEditingController();
  TextEditingController cnfrmpwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                      controller: unameController,
                      decoration:
                          const InputDecoration(label: Text(Strings.uname)),
                      validator: ValidationHelpers.validateEmail),
                  TextFormField(
                      controller: emailController,
                      decoration:
                          const InputDecoration(label: Text(Strings.email)),
                      validator: ValidationHelpers.validateEmail),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration:
                        const InputDecoration(label: Text(Strings.newpassword)),
                    validator: ValidationHelpers.isValidPassword,
                  ),
                  TextFormField(
                      controller: cnfrmpwdController,
                      decoration:
                          const InputDecoration(label: Text(Strings.confirmpwd)),
                      validator: ValidationHelpers.validateEmail),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: AppButton(
                      buttonTitle: Strings.login,
                      onPressed: () {
                        // if (_formKey.currentState?.validate() ?? false) {
                        //   // String email = emailController.text;
                        //   // String password = passwordController.text;
                        // }
                      },
                    ),
                  )
                  // TextFormField(
                  //   decoration: InputDecoration(label: Text('Email')),
                  // )
                ],
              ))),
    );
  }
}
