import 'package:flutter/material.dart';
import 'package:requests/requests.dart';
import 'dart:convert';
import 'package:sorozatokfulladasig/oldalak/regisztracio.dart';

String ip = 'http://127.0.0.1/login:5000';
String jelszo;
String email;
var allas;
var user;
var token;
var sbe;

class bejelentkezes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[800],
        title: const Text('Bejelentkezés'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          const SingleChildScrollView(),
          RegisterForm(),
          ],
            )
          );
  }
}
class RegisterForm extends StatefulWidget {
  const RegisterForm({Key key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _agreedToTOS = true;

  var allas='';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              validator: (String value) {
                if (value
                    .trim()
                    .isEmpty) {
                  return 'Kötelező az email cím megadása!';
                }
                email = value;
              },

            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Jelszó',
              ),
              validator: (String value) {
                if (value
                    .trim()
                    .isEmpty) {
                  return 'Kötelező a jelszó megadása!';
                }
                jelszo = value;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                children: <Widget>[
                  Checkbox(
                    value: _agreedToTOS,
                    onChanged: _setAgreedToTOS,
                  ),
                  GestureDetector(
                    onTap: () => _setAgreedToTOS(!_agreedToTOS),
                    child: const Text(
                      'Elfogadom a felhasználási feltételeket.',
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                const Spacer(),
                OutlineButton(
                  highlightedBorderColor: Colors.black,
                  onPressed: _submittable() ? _submit : null,
                  child: const Text('Bejelentkezés'),
                ),
                RaisedButton(
                    child: Text('Regisztráció'),
                    onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => regisztracio()),
                      );
                    }),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10,10,10,10),
                        child: Text('$allas'),
                      ),

    ],
    ),
              ],
              ),

    ),
      );

  }

  bool _submittable() {
    return _agreedToTOS;
  }

  String valaszeretmezes(valasz) {
    if (valasz == 'BadLogin') {
      setState(() {
        allas = 'Valamit rosszúl írtál be!';
      });

      user='';
      token='';
    }
    else {
      Map<String, dynamic> json = jsonDecode(valasz);
      user= json['username'];
      token = json['token'];
      setState(() {
        allas='Sikeres bejelentkezés';
      });

      sbe = true;
      print(user+token);
    }


    }
  void _submit() {
    _formKey.currentState.validate();
    print(email + jelszo);
    post() async {
      var r = await Requests.post(
          'http://192.168.0.105/login',
          body: {
            "password": jelszo,
            "email": email,
          },
          bodyEncoding: RequestBodyEncoding.FormURLEncoded);
      print(r.content());
      valaszeretmezes(r.content());
  }
  post();
  }
  void _setAgreedToTOS(bool newValue) {
    setState(() {
      _agreedToTOS = newValue;
    });
  }


}

