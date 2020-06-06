import 'package:flutter/material.dart';

import './welcome.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _loginFormKey = GlobalKey<FormState>();

  final _formData = {
    "selectedProject": null,
    "id": '',
    "password": '',
    'rememberMe': false,
  };

  List<String> _projectsList = [
    "Project 1",
    "Project 2",
    "Project 3",
    "Project 4",
  ];

  var isProjectSelected;

  final Color primaryColor = Color(0xffb8382c);
  final Color secondaryColor = Color(0xff999999);

  void updateFormData(property, value) {
    setState(() {
      _formData[property] = value;
    });
  }

  submitForm() {
    if (!_loginFormKey.currentState.validate())
      return;
    else if (_formData['selectedProject'] == null) {
      setState(() {
        isProjectSelected = false;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WelcomePage(
            data: _formData,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginFormKey,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0.5,
                  color: secondaryColor,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter ID',
                  hintStyle: secondaryTextStyle,
                  contentPadding: EdgeInsets.all(15.0),
                  prefixIcon: Icon(
                    Icons.account_circle,
                    color: secondaryColor,
                  ),
                ),
                validator: (val) => val.isEmpty ? 'Please enter an ID' : null,
                onChanged: (val) => updateFormData('id', val),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0.5,
                  color: secondaryColor,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter Password',
                  hintStyle: secondaryTextStyle,
                  contentPadding: EdgeInsets.all(15.0),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: secondaryColor,
                  ),
                ),
                validator: (val) =>
                    val.isEmpty ? 'Please enter a password' : null,
                onChanged: (val) => updateFormData('password', val),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0.5,
                  color: secondaryColor,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              width: double.infinity,
              padding: _formData['selectedProject'] == null
                  ? EdgeInsets.only(
                      right: 12,
                    )
                  : EdgeInsets.only(
                      left: 16,
                      right: 12,
                    ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _formData['selectedProject'],
                  style: secondaryTextStyle,
                  hint: Container(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 11,
                        ),
                        Icon(
                          Icons.work,
                          color: secondaryColor,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "Select Project",
                          style: secondaryTextStyle,
                        ),
                      ],
                    ),
                  ),
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: secondaryColor,
                  ),
                  isExpanded: true,
                  items: _projectsList.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      child: Text(dropDownStringItem),
                      value: dropDownStringItem,
                    );
                  }).toList(),
                  onChanged: (String val) {
                    setState(() {
                      _formData['selectedProject'] = val;
                    });
                  },
                ),
              ),
            ),
            isProjectSelected == false
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      'Please select a project',
                      style: secondaryTextStyle.copyWith(color: Colors.red),
                    ),
                  )
                : SizedBox(),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        activeColor: primaryColor,
                        value: _formData['rememberMe'],
                        onChanged: (t) {
                          print(t);
                          setState(() {
                            _formData['rememberMe'] = !_formData['rememberMe'];
                          });
                        },
                      ),
                      Text(
                        'Remember Me',
                        style: TextStyle(
                          color: Color(0xff555555),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  FlatButton(
                    color: primaryColor,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    onPressed: submitForm,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'LOG IN',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.arrow_forward,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

const secondaryTextStyle = TextStyle(
  color: Color(0xff999999),
  fontSize: 14,
);
