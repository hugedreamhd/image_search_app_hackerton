import 'package:go_router/go_router.dart';
import 'package:image_search_app_hackerton/domain/repository/pixabay_repository.dart';
import 'package:image_search_app_hackerton/presentation/home/home_screen.dart';
import 'package:image_search_app_hackerton/presentation/home/home_view_model.dart';
import 'package:provider/provider.dart';

final pixabayRepository = PixabayRepository();

final router = GoRouter(

  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => ChangeNotifierProvider(
        create: (_) => HomeViewModel(pixabayRepository),
        child: const HomeScreen(),
      ),
    ),
  ],
);
