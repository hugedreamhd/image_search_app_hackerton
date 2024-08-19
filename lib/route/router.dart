import 'dart:ui';

import 'package:go_router/go_router.dart';
import 'package:image_search_app_hackerton/data/data_source/pixabay_data_source.dart';
import 'package:image_search_app_hackerton/data/repository/pixabay_repository_impl.dart';
import 'package:image_search_app_hackerton/domain/model/pixabay.dart';
import 'package:image_search_app_hackerton/presentation/detail_screen/detail_screen.dart';
import 'package:image_search_app_hackerton/presentation/home/home_screen.dart';
import 'package:image_search_app_hackerton/presentation/home/home_view_model.dart';
import 'package:provider/provider.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/detail_screen',
      builder: (context, state) {
        final image = state.extra as Pixabay;

        return ChangeNotifierProvider(
          create: (context) => HomeViewModel(
            PixabayRepositoryImpl(
              PixabayDataSource(),
            ),
          ),
          child: DetailScreen(image: image),
        );
      },
    ),

    // GoRoute(
    //   path: '/',
    //   builder: (context, state) => ChangeNotifierProvider(
    //     create: (_) => HomeViewModel(pixabayRepository),
    //     child: const HomeScreen(),
    //   ),
    // ),
  ],
);
