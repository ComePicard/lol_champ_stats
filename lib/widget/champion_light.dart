import 'package:flutter/material.dart';

import '../template/champion.dart';
import 'champion_detail.dart';

class ChampionLight extends StatefulWidget {
  final Champion champion;

  const ChampionLight({Key? key, required this.champion}) : super(key: key);

  @override
  State<ChampionLight> createState() => _ChampionLightState();
}

class _ChampionLightState extends State<ChampionLight> {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.transparent,
        child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ChampionDetail(champion: widget.champion)),
              );
            },
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.ideographic,
                            children: <Widget>[
                              Padding(
                                padding: (const EdgeInsets.only(
                                    left: 15, bottom: 8, top: 8)),
                                child: Text(
                                  widget.champion.name,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                              ),
                              Padding(
                                padding: (const EdgeInsets.only(
                                    left: 15, bottom: 8, top: 8)),
                                child: Text(
                                  widget.champion.title,
                                  style: const TextStyle(
                                      color: Color(0xffC4943D), fontSize: 18),
                                ),
                              ),
                            ]),
                        Expanded(child: Container()),
                        Padding(
                            padding: (const EdgeInsets.only(
                                right: 15, bottom: 8, top: 8)),
                            child: Image.network(widget.champion.squareImage!,
                                fit: BoxFit.cover, width: 90, height: 90))
                      ])
                ])));
  }
}
