import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:space_junk/service_locator.dart';
import 'package:space_junk/style/game_button.dart';

//import '../player_progress/player_progress.dart';
import '../style/palette.dart';
import 'settings_controller.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  static const _gap = SizedBox(height: 60);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsControllerProvider);
    final palette = getIt<Palette>();

    return Scaffold(
      backgroundColor: palette.backgroundSettings.color,
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 600,
                ),
                child: settings.when(
                  data: (data) => ListView(
                    children: [
                      _gap,
                      const Text(
                        'Settings',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Press Start 2P',
                          fontSize: 30,
                          height: 1,
                        ),
                      ),
                      _gap,
                      _SettingsLine(
                        'Sound FX',
                        Icon(data.soundsOn
                            ? Icons.graphic_eq
                            : Icons.volume_off),
                        onSelected: () => ref
                            .read(settingsControllerProvider.notifier)
                            .toggleSoundsOn(),
                      ),
                      _SettingsLine(
                        'Music',
                        Icon(data.musicOn ? Icons.music_note : Icons.music_off),
                        onSelected: () => ref
                            .read(settingsControllerProvider.notifier)
                            .toggleMusicOn(),
                      ),
                      // _SettingsLine(
                      //   'Reset progress',
                      //   const Icon(Icons.delete),
                      //   onSelected: () {
                      //     context.read<PlayerProgress>().reset();

                      //     final messenger = ScaffoldMessenger.of(context);
                      //     messenger.showSnackBar(
                      //       const SnackBar(
                      //           content: Text('Player progress has been reset.')),
                      //     );
                      //   },
                      // ),
                    ],
                  ),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error, _) =>
                      Center(child: Text('Error loading data: $error')),
                ),
              ),
            ),
            _gap,
            GameButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              child: const Text('Back'),
            ),
            _gap,
          ],
        ),
      ),
    );
  }
}

class _SettingsLine extends StatelessWidget {
  final String title;

  final Widget icon;

  final VoidCallback? onSelected;

  const _SettingsLine(this.title, this.icon, {this.onSelected});

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      highlightShape: BoxShape.rectangle,
      onTap: onSelected,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: 'Press Start 2P',
                  fontSize: 20,
                ),
              ),
            ),
            icon,
          ],
        ),
      ),
    );
  }
}
