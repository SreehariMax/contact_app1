import 'dart:convert';

import 'package:contacts_app/src/models/records.dart';
import 'package:flutter/services.dart' show rootBundle;

class RecordsController {
  getData() async {
    //Reading the JSON Array file
    String rawData = await rootBundle.loadString("assets/data/records.json");
    //Decoding JSON Array String to List<Map>
    List<dynamic> decodeData = jsonDecode(rawData);
    //Iterating thr list using Map Method
    List<Record> records =
        decodeData.map((item) => Record.fromJSON(item)).toList();
  }
}
