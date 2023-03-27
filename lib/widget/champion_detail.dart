import 'package:flutter/material.dart';
import 'package:lol_champ_stats/widget/spell_detail.dart';

import '../template/champion.dart';

class ChampionDetail extends StatefulWidget {
  final Champion champion;

  const ChampionDetail({Key? key, required this.champion}) : super(key: key);

  @override
  State<ChampionDetail> createState() => _ChampionDetailState();
}

class _ChampionDetailState extends State<ChampionDetail> {
  static const bgColor = Color(0xff242424);
  static const secondaryBgColor = Color(0xff23364C);
  static const secondaryColor = Color(0xffC4943D);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
            backgroundColor: secondaryBgColor,
            centerTitle: true,
            title: Text(widget.champion.name,
                style: const TextStyle(fontSize: 28))),
        body: Column(children: [
          Padding(
              padding: (const EdgeInsets.only(top: 30)),
              child: Image.network(widget.champion.splashImage!,
                  fit: BoxFit.cover, height: 250)),
          Padding(
              padding: (const EdgeInsets.only(top: 20, left: 35)),
              child: Row(children: [
                const Text("Classe :",
                    style: TextStyle(color: secondaryColor, fontSize: 20)),
                Padding(
                    padding: (const EdgeInsets.only(left: 20)),
                    child: Text(
                      widget.champion.tags,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ))
              ])),
          Padding(
              padding: (const EdgeInsets.only(top: 20)),
              child: FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Container(
                      decoration: BoxDecoration(
                        color: secondaryBgColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: secondaryColor,
                          width: 2,
                        ),
                      ),
                      height: 150,
                      child: Column(
                        children: [
                          InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => SpellDetail(
                                        spell: widget.champion.qSpell));
                              },
                              child: const Padding(
                                  padding: EdgeInsets.only(top: 10, bottom: 5),
                                  child: Text("Sorts",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18)))),
                          const FractionallySizedBox(
                              widthFactor: 0.8,
                              child: Divider(
                                color: secondaryColor,
                                thickness: 1,
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Center(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(right: 15),
                                        child: Image.network(
                                          widget.champion.passive.imageUrl!,
                                          width: 50,
                                        )),
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(right: 15),
                                        child: Image.network(
                                            widget.champion.qSpell.imageUrl!,
                                            width: 50)),
                                    Image.network(
                                        widget.champion.wSpell.imageUrl!,
                                        width: 50),
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Image.network(
                                            widget.champion.eSpell.imageUrl!,
                                            width: 50)),
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Image.network(
                                            widget.champion.rSpell.imageUrl!,
                                            width: 50)),
                                  ])))
                        ],
                      )))),
          Padding(
              padding: (const EdgeInsets.only(top: 20)),
              child: FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Container(
                      decoration: BoxDecoration(
                        color: secondaryBgColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: secondaryColor,
                          width: 2,
                        ),
                      ),
                      height: 300,
                      child: Column(
                        children: [
                          const Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 5),
                              child: Text("Stats",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18))),
                          const FractionallySizedBox(
                              widthFactor: 0.8,
                              child: Divider(
                                color: secondaryColor,
                                thickness: 1,
                              )),
                          Row(children: [
                            Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, top: 30),
                                child: Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Image.asset("Health_icon.png"),
                                  ),
                                  Text(
                                      "${widget.champion.stats.hp} (+${widget.champion.stats.hpLvl})",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 18))
                                ])),
                            Expanded(child: Container()),
                            Padding(
                                padding:
                                    const EdgeInsets.only(right: 30, top: 30),
                                child: Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Image.asset("Mana_icon.png"),
                                  ),
                                  Text(
                                      "${widget.champion.stats.mana} (+${widget.champion.stats.manaLvl})",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 18))
                                ])),
                          ]),
                          Row(children: [
                            Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, top: 30),
                                child: Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Image.asset("Armor_icon.png"),
                                  ),
                                  Text(
                                      "${widget.champion.stats.armor} (+${widget.champion.stats.armorLvl})",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 18))
                                ])),
                            Expanded(child: Container()),
                            Padding(
                                padding:
                                    const EdgeInsets.only(right: 30, top: 30),
                                child: Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Image.asset(
                                        "Magic_resistance_icon.png"),
                                  ),
                                  Text(
                                      "${widget.champion.stats.magicResistance} (+${widget.champion.stats.magicResistanceLvl})",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 18))
                                ])),
                          ]),
                          Row(children: [
                            Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, top: 30),
                                child: Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child:
                                        Image.asset("Attack_damage_icon.png"),
                                  ),
                                  Text(
                                      "${widget.champion.stats.ad} (+${widget.champion.stats.adLvl})",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 18))
                                ])),
                            Expanded(child: Container()),
                            Padding(
                                padding:
                                    const EdgeInsets.only(right: 30, top: 30),
                                child: Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Image.asset("Attack_speed_icon.png"),
                                  ),
                                  Text(
                                      "${widget.champion.stats.attackSpeed} (+${widget.champion.stats.attackSpeedLvl}%)",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 18))
                                ])),
                          ]),
                          Row(children: [
                            Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, top: 30),
                                child: Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Image.asset("Range_icon.png"),
                                  ),
                                  Text(
                                      widget.champion.stats.attackRange
                                          .toString(),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 18))
                                ])),
                          ])
                        ],
                      ))))
        ]));
  }
}
