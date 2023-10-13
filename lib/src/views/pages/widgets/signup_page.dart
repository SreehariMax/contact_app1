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
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Name
                    TextFormField(
                        keyboardType: TextInputType.name,
                        controller: unameController,
                        decoration:
                            const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text(Strings.name)),
                        validator: ValidationHelpers.validateName),

                        SizedBox(
                      height: 20,
                    ),
              
                    // Email
                    TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration:
                            const InputDecoration( border: OutlineInputBorder(),
                              label: Text(Strings.email)),
                        validator: ValidationHelpers.validateEmail),

                        SizedBox(
                      height: 20,
                    ),
              
                    //DOB
                    TextFormField(
                      keyboardType: TextInputType.datetime,
                      controller: dobController,
                      validator: ValidationHelpers.checkISNullOrEmpty,
                      decoration: const InputDecoration(border: OutlineInputBorder(), label: Text(Strings.dob)),
                      onTap: () async {
                        DateTime? selectedDate = await showDatePicker(
                            context: context,
                            firstDate: DateTime(1950),
                            initialDate: DateTime.now()
                                .subtract(const Duration(days: 18 * 365)),
                            lastDate: DateTime.now()
                                .subtract(const Duration(days: 365 * 5)));
                        if (selectedDate == null) {
                          selectedDate = DateTime.now()
                              .subtract(const Duration(days: 365 * 18));
                        }
                        dobController.text = selectedDate.toString().substring(0,10);
                      },
                      // validator: ValidationHelpers.validateEmail
                    ),

                    SizedBox(
                      height: 20,
                    ),
              
                    //Phone
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      controller: phoneController,
                      decoration: const InputDecoration(border: OutlineInputBorder(), 
                          label: Text(Strings.phone), prefix: Text('+91')),
                      validator: ValidationHelpers.validatePhone,
                    ),

                    SizedBox(
                      height: 20,
                    ),
              
                    //Password
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration:
                          const InputDecoration(border: OutlineInputBorder(), label: Text(Strings.newpassword)),
                      validator: ValidationHelpers.isValidPassword,
                    ),

                    SizedBox(
                      height: 20,
                    ),
              
                    //Confirm Password
                    TextFormField(
                      controller: cnfrmpwdController,
                      obscureText: true,
                      decoration:
                          const InputDecoration(border: OutlineInputBorder(), label: Text(Strings.confirmpwd)),
                      validator: (value) {
                        if (passwordController.text != value) {
                          return 'Password dosent match';
                        }
                        return null;
                      },
                    ),

                    SizedBox(
                      height: 20,
                    ),
              
                    //Submit Button
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: AppButton(
                        buttonTitle: Strings.signup,
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            String email = emailController.text.trim();
                            String name = unameController.text.trim();
                            String password = passwordController.text;
                            String phone = phoneController.text.trim();
                            String dob = dobController.text.trim();
                          }
                        },
                      ),
                    )
                  ],
                ),
              ))),
    );
  }
}