import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ListTimePage extends StatefulWidget {
  const ListTimePage({super.key});

  @override
  State<ListTimePage> createState() => _ListTimePageState();
}

class _ListTimePageState extends State<ListTimePage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TabBar(
          controller: controller,
          labelColor: Colors.deepPurple,
          unselectedLabelColor: Colors.deepPurple,
          tabs: const <Widget>[
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.person_add)),
            Tab(icon: Icon(Icons.notifications)),
            Tab(icon: Icon(Icons.clear_all)),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: const <Widget>[
          HomePage(),
          HomePage(),
          HomePage(),
          HomePage(),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        itemBuilder: (context, index) => Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0)),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 55.0,
                        height: 55.0,
                        color: Colors.green,
                        child: const CircleAvatar(
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.deepPurple,
                          backgroundImage: NetworkImage(
                              "https://cdn.pixabay.com/photo/2016/02/11/16/59/dog-1194083_640.jpg"),
                        ),
                      ),
                      const SizedBox(width: 5.0),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Darlison Alves"),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
