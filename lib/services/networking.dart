import 'dart:convert';
import 'package:flutter/services.dart';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future<List> getData() async {
    final String response = await rootBundle.loadString(url);
    final data = await jsonDecode(response);
    return data as List;
  }
}
