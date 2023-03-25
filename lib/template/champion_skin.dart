class ChampionSkin {
  int id;
  String name;
  String championName;
  String? splashImage;

  ChampionSkin(
      {required this.id, required this.name, required this.championName}) {
    splashImage =
        "https://ddragon.leagueoflegends.com/cdn/img/champion/splash/${championName}_$id.jpg";
  }
}
