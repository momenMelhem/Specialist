import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:specialist/Autism.dart';
import 'package:specialist/hearing_disability.dart';
import 'package:specialist/physical_disability.dart';
import 'package:specialist/speech_difficulties.dart';
import 'package:specialist/visual_disability.dart';

import 'downs_syndrome.dart';
import 'learning_difficulties.dart';
import 'PatientHomePage.dart';

class RequestSpe extends StatelessWidget {
  const RequestSpe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        backgroundColor: Colors.teal[900],
        centerTitle: true,
        title: Text(
          'طلب متخصص',
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
                          builder: (context) => Autism(),
                        ));
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 1.0),
                        child: Image(
                          image: NetworkImage(
                              'https://www.emaratalyoum.com/polopoly_fs/1.541793.1462522863!/image/image.jpg'),
                          width: 100.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 185.0,
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
            SizedBox(
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
                          builder: (context) => VisualDisability(),
                        ));
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 1.0),
                        child: Image(
                          image: NetworkImage(
                              'https://www.ruokn.com/wp-content/uploads/2019/07/%D8%B7%D8%B1%D9%8A%D9%82%D8%A9-%D8%A7%D9%84%D8%AA%D8%B9%D8%A7%D9%85%D9%84-%D9%85%D8%B9-%D8%A7%D9%84%D8%B7%D9%81%D9%84-%D8%B0%D9%88-%D8%A7%D9%84%D8%A5%D8%B9%D8%A7%D9%82%D8%A9-%D8%A7%D9%84%D8%A8%D8%B5%D8%B1%D9%8A%D8%A9-1.jpg'),
                          width: 100.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 120.0,
                      ),
                      Text(
                        'إعاقه بصرية',
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
            SizedBox(
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
                          builder: (context) => PhysicalDisability(),
                        ));
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 1.0),
                        child: Image(
                          image: NetworkImage(
                              'https://www.nessma.tv/uploads/news/bc488ad04cd5b9d20c31b1e41f46b28b81.jpg'),
                          width: 100.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 120.0,
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
            SizedBox(
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
                          builder: (context) => HearingDisability(),
                        ));
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 1.0),
                        child: Image(
                          image: NetworkImage(
                              'https://hyatoky.com/mwfiles/thumbs/fit630x300/16267/1618828224/%D8%B7%D8%B1%D9%82_%D8%AA%D8%AF%D8%B1%D9%8A%D8%B3_%D8%A7%D9%84%D9%85%D8%B9%D8%A7%D9%82%D9%8A%D9%86_%D8%B3%D9%85%D8%B9%D9%8A%D8%A7.jpeg'),
                          width: 100.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 120.0,
                      ),
                      Text(
                        'إعاقه سمعية',
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
            SizedBox(
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
                          builder: (context) => LearningDifficulties(),
                        ));
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 1.0),
                        child: Image(
                          image: NetworkImage(
                              'https://modo3.com/thumbs/fit630x300/71092/1448546054/%D9%83%D9%8A%D9%81_%D8%AA%D8%B9%D8%A7%D9%84%D8%AC_%D8%B5%D8%B9%D9%88%D8%A8%D8%A7%D8%AA_%D8%A7%D9%84%D8%AA%D8%B9%D9%84%D9%85.jpg'),
                          width: 100.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 110.0,
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
            SizedBox(
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
                          builder: (context) => SpeechDifficlties(),
                        ));
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 1.0),
                        child: Image(
                          image: NetworkImage(
                              'https://lh3.googleusercontent.com/3fi2IzN1rmPxel37L2CuEG7O6Y0RALnAzyGM4oG2pVtfpyYJogOr2m0JiAqM3ieUqEmJ1lBfsApgqdB3BtEpZc5PIR3I5Ll0bPYiBKOY-xf7npBSDzw5NGl_mhiEjKeDEm6iMiZz=w1200-h630-p-k-no-nu'),
                          width: 100.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 110.0,
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
            SizedBox(
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
                          builder: (context) => DownsSyndrome(),
                        ));
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 1.0),
                        child: Image(
                          image: NetworkImage(
                              'https://media.gemini.media/img/large/2018/3/20/2018_3_20_16_25_18_863.jpg'),
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
            ), //done
          ],
        ),
      ),
    );
  }
}
