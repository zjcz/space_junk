import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart';

import 'flame_game/game_screen.dart';
import 'level_selection/levels.dart';
import 'main_menu/main_menu_screen.dart';
import 'service_locator.dart';
import 'settings/settings_screen.dart';
import 'style/page_transition.dart';
import 'style/palette.dart';

class RouteDefs {
  static const String home = '/';
  static const String play = '/play';
  static const String settings = '/settings';

  static String getPageName(String pageName, {String? parentPage}) {
    return pageName.replaceAll(parentPage ?? '', '');
  }
}

GoRouter setupRouter() {
  return GoRouter(
    routes: [
      GoRoute(
        path: RouteDefs.home,
        builder: (context, state) =>
            const MainMenuScreen(key: Key('main menu')),
        routes: [
          GoRoute(
            path: RouteDefs.getPageName(RouteDefs.play,
                parentPage: RouteDefs.home),
            pageBuilder: (context, state) => buildPageTransition<void>(
              key: const ValueKey('play'),
              color: getIt<Palette>().backgroundLevelSelection.color,
              child: GameScreen(key: const Key('game'), level: gameLevels[0]),
            ),
          ),
          GoRoute(
            path: RouteDefs.getPageName(RouteDefs.settings,
                parentPage: RouteDefs.home),
            builder: (context, state) => const SettingsScreen(
              key: Key('settings'),
            ),
          ),
        ],
      ),
    ],
  );
}
