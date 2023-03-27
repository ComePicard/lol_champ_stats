import 'package:flutter/material.dart';

class ChampList extends StatefulWidget {
  const ChampList({super.key, required this.title});

  final String title;

  @override
  State<ChampList> createState() => _ChampList();
}

class _ChampList extends State<ChampList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff242424),
        appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color(0xff23364C),
            title: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: TextField(
                  style:
                      const TextStyle(fontSize: 20.0, color: Color(0xffC4943D)),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: const BorderSide(
                          color: Color(0xffC4943D), width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: const BorderSide(
                          color: Color(0xffC4943D), width: 2.0),
                    ),
                    hintText: "Search a champion",
                    hintStyle: const TextStyle(color: Color(0xffC4943D)),
                    filled: false,
                    suffixIcon:
                        const Icon(Icons.search, color: Color(0xffC4943D)),
                  ),
                ))),
        body: ListView(children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Column(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.ideographic,
                children: const <Widget>[
                  Padding(
                    padding: (EdgeInsets.only(left: 15, bottom: 8, top: 8)),
                    child: Text(
                      "Aatrox",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                  Padding(
                    padding: (EdgeInsets.only(left: 15, bottom: 8, top: 8)),
                    child: Text(
                      "The Darkin Blade",
                      style: TextStyle(color: Color(0xffC4943D), fontSize: 18),
                    ),
                  ),
                ]),
            Expanded(child: Container()),
            const Padding(
                padding: (EdgeInsets.only(right: 15, bottom: 8, top: 8)),
                child: Image(
                    image: AssetImage('assets/aatrox.png'),
                    width: 90,
                    height: 90))
          ]
              // floatingActionButton: FloatingActionButton(
              //   onPressed: ,
              //   tooltip: 'Increment',
              //   child: const Icon(Icons.add),
              // ),
              )
        ]));
  }
}
