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
  Spell passive;

  Champion(
    this.name,
    this.title,
    this.stats,
    this.skins,
    this.qSpell,
    this.wSpell,
    this.eSpell,
    this.rSpell,
    this.passive,
  ) {
    splashImage =
        "http://ddragon.leagueoflegends.com/cdn/img/champion/splash/${name}_0.jpg";
    squareImage =
        "https://ddragon.leagueoflegends.com/cdn/13.5.1/img/champion/$name.png";
  }
}
