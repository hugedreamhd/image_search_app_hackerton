import 'package:go_router/go_router.dart';
import 'package:image_search_app_hackerton/presentation/home/home_screen.dart';

// PixabayDataSource 인스턴스 생성
// final pixabayDataSource = PixabayDataSource();

// PixabayRepository 인스턴스 생성
// final PixabayRepository pixabayRepository =
//     PixabayRepositoryImpl(pixabayDataSource);

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
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
