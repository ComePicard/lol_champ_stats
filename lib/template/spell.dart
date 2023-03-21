class Spell {
  int id_spell;
  String nom;
  String spellKey; //Q, W, E, R, Passive
  String description;
  String? imageUrl;
  List<int> cooldown;
  List<int> manaCost;

  Spell(this.id_spell, this.nom, this.spellKey, this.description, this.cooldown,
      this.manaCost) {
    imageUrl =
        "https://ddragon.leagueoflegends.com/cdn/13.5.1/img/spell/$id_spell.png";
  }
}
