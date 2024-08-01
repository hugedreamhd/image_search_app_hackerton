import 'package:image_search_app_hackerton/core/result.dart';

abstract interface class PixabayRepository {
  Future<Result<List<Pixabay>>> getPixabay();
}