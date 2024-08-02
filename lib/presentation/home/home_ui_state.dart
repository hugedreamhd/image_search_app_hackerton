import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_search_app_hackerton/domain/model/pixabay.dart';

part 'home_ui_state.freezed.dart';

part 'home_ui_state.g.dart';

@freezed
class HomeUiState with _$HomeUiState {
  const factory HomeUiState({
    @Default('') String query,
    @Default([]) List<Pixabay> images,
    @Default(false) bool isLoading,
  }) = _HomeUiState;

  factory HomeUiState.fromJson(Map<String, Object?> json) =>
      _$HomeUiStateFromJson(json);
}
