import 'package:lol_champ_stats/template/champion_stats.dart';
import 'package:lol_champ_stats/template/spell.dart';

import 'champion_skin.dart';

class Champion {
  String name;
  String title;
  ChampionStats stats;
  String? squareImage;
  String? splashImage;
  List<ChampionSkin> skins;
  Spell qSpell;
  Spell wSpell;
  Spell eSpell;
  Spell rSpell;
  Passive passive;

  Champion({
    required this.name,
    required this.title,
    required this.stats,
    required this.skins,
    required this.qSpell,
    required this.wSpell,
    required this.eSpell,
    required this.rSpell,
    required this.passive,
  }) {
    splashImage =
        "http://ddragon.leagueoflegends.com/cdn/img/champion/splash/${name}_0.jpg";
    squareImage =
        "https://ddragon.leagueoflegends.com/cdn/13.5.1/img/champion/$name.png";
  }
}
