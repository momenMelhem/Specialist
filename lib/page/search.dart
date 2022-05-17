import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal[900],
          title: Text(
            'بحث عن مختص',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: CustomSearch());
                },
                icon: Icon(Icons.search))
          ],
        ),
      ),
    );
  }
}

class CustomSearch extends SearchDelegate {
  List<String> allData = [
    'mmmaaa',
    'fffkks',
    'ddddd',
    'ffffffsss',
    'faswdc',
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> machQuery = [];
    for (var item in allData) {
      if (item.toLowerCase().contains(query.toLowerCase())) machQuery.add(item);
    }
    return ListView.builder(itemBuilder: (context, index) {
      var result = machQuery[index];

      return ListTile(
        title: Text(result),
      );
    });
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> machQuery = [];
    for (var item in allData) {
      if (item.toLowerCase().contains(query.toLowerCase())) machQuery.add(item);
    }
    return ListView.builder(itemBuilder: (context, index) {
      var result = machQuery[index];
      return ListTile(
        title: Text(result),
      );
    });
  }
}
