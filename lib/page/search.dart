import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:specialist/cases/Autism.dart';
import 'package:specialist/cases/downs_syndrome.dart';
import 'package:specialist/cases/hearing_disability.dart';
import 'package:specialist/cases/learning_difficulties.dart';
import 'package:specialist/cases/physical_disability.dart';
import 'package:specialist/cases/speech_difficulties.dart';
import 'package:specialist/cases/visual_disability.dart';
import 'package:specialist/constants/Constants.dart';
import 'package:specialist/model/Users.dart';
import 'package:specialist/services/AuthServices.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<SpecialistCard> specialistCards = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder(
          stream:
              userReference.where('type', isEqualTo: 'specialist').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Container(
                height: 10,
                width: 10,
                color: Colors.white,
              );
            }
            allSpecialists.clear();
            specialistCards.clear();
            for (var specialist in snapshot.data!.docs) {
              allSpecialists.add(UserModel.fromDoc(specialist));
            }
            for (UserModel specialist in allSpecialists) {
              specialistCards.add(SpecialistCard(specialist: specialist));
            }
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal[600],
                centerTitle: true,
                elevation: 0.0,
                title: const Text(
                  'بحث عن مختص',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        showSearch(context: context, delegate: CustomSearch());
                      },
                      icon: const Icon(Icons.search))
                ],
              ),
              body: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff00897b),
                      Color(0xff80cbc4),
                    ],
                  ),
                ),
                child: SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: specialistCards,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class SpecialistCard extends StatelessWidget {
  const SpecialistCard({
    required this.specialist,
    Key? key,
  }) : super(key: key);
  final UserModel specialist;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        color: const Color(0xffe5e5e5),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(specialist.firstName + " " + specialist.lastName,
                    style: TextStyle(fontSize: 18)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(specialist.major, style: TextStyle(fontSize: 15)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
                child: Text(
                  specialist.phoneNO,
                  style: TextStyle(fontSize: 17),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<UserModel> allSpecialists = [];

class CustomSearch extends SearchDelegate {
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
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<UserModel> machQuery = [];
    for (var item in allSpecialists) {
      if ((item.firstName + " " + item.lastName)
          .toLowerCase()
          .contains(query.toLowerCase())) machQuery.add(item);
    }
    return machQuery.isEmpty
        ? const Center(
            child: Text(
            "no result",
            style: TextStyle(fontSize: 18),
          ))
        : ListView.builder(
            itemCount: machQuery.length,
            itemBuilder: (context, index) {
              UserModel? result;
              if (machQuery.isNotEmpty) result = machQuery[index];

              return ListTile(
                title: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SafeArea(
                              child: result!.major == 'التوحد'
                                  ? const Autism()
                                  : result.major == 'إعاقة بصرية'
                                      ? const VisualDisability()
                                      : result.major == 'إعاقة سمعية'
                                          ? const HearingDisability()
                                          : result.major == 'إعاقة جسدية'
                                              ? const PhysicalDisability()
                                              : result.major == 'متلازمة داون'
                                                  ? const DownsSyndrome()
                                                  : result.major ==
                                                          'صعوبات التعلم'
                                                      ? const LearningDifficulties()
                                                      : const SpeechDifficlties()),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(result!.firstName + " " + result.lastName),
                        Text(result.phoneNO)
                      ],
                    )),
              );
            },
          );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<UserModel> machQuery = [];
    for (var item in allSpecialists) {
      if ((item.firstName + " " + item.lastName)
          .toLowerCase()
          .contains(query.toLowerCase())) machQuery.add(item);
    }
    return machQuery.isEmpty
        ? const Center(
            child: Text(
            "no result",
            style: TextStyle(fontSize: 18),
          ))
        : ListView.builder(
            itemCount: machQuery.length,
            itemBuilder: (context, index) {
              UserModel? result;
              if (machQuery.isNotEmpty) result = machQuery[index];

              return ListTile(
                title: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SafeArea(
                              child: result!.major == 'التوحد'
                                  ? const Autism()
                                  : result.major == 'إعاقة بصرية'
                                      ? const VisualDisability()
                                      : result.major == 'إعاقة سمعية'
                                          ? const HearingDisability()
                                          : result.major == 'إعاقة جسدية'
                                              ? const PhysicalDisability()
                                              : result.major == 'متلازمة داون'
                                                  ? const DownsSyndrome()
                                                  : result.major ==
                                                          'صعوبات التعلم'
                                                      ? const LearningDifficulties()
                                                      : const SpeechDifficlties()),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(result!.firstName + " " + result.lastName),
                        Text(result.phoneNO)
                      ],
                    )),
              );
            },
          );
  }
}
