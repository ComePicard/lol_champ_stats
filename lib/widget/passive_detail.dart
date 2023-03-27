import 'package:flutter/material.dart';

import '../template/spell.dart';

class PassiveDetail extends StatefulWidget {
  final Passive passive;

  const PassiveDetail({Key? key, required this.passive}) : super(key: key);

  @override
  State<PassiveDetail> createState() => _PassiveDetailState();
}

String removeBalise(String htmlString) {
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
  String result = htmlString.replaceAll(exp, '');
  return result;
}

class _PassiveDetailState extends State<PassiveDetail> {
  static const secondaryBgColor = Color(0xff23364C);
  static const secondaryColor = Color(0xffC4943D);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: const BorderSide(color: secondaryColor, width: 2.0),
      ),
      backgroundColor: secondaryBgColor,
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.network(widget.passive.imageUrl!, width: 50),
          ),
          SizedBox(
            width: 150,
            child: Text(
              softWrap: true,
              maxLines: 2,
              widget.passive.nom,
              style: const TextStyle(color: Colors.white),
            ),
          )
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
              Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    removeBalise(widget.passive.description),
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ))
            ],
          ))),
    );
  }
}
