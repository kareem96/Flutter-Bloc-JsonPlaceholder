

import 'dart:convert';
import 'dart:io';
import 'package:abdul_karim_test/data/model/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;




class ApiService {
  static const baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<Map<String, String>> getDefaultHeader() async{
    return {HttpHeaders.acceptHeader: 'application/json'};
  }

  // Future<http.Response> getList() => doGet('/posts?_start=0&_limit=20');
  Future<http.Response> getList() => doGet('/posts?_start=0&_limit=20');

  Future<http.Response> doGet(String path, {Map<String, String> headers = const{}, String base = ''}) async{
    final defaultHeaders = await getDefaultHeader();
    defaultHeaders.addAll(headers);
    if(base.isEmpty) base = baseUrl;
    String url = '$base$path';
    debugPrint('[GET] => $url');
    debugPrint('[HEADER] => $defaultHeaders');
    return http.get(Uri.parse(url), headers: defaultHeaders);

  }
}
