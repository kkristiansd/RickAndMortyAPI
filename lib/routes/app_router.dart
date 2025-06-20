import 'package:flutter/material.dart';
import '../features/splash/view/splash_screen.dart';
import '../features/shell/view/shell_screen.dart';
import '../features/character_detail/view/character_detail_screen.dart';
import '../features/character_list/model/character_model.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case '/home':
        return MaterialPageRoute(builder: (_) => const ShellScreen());

      case '/detail':
        final character = settings.arguments as Character;
        return MaterialPageRoute(
          builder: (_) => CharacterDetailScreen(character: character),
        );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}
