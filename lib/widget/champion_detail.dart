import 'package:flutter/material.dart';

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
                          const Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 5),
                              child: Text("Sorts",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18))),
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
                        children: const [
                          Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 5),
                              child: Text("Stats",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18))),
                          FractionallySizedBox(
                              widthFactor: 0.8,
                              child: Divider(
                                color: secondaryColor,
                                thickness: 1,
                              )),
                        ],
                      ))))
        ]));
  }
}
