import 'package:flutter/material.dart';
import 'package:lol_champ_stats/services/json_service.dart';
import 'package:lol_champ_stats/template/champion.dart';
import 'package:lol_champ_stats/widget/champion_light.dart';

void main() async {
  List<String> championNameList = await JsonService.getListeChampion();
  List<Champion> championDetailList = [];

  championNameList.forEach((champion) async {
    var champDetail = await JsonService.getChampionData(champion);
    championDetailList.add(champDetail);
  });

  runApp(const MyApp());
}

Future<List> listeChampion() async {
  List<String> championNameList = await JsonService.getListeChampion();
  List<Champion> championDetailList = [];
  print("Ode aux pastèques");

  championNameList.forEach((champion) async {
    var champDetail = await JsonService.getChampionData(champion);
    championDetailList.add(champDetail);
  });

  return championDetailList;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
  static const test_color = Color(0xff23364C);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff242424),
        appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color(0xff23364C),
            title: TextField(
              style: const TextStyle(fontSize: 20.0, color: Color(0xffC4943D)),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide:
                      const BorderSide(color: Color(0xffC4943D), width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide:
                      const BorderSide(color: Color(0xffC4943D), width: 2.0),
                ),
                hintText: "Search a champion",
                hintStyle: const TextStyle(color: Color(0xffC4943D)),
                filled: false,
                suffixIcon: const Icon(Icons.search, color: Color(0xffC4943D)),
              ),
            )),
        body: FutureBuilder(
            future: listeChampion(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return ChampionLight(champion: snapshot.data?[index]);
                    });
              }
            }));
  }
}
