import 'package:flutter/material.dart';
import 'package:la_champions_varsia/components/teams/add_team.dart';
import 'package:la_champions_varsia/models/team_model.dart';

class ListTeamsPage extends StatefulWidget {
  const ListTeamsPage({super.key});

  @override
  State<ListTeamsPage> createState() => _ListTeamsPageState();
}

class _ListTeamsPageState extends State<ListTeamsPage> {
  List<TeamModel> teams = [
    TeamModel("2", "Alonso", false),
    TeamModel("4", "Thiago", false),
    TeamModel("6", "Darlison", false)
  ];

  List<TeamModel> selectedTeams = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Match game"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: teams.length,
              itemBuilder: (context, index) {
                return teamItem(teams[index].id, teams[index].name,
                    teams[index].isSelected, index);
              },
            ),
          ),
          TextButton(onPressed: () {}, child: const Text("start match"))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (builderContext) {
                return const AddTeam();
              });
        },
        backgroundColor: Colors.deepPurple,
        tooltip: "Increment",
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget teamItem(String id, String name, bool isSelected, int index) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.deepPurple,
        child: Icon(
          Icons.person_outline_outlined,
          color: Colors.white,
        ),
      ),
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(id),
      trailing: isSelected
          ? Icon(
              Icons.check_circle,
              color: Colors.deepPurple[700],
            )
          : const Icon(
              Icons.check_circle_outline,
              color: Colors.grey,
            ),
      onTap: () {
        setState(() {
          teams[index].isSelected = !teams[index].isSelected;
          if (teams[index].isSelected == true) {
            if (selectedTeams.length < 2) {
              selectedTeams.add(TeamModel(id, name, isSelected));
            }
          } else {
            selectedTeams.removeWhere((team) => team.id == teams[index].id);
          }
        });
      },
    );
  }
}
