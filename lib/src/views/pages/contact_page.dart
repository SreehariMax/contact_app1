import 'package:contacts_app/src/controller/records_cubit/cubit/records_cubit.dart';
import 'package:contacts_app/src/views/pages/add_new_contact.dart';
import 'package:contacts_app/src/views/widgets/contact_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: BlocProvider(
        create: (context) => RecordsCubit()..getRecordsData(),
        child: SafeArea(child: BlocBuilder<RecordsCubit, RecordsState>(
          builder: (context, state) {
            if (state is RecordsLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is RecordsSuccess) {
              return ListView.builder(
                itemCount: state.records.length,
                itemBuilder: (subcontext, index) {
                  return ContactListItemWidget(
                    recordModel: state.records[index],
                  );
                },
              );
            } else if (state is RecordsError) {
              return Text("Oops!!! Something Went wrong");
            } else {
              return SizedBox();
            }
          },
        )),
      ),

      floatingActionButton:  FloatingActionButton(
        backgroundColor: const Color(0xff03dac6),
        foregroundColor: Colors.black,
        onPressed: () {

        Navigator.push(context, MaterialPageRoute(builder: (context) => AddNewContact()));
          // Respond to button press
        },
        child: Icon(Icons.add),
      ),

      
    );
  }
}
