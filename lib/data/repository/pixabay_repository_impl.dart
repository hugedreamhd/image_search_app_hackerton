import 'package:image_search_app_hackerton/data/data_source/pixabay_data_source.dart';
import 'package:image_search_app_hackerton/data/mapper/pixabay_mapper.dart';
import 'package:image_search_app_hackerton/domain/model/pixabay.dart';
import 'package:image_search_app_hackerton/domain/repository/pixabay_repository.dart';

class PixabayRepositoryImpl implements PixabayRepository {
  final PixabayDataSource _pixabayDataSource;

  PixabayRepositoryImpl(this._pixabayDataSource);

  @override
  Future<List<Pixabay>> getPixabay(String query) async {
    final imageDto = await _pixabayDataSource.getImageResult(query);
    return imageDto.map((e) => e.toPixabayDto()).toList();
  }
}
