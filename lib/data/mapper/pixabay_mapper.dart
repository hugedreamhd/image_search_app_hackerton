import 'package:image_search_app_hackerton/data/dto/pixabay_dto.dart';
import 'package:image_search_app_hackerton/data/model/pixabay.dart';

extension DtoToModel on Hits {
  Pixabay toImageItem() {
    return Pixabay(
      ImageUrl: previewURL ?? '',
      tags: tags ?? '',
      user: user ?? '',
    );
  }
}