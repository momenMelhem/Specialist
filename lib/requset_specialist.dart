import 'package:flutter/material.dart';
import 'package:specialist/cases/Autism.dart';
import 'package:specialist/cases/hearing_disability.dart';
import 'package:specialist/cases/physical_disability.dart';
import 'package:specialist/cases/speech_difficulties.dart';
import 'package:specialist/cases/visual_disability.dart';

import 'cases/downs_syndrome.dart';
import 'cases/learning_difficulties.dart';

class RequestSpe extends StatelessWidget {
  const RequestSpe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal[900],
          centerTitle: true,
          title: const Text(
            'طلب مختص',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, right: 10.0, left: 10.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.teal[900],
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Autism(),
                          ));
                    },
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 1.0),
                          child: Image(
                            image: AssetImage('assets/images/autism.jpg'),
                            width: 100.0,
                            height: 100.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 180.0,
                        ),
                        Text(
                          'التوحد',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ), //done
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.teal[900],
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const VisualDisability(),
                          ));
                    },
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 1.0),
                          child: Image(
                            image: AssetImage('assets/images/visiual.jpg'),
                            width: 100.0,
                            height: 100.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 117.0,
                        ),
                        Text(
                          'إعاقة بصرية',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ), //done
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.teal[900],
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PhysicalDisability(),
                          ));
                    },
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 1.0),
                          child: Image(
                            image: AssetImage('assets/images/physical.jpg'),
                            width: 100.0,
                            height: 100.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 117.0,
                        ),
                        Text(
                          'إعاقه جسدية',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ), //done
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.teal[900],
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HearingDisability(),
                          ));
                    },
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 1.0),
                          child: Image(
                            image: AssetImage('assets/images/hearing.jpg'),
                            width: 100.0,
                            height: 100.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 120.0,
                        ),
                        Text(
                          'إعاقة سمعية',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ), //done
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.teal[900],
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LearningDifficulties(),
                          ));
                    },
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 1.0),
                          child: Image(
                            image: AssetImage('assets/images/learning.jpg'),
                            width: 100.0,
                            height: 100.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 107.0,
                        ),
                        Text(
                          'صعوبات التعلم',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ), //done
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.teal[900],
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SpeechDifficlties(),
                          ));
                    },
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 1.0),
                          child: Image(
                            image: AssetImage('assets/images/speech.jpg'),
                            width: 100.0,
                            height: 100.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 109.0,
                        ),
                        Text(
                          'صعوبات النطق',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ), //done
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.teal[900],
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DownsSyndrome(),
                          ));
                    },
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 1.0),
                          child: Image(
                            image: AssetImage('assets/images/downs.jpg'),
                            width: 100.0,
                            height: 100.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 130.0,
                        ),
                        Text(
                          'متلازمة داون',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ) //done
            ],
          ),
        ),
      ),
    );
  }
}
