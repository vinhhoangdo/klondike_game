import 'package:flame_audio/flame_audio.dart';

/// Load all sound effects into cache to play smooth later.
void loadAllSFXToCache() async {
  await FlameAudio.audioCache.loadAll(
    [
      'shuffle-cards.mp3',
      'flip-card.mp3',
      'win.mp3',
    ],
  );
}
/// Play a sound effect
void playSFX(String fileName, {bool isMute = false}) {
  FlameAudio.play(fileName, volume: isMute ? 0.0 : 1.0);
}
