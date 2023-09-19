import 'package:contacts_app/src/controller/records_controller.dart';
import 'package:contacts_app/src/models/records.dart';
import 'package:contacts_app/src/views/pages/widgets/contact_list_item.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  List<RecordModel> records = [];
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() {
    RecordsController controller = RecordsController();
    controller.getData().then((value) {
      setState(() {
        records = value;
      });
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: records.length,
          itemBuilder: (subcontext, index) {
            return ContactListItemWidget(
              recordModel: records[index],
            );
          },
        ),
      ),
    );
  }
}
