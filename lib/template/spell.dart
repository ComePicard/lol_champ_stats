class Spell {
  String idSpell;
  String nom;
  String spellKey; //Q, W, E, R
  String description;
  String? imageUrl;
  String cooldown;
  String manaCost;

  Spell(
      {required this.idSpell,
      required this.nom,
      required this.spellKey,
      required this.description,
      required this.cooldown,
      required this.manaCost}) {
    imageUrl =
        "https://ddragon.leagueoflegends.com/cdn/13.6.1/img/spell/$idSpell.png";
  }
}

class Passive {
  String idPassive;
  String nom;
  String description;
  String? imageUrl;

  Passive(
      {required this.idPassive, required this.nom, required this.description}) {
    imageUrl =
        "https://ddragon.leagueoflegends.com/cdn/13.6.1/img/passive/$idPassive";
  }
}
