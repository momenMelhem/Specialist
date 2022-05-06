import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  String _name = '';
  String _email = '';
  String _password = '';
  String _firstName = '';
  String _phoneNumber = '';
  String _lastName = '';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildFirstName() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'الاسم الأول'),
      maxLength: 10,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String? value) {
        _name = value!;
      },
    );
  }

  Widget _buildLastName() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'العائلة'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'URL is Required';
        }

        return null;
      },
      onSaved: (value) {
        _firstName = value!;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'البريد الالتكروني'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
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
          return 'Password is Required';
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
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (value) {
        _firstName = value!;
      },
    );
  }

  Widget _buildCalories() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Calories'),
      keyboardType: TextInputType.number,
      validator: (value) {
        int? calories = int.tryParse(value!);

        if (calories == null || calories <= 0) {
          return 'Calories must be greater than 0';
        }

        return null;
      },
      onSaved: (value) {
        _lastName = value!;
      },
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
                  _buildCalories(),
                  const SizedBox(height: 100),
                  RaisedButton(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.teal[900],
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }

                      _formKey.currentState!.save();

                      print(_name);
                      print(_email);
                      print(_phoneNumber);
                      print(_firstName);
                      print(_password);
                      print(_lastName);

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
