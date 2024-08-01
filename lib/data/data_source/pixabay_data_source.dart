import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_search_app_hackerton/data/dto/pixabay_dto.dart';
import 'package:image_search_app_hackerton/domain/model/pixabay.dart';

class PixabayDataSource {
  final String _baseUrl = 'https://pixabay.com/api/?key=';
  final String _key = '41486583-a8bebcb5b3331340ec13d3579';

  Future<List<Hits>> getImageResult(String query) async {
    final response = await http.get(Uri.parse('$_baseUrl$_key&q=$query'));

    if (response.statusCode == 200) {
      final List jsonList = jsonDecode(response.body);
      return jsonList.map((e) => Hits.fromJson(e)).toList();
    } else {
      throw Exception('이미지 로딩 실패');
    }
  }
}
