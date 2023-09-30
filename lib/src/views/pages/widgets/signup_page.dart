import 'package:contacts_app/src/core/common_widget/app_button.dart';
import 'package:contacts_app/src/core/constants/strings.dart';
import 'package:contacts_app/src/core/helpers/validation_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

final GlobalKey<FormState> _formKey = GlobalKey();

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController unameController = TextEditingController();
  TextEditingController cnfrmpwdController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Name
                  TextFormField(
                    controller: unameController,
                    decoration:
                        const InputDecoration(label: Text(Strings.name)),
                    validator: ValidationHelpers.validateName),

                  // Email
                  TextFormField(
                      controller: emailController,
                      decoration:
                          const InputDecoration(label: Text(Strings.email)),
                      validator: ValidationHelpers.validateEmail),

                  //DOB
                  TextFormField(
                    controller: dobController,
                    decoration: const InputDecoration(label: Text(Strings.dob)),
                    // validator: ValidationHelpers.validateEmail
                  ),

                  //Phone
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: phoneController,
                    decoration: const InputDecoration(
                        label: Text(Strings.phone), prefix: Text('+91')),
                    maxLength: 10,
                  ),

                  //Password
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration:
                        const InputDecoration(label: Text(Strings.newpassword)),
                    validator: ValidationHelpers.isValidPassword,
                  ),

                  //Confirm Password
                  TextFormField(
                    controller: cnfrmpwdController,
                    obscureText: true,
                    decoration:
                        const InputDecoration(label: Text(Strings.confirmpwd)),
                    validator: (value) {
                      if (passwordController.text != value) {
                        return 'Password dosent match';
                      }
                    },
                  ),

                  //Submit Button
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: AppButton(
                      buttonTitle: Strings.signup,
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          String email = emailController.text;
                          String password = passwordController.text;
                        }
                      },
                    ),
                  )
                ],
              ))),
    );
  }

  
}
