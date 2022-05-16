import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormScreenPa extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreenPa> {
  int _val = 1;
  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _password = '';
  String _phoneNumber = '';
  DateTime _bDate = DateTime(2022, 5, 11);
  String _major = '';
  String major='';
  List listMajor=['إعاقه سمعيه', 'إعاقه بصريه', 'التوحد', 'متلازمه داون', 'صعوبات النطق','صعوبات التعلم','إعاقه جسديه'];



  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildFirstName() {
    return
      TextFormField(
        decoration: const InputDecoration(
          labelText: 'الاسم الأول',
          labelStyle: TextStyle(
            fontSize: 12.0,
          ),
          prefixIcon: Icon(
            Icons.account_circle_outlined,
          ),
          border: OutlineInputBorder(),

        ),
        maxLength: 10,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'الاسم الاول مطلوب';
          }

          return null;
        },
        onSaved: (String? value) {
          _firstName = value!;
        },
      );
  }

  Widget _buildLastName() {
    return
      TextFormField(
        keyboardType: TextInputType.name,
        maxLength: 10,
        decoration: const InputDecoration(
          labelText: ' اسم العائلة ',
          labelStyle: TextStyle(
            fontSize: 12.0,
          ),
          prefixIcon: Icon(
            Icons.account_circle_outlined,
          ),
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'اسم العائلة مطلوب';
          }

          return null;
        },
        onSaved: (value) {
          _lastName = value!;
        },
      );
  }

  Widget _buildEmail() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'البريد الإلتكروني',
        labelStyle: TextStyle(
          fontSize: 12.0,
        ),
        border: OutlineInputBorder(),
        prefixIcon: Icon(
          Icons.email_outlined,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'البريد الإلكتروني مطلوب';
        }

        if (!RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'الرجاء إدخال بريد إلكتروني فعال';
        }

        return null;
      },
      onSaved: (value) {
        _email = value!;
      },
    );
  }

  Widget _buildPassword() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: TextFormField(
        decoration: const InputDecoration(
          labelText: 'كلمة السر',
          labelStyle: TextStyle(
            fontSize: 12.0,
          ),
          border: OutlineInputBorder(),
          prefixIcon: Icon(
            Icons.lock,
          ),
        ),
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'كلمة السر مطلوبه';
          }

          return null;
        },
        onSaved: (value) {
          _password = value!;
        },
      ),
    );
  }

  Widget _buildPhoneNumber() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: TextFormField(
        decoration: const InputDecoration(
          labelStyle: TextStyle(
            fontSize: 12.0,
          ),
          border: OutlineInputBorder(),
          prefixIcon:Icon(
            Icons.phone,
          ) ,
          labelText: 'رقم الهاتف',
        ),
        keyboardType: TextInputType.phone,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'رقم الهاتف مطلوب';
          }

          return null;
        },
        onSaved: (value) {
          _phoneNumber = value!;
        },
      ),
    );
  }


  // Widget _buildMajor() {   // 33333dddeeellllll
  //   return TextFormField(
  //     decoration: const InputDecoration(labelText: 'الاختصاص'),
  //     keyboardType: TextInputType.text,
  //     validator: (value) {
  //       if (value == null || value.isEmpty) {
  //         return 'الاختصاص';
  //       }
  //
  //       return null;
  //     },
  //     onSaved: (value) {
  //       _major = value!;
  //     },
  //   );
  // }

  Widget _buildBDate() {//تاريخ الميلاد
    return Container(
      child: Column(
        children: [
          TextButton(
            child: Text(
              'تاريخ الميلاد ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () async {
              DateTime? newDate = await showDatePicker(
                context: context,
                initialDate: _bDate,
                firstDate: DateTime(1900),
                lastDate: DateTime(2023),
              );
              if (newDate == null) return;
              setState(() => _bDate = newDate);
            },
          ),
          Text(
            '${_bDate.year}/${_bDate.month}/${_bDate.day}',
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildGender() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: <Widget>[
            Radio(
                value: 1,
                groupValue: _val,
                onChanged: (value) {
                  _val = value as int;
                  setState(() {});
                }),
            Text(
              'انثى',
              style: TextStyle(fontSize: 18.0,),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Radio(
                value: 2,
                groupValue: _val,
                onChanged: (value) {
                  _val = value as int;
                  setState(() {});
                }),
            Text(
              'ذكر',
              style: TextStyle(fontSize: 18.0,),
            )
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          ':الجنس ',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal[50],
        appBar: AppBar(
          title: const Text("انشاء حساب"),
          backgroundColor: Colors.teal[900],
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildFirstName(),
                  _buildLastName(),
                  _buildEmail(),
                  _buildPassword(),
                  _buildPhoneNumber(),
                  //_buildMajor(),
                  _buildBDate(),
                  _buildGender(),
                  const SizedBox(height: 30.0,),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.teal[900],
                      ),
                      child: Text(
                        'إنشاء حساب',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }

                        _formKey.currentState!.save();

                        print(_firstName);
                        print(_lastName);
                        print(_email);
                        print(_phoneNumber);
                        print(_password);
                        print(_major);
                        print(_bDate);

                        //Send to API
                      },
                    ),
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
