class ChampionSkin {
  int id;
  String name;
  String championName;
  String? splashImage;

  ChampionSkin(this.id, this.name, this.championName) {
    splashImage =
        "https://ddragon.leagueoflegends.com/cdn/img/champion/splash/${championName}_$id.jpg";
  }
}
