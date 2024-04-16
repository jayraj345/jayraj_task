import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RestServices extends GetxService {
  static final String noInternetMessage = 'connection_to_api_server_failed'.tr;
  final Map<String, String> mainHeader = {"Content-Type": "application/json"};

  Future<Response> getData(String uri, {Map<String, String>? headers}) async {
    try {
      http.Response response = await http
          .get(
            Uri.parse(uri),
            headers: headers ?? mainHeader,
          )
          .timeout(const Duration(seconds: 35));
      return handleResponse(response, uri);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> putData(String uri, dynamic body,
      {Map<String, String>? headers}) async {
    try {
      http.Response response = await http
          .put(
            Uri.parse(uri),
            body: jsonEncode(body),
            headers: headers ?? mainHeader,
          )
          .timeout(const Duration(seconds: 35));

      return handleResponse(response, uri);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Response handleResponse(http.Response response, String uri) {
    dynamic body;
    try {
      body = jsonDecode(response.body);
    } catch (e) {
      debugPrint("error $e");
    }
    Response responsBody = Response(
      body: body ?? response.body,
      bodyString: response.body.toString(),
      headers: response.headers,
      statusCode: response.statusCode,
      statusText: response.reasonPhrase,
    );
    if (response.statusCode == 401) {}
    if (responsBody.statusCode != 200 &&
        responsBody.body != null &&
        !responsBody.body['success']) {
      if (responsBody.body.toString().startsWith('{errors: [{code:')) {
        responsBody = Response(
            statusCode: responsBody.statusCode,
            body: responsBody.body,
            statusText: responsBody.body['message']);
      } else {
        responsBody = Response(
            statusCode: responsBody.statusCode,
            body: responsBody.body,
            statusText: responsBody.body['message']);
      }
    } else if (responsBody.statusCode != 200 && responsBody.body == null) {
      responsBody = Response(statusCode: 0, statusText: noInternetMessage);
    }

    return responsBody;
  }
}

class MultipartBody {
  String key;
  File file;

  MultipartBody(this.key, this.file);
}
