import 'package:contacts_app/src/core/network/api_helper.dart';
import 'package:contacts_app/src/core/network/api_response.dart';
import 'package:contacts_app/src/models/user_requst_model.dart';
import 'package:contacts_app/src/views/pages/widgets/login_page.dart';
import 'package:contacts_app/src/views/pages/widgets/signup_page.dart';

class AuthRepository {
  Future<Api_Response> login(String email, String password) async {
    Api_Response apiResponse = await Api_Helper()
        .makePostRequest('user/login', {"email": email, "password": password});

    return apiResponse;
  }

  signup(UserRequestModel userResponseModel) async {
    Api_Response apiResponse = await Api_Helper()
        .makePostRequest('user/signup', userResponseModel.toJSON());

    return apiResponse;
  }
}
