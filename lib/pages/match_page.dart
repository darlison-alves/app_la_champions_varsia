import 'package:flutter/material.dart';
import 'package:la_champions_varsia/components/matchs/player_goals.dart';

class MatchPage extends StatefulWidget {
  const MatchPage({super.key});

  @override
  State<MatchPage> createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
  int homeGoals = 0;
  int visiteGoals = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Match game"),
      ),
      body: Column(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MatchPlayerInfo(
                  goals: homeGoals,
                  name: "Time 1",
                  onPressedAdd: () {
                    setState(() {
                      homeGoals += 1;
                    });
                  },
                  onPressedRemove: () {
                    setState(() {
                      homeGoals -= 1;
                    });
                  },
                ),
                //#####
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "vs",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                //#####
                MatchPlayerInfo(
                  goals: visiteGoals,
                  name: "Time 2",
                  onPressedAdd: () {
                    setState(() {
                      visiteGoals += 1;
                    });
                  },
                  onPressedRemove: () {
                    setState(() {
                      visiteGoals -= 1;
                    });
                  },
                )
              ],
            ),
          ),
          TextButton(onPressed: () {}, child: const Text("Finish"))
        ],
      ),
    );
  }
}
