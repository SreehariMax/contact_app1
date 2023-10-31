import 'package:contacts_app/src/controller/auth_cubit/cubit/auth_cubit.dart';
import 'package:contacts_app/src/controller/contact_cubit/cubit/contact_cubit.dart';
import 'package:contacts_app/src/core/common_widget/app_button.dart';
import 'package:contacts_app/src/core/constants/strings.dart';
import 'package:contacts_app/src/core/helpers/validation_helper.dart';
import 'package:contacts_app/src/models/contact_model.dart';
import 'package:contacts_app/src/views/pages/new_contacts_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddNewContact extends StatefulWidget {
  const AddNewContact({super.key});

  @override
  State<AddNewContact> createState() => _AddNewContactState();
}

final GlobalKey<FormState> _formKey = GlobalKey();

class _AddNewContactState extends State<AddNewContact> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactCubit(),
      child: Scaffold(
        body: SafeArea(
            child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                  keyboardType: TextInputType.name,
                  controller: firstNameController,
                  decoration: const InputDecoration(label: Text(Strings.name)),
                  validator: ValidationHelpers.validateName),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: lastNameController,
                decoration:
                    const InputDecoration(label: Text(Strings.lastname)),
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: addressController,
                decoration:
                    const InputDecoration(label: Text(Strings.addrestxt)),
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: phoneController,
                decoration: const InputDecoration(label: Text(Strings.email)),
                validator: ValidationHelpers.validateEmail,
              ),
              SizedBox(
                height: 30,
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is ContactCreateStateSuccess) {
                    Fluttertoast.showToast(msg: Strings.contactCreateSuccess);
                  } else if (state is ContactCreateStateError) {
                    Fluttertoast.showToast(msg: Strings.contactCreateFailed);
                  }
                  // TODO: implement listener
                },
                builder: (context, state) {

                  showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text(Strings.error),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(Strings.ok))
                                      ],
                                    ));
                  return AppButton(
                      buttonTitle: Strings.submit,
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          String fname = firstNameController.text.trim();
                          String lname = lastNameController.text.trim();
                          String address = addressController.text.trim();
                          String phone = phoneController.text.trim();
                          String email = emailController.text.trim();

                          context.read<ContactCubit>().createContact(
                              ContactModel(
                                  fname: fname,
                                  lname: lname,
                                  address: address,
                                  phone: phone,
                                  email: email));
                        }
                      });
                },
              )
            ],
          ),
        )),
      ),
    );
  }
}
