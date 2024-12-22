import 'package:flutter/material.dart';

class AddTeam extends StatelessWidget {
  const AddTeam({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        height: 200,
        child: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(),
            ],
          ),
        ),
      ),
    );
  }
}
