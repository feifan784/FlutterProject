import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FormDemo'),
      ),
      body: Theme(
          data: Theme.of(context).copyWith(primaryColor: Colors.black45),
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [RegisterForm()],
            ),
          )),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
    );
  }
}

class TextFildDemo extends StatefulWidget {
  @override
  _TextFildDemoState createState() => _TextFildDemoState();
}

class _TextFildDemoState extends State<TextFildDemo> {
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(() {
      debugPrint('onchange_controller: ${textEditingController.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
//      onChanged: (value) {
//        debugPrint('onchange: $value');
//      },
      onSubmitted: (value) {
        debugPrint('onsubmit: $value');
      },
      decoration: InputDecoration(
          icon: Icon(Icons.subject),
          labelText: 'title',
          hintText: 'Enter the title',
//          border: InputBorder.none,
//          border: OutlineInputBorder()
          filled: true),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final registerFormKey = GlobalKey<FormState>();
  String userName, password;
  bool _autoValidate = false;

  void submitRegisterForm() {
    if (registerFormKey.currentState.validate()) {
      registerFormKey.currentState.save();
      debugPrint('userName: $userName');
      debugPrint('password: $password');

      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Register...')));
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  String validatorUserName(String value) {
    if (value.isEmpty) {
      return 'UserName is require.';
    }
    return null;
  }

  String validatorPassword(String value) {
    if (value.isEmpty) {
      return 'Password is require.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: registerFormKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Account', helperText: ''),
              onSaved: (value) {
                userName = value;
              },
              validator: validatorUserName,
              autovalidate: _autoValidate,
            ),
            TextFormField(
              obscureText: true,
              decoration:
                  InputDecoration(labelText: 'Password', helperText: ''),
              onSaved: (value) {
                password = value;
              },
              validator: validatorPassword,
              autovalidate: _autoValidate,
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  onPressed: submitRegisterForm),
            )
          ],
        ));
  }
}
