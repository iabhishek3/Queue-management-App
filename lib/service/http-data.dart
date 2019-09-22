import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:http/io_client.dart';
import 'package:flutter_ui_login/dto/queue_dto.dart';

class ApplicationHttpserive {
  Future<Welcome> postGeneric(String url, body) async {
    bool trustSelfSigned = true;
    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = new IOClient(httpClient);

    return ioClient
        .post(url,
            headers: {"Content-Type": "application/json", "X-UNITCODE": "PRW"},
            body: body)
        .then((http.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
// print(response.body);
      return welcomeFromJson(response.body);
    });
  }

  Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

  String welcomeToJson(Welcome data) => json.encode(data.toJson());
}
