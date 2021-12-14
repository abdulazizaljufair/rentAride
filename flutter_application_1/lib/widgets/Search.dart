import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/users.dart';

class name extends StatefulWidget {
  @override
  _nameState createState() => _nameState();
}

class _nameState extends State<name> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class customSearch extends SearchDelegate {
  CollectionReference search =
      FirebaseFirestore.instance.collection('Listed Cars');

  List<String> searchTearms = ['apple', 'car'];
  FetchDatabaseListPending() async {
    try {
      await search.get().then((QuerySnapshot) {
        QuerySnapshot.docs.forEach((element) {
          searchTearms.add(element.data());
        });
      });
      return searchTearms;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return (IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    ));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var cars in searchTearms) {
      if (cars.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(cars);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var cars in searchTearms) {
      if (cars.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(cars);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
