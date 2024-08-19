import 'package:image_search_app_hackerton/data/dto/pixabay_dto.dart';
import 'package:image_search_app_hackerton/domain/model/pixabay.dart';

extension DtoToModel on Hits {
  Pixabay toPixabayDto() {
    return Pixabay(
      id: id ?? 0,
      imageUrl: largeImageURL ?? '',
      tags: tags ?? '',
      user: user ?? '',
      previewURL: previewURL ?? '',
    );
  }
}