import 'package:contacts_app/src/core/network/api_helper.dart';
import 'package:contacts_app/src/core/network/api_response.dart';
import 'package:contacts_app/src/models/contact_model.dart';

class ContactRepository {
  Future<ApiResponse> getAllContacts() async {
    ApiResponse apiResponse = await ApiHelper().makeGetRequest("contact");

    return apiResponse;
  }

  Future<ApiResponse> createNewContact() async {
    ApiResponse apiResponse =
        await ApiHelper().makePostRequest("contact",  );

    return apiResponse;
  }
}
