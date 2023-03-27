import 'dart:convert';

import 'package:http/http.dart' as http;

import '../template/champion.dart';
import '../template/champion_skin.dart';
import '../template/champion_stats.dart';
import '../template/spell.dart';

class JsonService {
  static String listeChampionUrl =
      "https://ddragon.leagueoflegends.com/cdn/13.6.1/data/en_US/champion.json";
  static String championDataUrl =
      "https://ddragon.leagueoflegends.com/cdn/13.6.1/data/en_US/champion/";

  static Future<List<String>> getListeChampion() async {
    final response = await http.get(Uri.parse(listeChampionUrl),
        headers: {'Access-Cross-Allow-Origin': '*'});
    final jsonData = jsonDecode(response.body);
    final List<String> champList = [];

    jsonData['data'].keys.forEach((champion) {
      champList.add(champion);
    });

    return champList;
  }

  static getChampionData(name) async {
    final response = await http.get(Uri.parse("${championDataUrl + name}.json"),
        headers: {'Access-Cross-Allow-Origin': '*'});
    final jsonData = jsonDecode(response.body);

    String cdSpell = "(";
    jsonData['data']['$name']['spells'][0]['cooldown'].forEach((cd) {
      if (cdSpell.length > 1) {
        cdSpell += ", $cd";
      } else {
        cdSpell += cd.toString();
      }
    });
    cdSpell += ")";

    String manaSpell = "(";
    jsonData['data']['$name']['spells'][0]['cost'].forEach((mana) {
      if (manaSpell.length > 1) {
        manaSpell += ", $mana";
      } else {
        manaSpell += mana.toString();
      }
    });
    manaSpell += ")";

    Spell qSpell = Spell(
        idSpell: jsonData['data']['$name']['spells'][0]['id'],
        nom: jsonData['data']['$name']['spells'][0]['name'],
        spellKey: "Q",
        description: jsonData['data']['$name']['spells'][0]['description'],
        cooldown: cdSpell,
        manaCost: manaSpell);

    cdSpell = "(";
    jsonData['data']['$name']['spells'][1]['cooldown'].forEach((cd) {
      if (cdSpell.length > 1) {
        cdSpell += ", $cd";
      } else {
        cdSpell += cd.toString();
      }
    });
    cdSpell += ")";

    manaSpell = "(";
    jsonData['data']['$name']['spells'][1]['cost'].forEach((mana) {
      if (manaSpell.length > 1) {
        manaSpell += ", $mana";
      } else {
        manaSpell += mana.toString();
      }
    });
    manaSpell += ")";

    Spell wSpell = Spell(
        idSpell: jsonData['data']['$name']['spells'][1]['id'],
        nom: jsonData['data']['$name']['spells'][1]['name'],
        spellKey: "W",
        description: jsonData['data']['$name']['spells'][1]['description'],
        cooldown: cdSpell,
        manaCost: manaSpell);

    cdSpell = "(";
    jsonData['data']['$name']['spells'][2]['cooldown'].forEach((cd) {
      if (cdSpell.length > 1) {
        cdSpell += ", $cd";
      } else {
        cdSpell += cd.toString();
      }
    });
    cdSpell += ")";

    manaSpell = "(";
    jsonData['data']['$name']['spells'][2]['cost'].forEach((mana) {
      if (manaSpell.length > 1) {
        manaSpell += ", $mana";
      } else {
        manaSpell += mana.toString();
      }
    });
    manaSpell += ")";

    Spell eSpell = Spell(
        idSpell: jsonData['data']['$name']['spells'][2]['id'],
        nom: jsonData['data']['$name']['spells'][2]['name'],
        spellKey: "E",
        description: jsonData['data']['$name']['spells'][2]['description'],
        cooldown: cdSpell,
        manaCost: manaSpell);

    cdSpell = "(";
    jsonData['data']['$name']['spells'][3]['cooldown'].forEach((cd) {
      if (cdSpell.length > 1) {
        cdSpell += ", $cd";
      } else {
        cdSpell += cd.toString();
      }
    });
    cdSpell += ")";

    manaSpell = "(";
    jsonData['data']['$name']['spells'][3]['cost'].forEach((mana) {
      if (manaSpell.length > 1) {
        manaSpell += ", $mana";
      } else {
        manaSpell += mana.toString();
      }
    });
    manaSpell += ")";

    Spell rSpell = Spell(
        idSpell: jsonData['data']['$name']['spells'][3]['id'],
        nom: jsonData['data']['$name']['spells'][3]['name'],
        spellKey: "R",
        description: jsonData['data']['$name']['spells'][3]['description'],
        cooldown: cdSpell,
        manaCost: manaSpell);

    Passive passive = Passive(
      idPassive: jsonData['data']['$name']['passive']['image']['full'],
      nom: jsonData['data']['$name']['passive']['name'],
      description: jsonData['data']['$name']['passive']['description'],
    );

    ChampionStats stats = ChampionStats(
        hp: jsonData['data']['$name']['stats']['hp'],
        hpLvl: jsonData['data']['$name']['stats']['hpperlevel'],
        mana: jsonData['data']['$name']['stats']['mp'],
        manaLvl: jsonData['data']['$name']['stats']['mpperlevel'].toDouble(),
        movementSpeed: jsonData['data']['$name']['stats']['movespeed'],
        armor: jsonData['data']['$name']['stats']['armor'],
        armorLvl:
            jsonData['data']['$name']['stats']['armorperlevel'].toDouble(),
        magicResistance: jsonData['data']['$name']['stats']['spellblock'],
        magicResistanceLvl:
            jsonData['data']['$name']['stats']['spellblockperlevel'].toDouble(),
        ad: jsonData['data']['$name']['stats']['attackdamage'],
        adLvl: jsonData['data']['$name']['stats']['attackdamageperlevel']
            .toDouble(),
        attackSpeed: jsonData['data']['$name']['stats']['attackspeed'],
        attackSpeedLvl: jsonData['data']['$name']['stats']
                ['attackspeedperlevel']
            .toDouble(),
        attackRange: jsonData['data']['$name']['stats']['attackrange']);

    List<ChampionSkin>? skins = [];

    jsonData['data']['$name']['skins'].forEach((skin) {
      ChampionSkin champSkin =
          ChampionSkin(id: skin['num'], name: skin['name'], championName: name);
      skins.add(champSkin);
    });

    String tags = "";

    jsonData['data']['$name']['tags'].forEach((tag) {
      if (tags.isNotEmpty) {
        tags += ", $tag";
      } else {
        tags += tag;
      }
    });

    Champion champ = Champion(
      id: jsonData['data']['$name']["id"],
      name: jsonData['data']['$name']["name"],
      title: jsonData['data']['$name']["title"],
      stats: stats,
      tags: tags,
      skins: skins,
      qSpell: qSpell,
      wSpell: wSpell,
      eSpell: eSpell,
      rSpell: rSpell,
      passive: passive,
    );

    return champ;
  }
}
