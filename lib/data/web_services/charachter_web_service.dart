import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_widgets/data/models/chrachterModel.dart';

import '../../constants/constant.dart';

class Characterwebservices {
  late Dio dio;

  Characterwebservices() {
    BaseOptions options = new BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 20 * 1000,
        receiveTimeout: 20 * 1000,
        receiveDataWhenStatusError: true);
    dio = Dio(options);
  }

  Future<List<dynamic>> getallcharachter() async {
    try {
      Response res = await dio.get('characters');
      print(res.data.toString());
      return res.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
