import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal[900],
          centerTitle: true,
          title: Text(
            'Special',
            style: TextStyle(fontSize: 17.0, color: Colors.white),
          ),
        ),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                const Color(0xff00897b),
                const Color(0xff80cbc4),
              ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 350,
                height: 100,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          'حالة الطلب',
                        ),
                        content: Text('الرجاء الإنتظار لحين موافقه مختص'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, 'موافق');
                            },
                            child: Text(
                              'موافق',
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.blueAccent),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  child: Center(
                      child: Text(
                    'الطلبات',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        color: Colors.white),
                  )),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.teal.shade900),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 350,
                height: 100,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          'المواعيد',
                        ),
                        content: Text('الموعد القادم'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, 'موافق');
                            },
                            child: Text(
                              'موافق',
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.blueAccent),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  child: Center(
                      child: Text(
                    'المواعيد',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  )),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.teal.shade900),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
