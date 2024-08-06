import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:image_search_app_hackerton/data/dto/pixabay_dto.dart';

class PixabayDataSource {
  final String _baseUrl = 'https://pixabay.com/api/?key=';
  final String _key = '41486583-a8bebcb5b3331340ec13d3579';

  Future<List<Hits>> getImageResult(String query) async {
    final encodedQuery = Uri.encodeQueryComponent(query);
    final url = '$_baseUrl$_key&q=$encodedQuery';
    print('Requesting URL: $url');


    // final response = await http.get(Uri.parse('$_baseUrl$_key&q=$query'));

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        final List<dynamic> jsonList = jsonResponse['hits'];
        print(response.body);
        return jsonList.map((e) => Hits.fromJson(e)).toList();
      } else {
        throw Exception('이미지 로딩 실패');
      }
    } on SocketException catch (e) {
      print('SocketException: $e');
      throw Exception('네트워크 연결 문제');
    } catch (e) {
      print('Exception: $e');
      throw Exception('알 수 없는 오류: $e');
    }
  }
}
