import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  int _val = 1;
  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _password = '';
  String _phoneNumber = '';
  DateTime _bDate = DateTime(2022, 5, 11);
  String _major = '';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildFirstName() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'الاسم الأول'),
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
    return TextFormField(
      keyboardType: TextInputType.name,
      maxLength: 10,
      decoration: const InputDecoration(labelText: 'العائلة'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'العائلة مطلوب';
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
      decoration: const InputDecoration(labelText: 'البريد الالتكروني'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'البريد الالكتروني مطلوب';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'الرجاء ادخال بريد الكتروني صالح';
        }

        return null;
      },
      onSaved: (value) {
        _email = value!;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'كلمة السر',
      ),
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'كلمة السر مطلوب';
        }

        return null;
      },
      onSaved: (value) {
        _password = value!;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'الهاتف'),
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
    );
  }

  Widget _buildMajor() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'الاختصاص'),
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'الاختصاص';
        }

        return null;
      },
      onSaved: (value) {
        _major = value!;
      },
    );
  }

  Widget _buildBDate() {
    return Container(
      child: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.teal[900],
            ),
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
      mainAxisAlignment: MainAxisAlignment.center,
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
              style: TextStyle(fontSize: 24),
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
              style: TextStyle(fontSize: 24),
            )
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          ': الجنس ',
          style: TextStyle(
            fontSize: 23,
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
                  _buildMajor(),
                  _buildBDate(),
                  _buildGender(),
                  const SizedBox(height: 70),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal[900],
                    ),
                    child: Text(
                      'تسليم',
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
