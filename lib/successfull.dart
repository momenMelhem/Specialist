import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SuccMas extends StatelessWidget{
  const SuccMas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
      body:    SafeArea(
        child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [const Color(0xff00897b), const Color(0xff80cbc4)])),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    right: 45.0, left: 45.0, top: 170.0),
                child: Container(
                  height: 450.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35.0),
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 2)), //for the box
                  child:
                  Padding(padding:
                    const EdgeInsets.only(
                        right: 12.0, left: 12.0, bottom: 40.0, ),
                    child: Column(
                      children: [
                        Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          "Special",
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontWeight: FontWeight.bold,
                              fontSize: 50.0,
                              color: Colors.black),

                        ),
                      ), //for the word Special
                        SizedBox(
                          height: 100.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(' تم ارسال طلبك بنجاح الرجاء الإنتظار لحين تواصل المختص معك ',
                           textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black
                            ),),

                          SizedBox(
                                      height: 60.0,),
                            Container(

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      const Color(0xff004d40),
                                      const Color(0xff00897b),
                                    ],
                                  ),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  child: MaterialButton(

                                    onPressed: () {},
                                    child: Text(
                                      "موافق",
                                      style: TextStyle(
                                          color: Colors.white,
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                  ),
                                )
                            ),




                          ],

                          ),






                      ],

                    ),
                  ),

                  ),
                ),


            ],
          ),

    ),
      ),
    );
  }
}
