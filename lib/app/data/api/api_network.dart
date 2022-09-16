import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'api_exceptions.dart';

class NetworkService {
  //
  static String BASE_URL = "https://jsonplaceholder.typicode.com/";

  final Map<String, String> _requestHeaders = {
    HttpHeaders.acceptHeader: "application/json",
    "Content-Type": "application/json",
  };

  final Map<String, String> _requestHeadersWithoutToken = {
    HttpHeaders.acceptHeader: "application/json",
    "X-Requested-With": "XMLHttpRequest",
    "Content-Type": "application/x-www-form-urlencoded",
  };
  //
  Future<http.Response> get(
      {required String? url, required bool istoken}) async {
    //

    try {
      var response = await http.get(
        Uri.parse(BASE_URL + url!),
        headers: istoken ? _requestHeaders : _requestHeadersWithoutToken,
      );
      return response;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on TimeoutException {
      throw TimeOutException('Connection timedout');
    }
  }

  Future<http.Response> post(
      {String? url, dynamic body, required bool istoken}) async {
    try {
      final response = await http.post(
        Uri.parse(BASE_URL + url!),
        body: body,
        headers: istoken ? _requestHeaders : _requestHeadersWithoutToken,
      );

      return response;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on TimeoutException {
      throw TimeOutException('Connection timedout');
    }
  }

  Future<http.Response> put(
      {String? url,
      dynamic body,
      required bool istoken,
      required String? id}) async {
    try {
      final response = await http.put(
        Uri.parse("${BASE_URL + url!}/" + id!),
        body: body,
        headers: istoken ? _requestHeaders : _requestHeadersWithoutToken,
      );
      return response;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<http.Response> delete(
      {String? url, required bool istoken, required String? id}) async {
    try {
      final response = await http.delete(
        Uri.parse("${BASE_URL + url!}/" + id!),
        headers: istoken ? _requestHeaders : _requestHeadersWithoutToken,
      );
      return response;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }
}
