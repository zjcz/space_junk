import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:space_junk/audio/audio_manager.dart';
import 'package:space_junk/service_locator.dart';
import 'package:space_junk/settings/settings_controller.dart';
import 'package:space_junk/style/game_button.dart';

import '../audio/sounds.dart';
import '../style/palette.dart';
import '../style/responsive_screen.dart';

class MainMenuScreen extends ConsumerWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = getIt<Palette>();
    final settings = ref.watch(settingsControllerProvider);
    final audioController = getIt<AudioManager>();

    return Scaffold(
      backgroundColor: palette.backgroundMain.color,
      body: ResponsiveScreen(
        squarishMainArea: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/banner.png',
                filterQuality: FilterQuality.none,
              ),
              _gap,
              Transform.rotate(
                angle: -0.1,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: const Text(
                    'A Flutter game template.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Press Start 2P',
                      fontSize: 32,
                      height: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        rectangularMenuArea: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GameButton(
              onPressed: () {
                audioController.playSfx(SfxType.buttonTap);
                GoRouter.of(context).go('/play');
              },
              child: const Text('Play'),
            ),
            _gap,
            GameButton(
              onPressed: () => GoRouter.of(context).push('/settings'),
              child: const Text('Settings'),
            ),
            _gap,
            settings.when(
              data: (data) => Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: IconButton(
                    onPressed: () => ref
                        .read(settingsControllerProvider.notifier)
                        .toggleAudioOn(),
                    icon:
                        Icon(data.audioOn ? Icons.volume_up : Icons.volume_off),
                  )),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, _) =>
                  Center(child: Text('Error loading data: $error')),
            ),
            _gap,
            const Text('Built with Flame'),
          ],
        ),
      ),
    );
  }

  static const _gap = SizedBox(height: 10);
}
