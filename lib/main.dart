import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:space_junk/app_lifecycle/app_lifecycle.dart';
import 'package:space_junk/audio/audio_manager.dart';

import 'package:space_junk/route_config.dart';
import 'package:space_junk/service_locator.dart';
import 'package:space_junk/settings/models/settings_model.dart';
import 'package:space_junk/settings/settings_controller.dart';
import 'style/palette.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialise getIt
  setupServiceLocator();

  await Flame.device.setLandscape();
  await Flame.device.fullScreen();

  runApp(const ProviderScope(child: SpaceJunkGame()));
}

class SpaceJunkGame extends ConsumerStatefulWidget {
  const SpaceJunkGame({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SpaceJunkGameState();
}

class _SpaceJunkGameState extends ConsumerState<SpaceJunkGame> {
  @override
  void dispose() {
    disposeServiceLocator();

    // dispose the app lifecycle provider.
    final lifecycleProvider = ref.read(appLifecycleObserverProvider.notifier);
    lifecycleProvider.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Palette palette = getIt<Palette>();

    final appLifecycle = ref.watch(appLifecycleObserverProvider.notifier);
    appLifecycle.init();

    // configure the audio manager.  Listen to changes in the settings
    // and refresh the audio manager
    final AudioManager audioManager = getIt<AudioManager>();
    final settings = ref.read(settingsControllerProvider.future);
    settings.then((value) => audioManager.settingsChanged(value));

    // listen for changes to the settings and the lifecycle state.
    // When they change then notify the AudioManager
    ref.listen(settingsControllerProvider.future,
        (Future<SettingsModel>? oldSettings,
            Future<SettingsModel> newSettings) async {
      audioManager.settingsChanged(await newSettings);
    });
    ref.listen(appLifecycleObserverProvider,
        (AppLifecycleState? oldState, AppLifecycleState newState) {
      audioManager.lifecycleStateChanged(newState);
    });

    return MaterialApp.router(
      title: 'Space Junk',
      color: Colors.white,
      theme: flutterNesTheme().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: palette.seed.color,
          surface: palette.backgroundMain.color,
        ),
        textTheme: GoogleFonts.pressStart2pTextTheme().apply(
          bodyColor: palette.text.color,
          displayColor: palette.text.color,
        ),
      ),
      routerConfig: setupRouter(),
      // Use the following when generating screenshots to remove the debug banner
      //debugShowCheckedModeBanner: false,
    );
  }
}
