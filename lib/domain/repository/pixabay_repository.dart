import 'package:image_search_app_hackerton/core/result.dart';
import 'package:image_search_app_hackerton/domain/model/pixabay.dart';

abstract interface class PixabayRepository {
  Future<List<Pixabay>> getPixabay(String query);
}