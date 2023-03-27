import 'package:flutter/material.dart';

import '../template/spell.dart';

class SpellDetail extends StatefulWidget {
  final Spell spell;

  const SpellDetail({Key? key, required this.spell}) : super(key: key);

  @override
  State<SpellDetail> createState() => _SpellDetailState();
}

class _SpellDetailState extends State<SpellDetail> {
  static const bgColor = Color(0xff242424);
  static const secondaryBgColor = Color(0xff23364C);
  static const secondaryColor = Color(0xffC4943D);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: secondaryColor, width: 2.0),
      ),
      backgroundColor: secondaryBgColor,
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.network(widget.spell.imageUrl!, width: 50),
          ),
          Text(
            widget.spell.nom,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
      content: SizedBox(
          height: 250,
          child: SingleChildScrollView(
              child: Column(
            children: [
              const FractionallySizedBox(
                  widthFactor: 0.8,
                  child: Divider(
                    color: secondaryColor,
                    thickness: 1,
                  )),
              Row(children: [
                Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      children: [
                        Image.asset('Cooldown_icon.png'),
                        Text(widget.spell.cooldown)
                      ],
                    ))
              ]),
              Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    widget.spell.description,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ))
            ],
          ))),
    );
  }
}
