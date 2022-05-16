import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main_page.dart';
class Autism extends StatelessWidget {
  const Autism({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal[900],
          centerTitle: true,
          title: Text('إعاقة سمعية'),
        ),
        body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff00897b), Color(0xff80cbc4)])),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60.0, vertical: 50.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              'التوحد عبارة عن حالة ترتبط بنمو الدماغ وتؤثر على كيفية تمييز الشخص للأخريين والتعامل معهم على المستوى الاجتماعاي، مما يتسبب في حدوث مشكلات في التفاعل والتواصل الاجتماعي لذلك التعامل مع هذه الفئة امر صعب فينبغي أن يتدخل شخص مختص قادر على التعامل مع المصاب ويقدم له ما يحتاج من خلال برامج يعتمد على حالة المريض وبالتالي يصبح قادرا على التعامل مع المجتمع المحيط به ولاعتماد على الذات قدر الإمكان',
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35.0),
                                gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xff00796b),
                                      Color(0xff000000),
                                    ])),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35.0),
                                gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xff00796b),
                                      Color(0xff000000)
                                    ])),
                          ),
                          const SizedBox(
                            height: 20.0,
                          )
                        ],
                      ),
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(color: Colors.black, width: 2),
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 100.0,
                    vertical: 20,
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.teal[900],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: MaterialButton(
                      child: Text(
                        'طلب خدمة',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(
                              'تم إرسال طلبك',
                            ),
                            content: Text('الرجاء الإنتظار لحين موافقه مختص'),
                            actions: [
                              TextButton(
                                child: Text(
                                  'موافق',
                                  style: TextStyle(
                                      fontSize: 12.0, color: Colors.blueAccent),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MyStatefulWidget(),
                                      ));
                                },
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
