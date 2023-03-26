import 'package:lol_champ_stats/template/champion_stats.dart';
import 'package:lol_champ_stats/template/spell.dart';

import 'champion_skin.dart';

class Champion {
  String id;
  String name;
  String title;
  ChampionStats stats;
  String tags;
  String? squareImage;
  String? splashImage;
  List<ChampionSkin> skins;
  Spell qSpell;
  Spell wSpell;
  Spell eSpell;
  Spell rSpell;
  Passive passive;

  Champion({
    required this.id,
    required this.name,
    required this.title,
    required this.stats,
    required this.tags,
    required this.skins,
    required this.qSpell,
    required this.wSpell,
    required this.eSpell,
    required this.rSpell,
    required this.passive,
  }) {
    splashImage =
        "http://ddragon.leagueoflegends.com/cdn/img/champion/splash/${id}_0.jpg";
    squareImage =
        "https://ddragon.leagueoflegends.com/cdn/13.6.1/img/champion/$id.png";
  }
}
