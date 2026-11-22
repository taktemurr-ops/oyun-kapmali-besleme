import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_kapmali_besleme/oyun_kapmali_besleme.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(kapmaliConfig.title.length, 33);
    expect(kapmaliConfig.tagline.length, 33);
    for (final s in kapmaliConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler çözülebilir', () {
    final planner = LevelPlanner(gameId: kapmaliId, optionalMechanics: const []);
    for (final lv in [1, 77, 1500, 33333, 49999]) {
      final gl = kapmaliRules.build(planner.spec(lv));
      expect(gl.validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
