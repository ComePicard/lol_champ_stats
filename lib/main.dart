import 'package:flutter/material.dart';
import 'package:lol_champ_stats/services/json_service.dart';
import 'package:lol_champ_stats/template/champion.dart';
import 'package:lol_champ_stats/widget/champion_light.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LoL Champions Stats',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'FrizQuadrata'),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const bgColor = Color(0xff242424);
  static const appbarBgColor = Color(0xff23364C);
  static const secondaryColor = Color(0xffC4943D);

  late Future<List<Widget>> _myList;

  Future<List<Widget>> _listeChampion() async {
    List<String> championNameList = await JsonService.getListeChampion();
    List<Champion> championDetailList = [];
    List<Widget> championWidget = [];

    championNameList.forEach((champion) async {
      var champDetail = await JsonService.getChampionData(champion);
      championDetailList.add(champDetail);
      championWidget.add(ChampionLight(champion: champDetail));
    });

    return championWidget;
  }

  @override
  void initState() {
    super.initState();
    _myList = _listeChampion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
            backgroundColor: appbarBgColor,
            title: TextField(
              style: const TextStyle(fontSize: 20.0, color: secondaryColor),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide:
                      const BorderSide(color: secondaryColor, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide:
                      const BorderSide(color: secondaryColor, width: 2.0),
                ),
                hintText: "Search a champion",
                hintStyle: const TextStyle(color: secondaryColor),
                filled: false,
                suffixIcon: const Icon(Icons.search, color: secondaryColor),
              ),
            )),
        body: FutureBuilder(
            future: _myList,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return ListView(children: snapshot.data!);
              }
            }));
  }
}
