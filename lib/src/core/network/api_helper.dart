import 'dart:io';

import 'package:contacts_app/src/core/network/api_response.dart';
import 'package:dio/dio.dart';

class Api_Helper {
  static final Api_Helper _api_helper = Api_Helper._internal();

  factory Api_Helper() => _api_helper;

  Api_Helper._internal();

  final Dio _dio = Dio(BaseOptions(
    connectTimeout: Duration(seconds: 120),
    receiveTimeout: Duration(seconds: 120),
    baseUrl: 'http://dducusat.fluttertrainer.in/',
    contentType: 'application/json',
  ));

//for get we nee adress,header as key valuepair and its optional no body required
  Future<Api_Response> makeGetRequest(String route,
      {Map<String, dynamic>? header, Map<String, dynamic>? queryparams}) async {
    try {
      Response response = await _dio.get(route,
          queryParameters: queryparams, options: Options(headers: header));
      return Api_Response.fromJSON(response.data);
    } catch (e) {
      return Api_Response(Status: false, error: 'Something went wrong');
    }
    // if (response.statusCode == HttpStatus.ok) {
    //   Api_Response.fromJSON(response.data);
    // }
  }

//post
  Future<Api_Response> makePostRequest(String route, Map<String, dynamic> body,
      {Map<String, dynamic>? header, Map<String, dynamic>? queryparams}) async {
    try {
      Response response = await _dio.post(route,
      data: body,
          queryParameters: queryparams, options: Options(headers: header));
      return Api_Response.fromJSON(response.data);
    } catch (e) {
      return Api_Response(Status: false, error: 'Something went wrong');
    }
  }

//patch
  Future<Api_Response> makePatchRequest(String route, Map<String, dynamic> body,
      {Map<String, dynamic>? header, Map<String, dynamic>? queryparams}) async {
    try {
      Response response = await _dio.patch(route,
      data: body,
          queryParameters: queryparams, options: Options(headers: header));
      return Api_Response.fromJSON(response.data);
    } catch (e) {
      return Api_Response(Status: false, error: 'Something went wrong');
    }
  }

  //delete
  Future<Api_Response> makeDeleteRequest(
      String route, Map<String, dynamic> body,
      {Map<String, dynamic>? header, Map<String, dynamic>? queryparams}) async {
    try {
      Response response = await _dio.delete(route,
      data: body,
          queryParameters: queryparams, options: Options(headers: header));
      return Api_Response.fromJSON(response.data);
    } catch (e) {
      return Api_Response(Status: false, error: 'Something went wrong');
    }
  }
}
