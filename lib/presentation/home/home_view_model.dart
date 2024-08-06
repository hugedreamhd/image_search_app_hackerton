import 'package:flutter/material.dart';
import 'package:image_search_app_hackerton/domain/repository/pixabay_repository.dart';
import 'package:image_search_app_hackerton/presentation/home/home_ui_state.dart';

class HomeViewModel with ChangeNotifier {
  final PixabayRepository _pixabayRepository;

  // state
  HomeUiState _state = HomeUiState();

  HomeUiState get state => _state;

  // 생성자
  HomeViewModel(this._pixabayRepository);

  void searchImage(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    try {
      final image = await _pixabayRepository.getPixabay(query);
      _state = state.copyWith(isLoading: false, images: image);
    } catch (e) {
      _state = state.copyWith(isLoading: false, error: e.toString());
    }
    notifyListeners();
  }
}
