import 'package:freezed_annotation/freezed_annotation.dart';

part 'pixabay.freezed.dart';

part 'pixabay.g.dart';

@freezed
class Pixabay with _$Pixabay {
  const factory Pixabay({
    required num id,
    required String user,
    required String previewURL,
    required String imageUrl,
    required String tags,
  }) = _Pixabay;

  factory Pixabay.fromJson(Map<String, Object?> json) => _$PixabayFromJson(json);
}