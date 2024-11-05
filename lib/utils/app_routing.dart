import 'package:dogapp/models/search_params.dart';
import 'package:dogapp/views/breed_screen.dart';
import 'package:dogapp/views/favorite_screen.dart';
import 'package:dogapp/views/home.dart';
import 'package:dogapp/views/sub_breed_screen.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  breed,
  subBreed,
  favorite,
}

final GoRouter goRouter = GoRouter(
  routes: [
    GoRoute(
        path: '/',
        builder: (contex, state) => const Home(),
        routes: [
          GoRoute(
            path: 'breed',
            name: AppRoute.breed.name,
            builder: (context, state) {
              final item = state.extra as String;
              return Breedscreen(breedforsearch: item);
            },
          ),
          GoRoute(
            name: AppRoute.subBreed.name,
            path: '/:mainBreed/:subBreed',
            builder: (context, state) {
              final String mainBreed = state.pathParameters['mainBreed']!;
              final String subBreed = state.pathParameters['subBreed']!;
              return Subbreedimage(mainBreed: mainBreed, subBreed: subBreed);
            }
          ),
          GoRoute(
            path: 'favorite',
            name: AppRoute.favorite.name,
            builder: (context, state) => const FavoriteScreen(),
          ),
        ])
  ],
);
