import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sign In Page'),
          centerTitle: true,
        ),
        body: MyForm(),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _FormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _FormKey,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              decoration: InputDecoration(
                icon: Icon(
                  Icons.people,
                  color: Colors.blue,
                ),
                border: OutlineInputBorder(),
                labelText: 'Username',
                hintText: 'Enter Your Name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter Your Name';
                }
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              decoration: InputDecoration(
                icon: Icon(
                  Icons.lock,
                  color: Colors.blue,
                ),
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: "Enter Your Password",
              ),
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter Your Password';
                }
              },
            ),
          ),
          RaisedButton(
            onPressed: () {
              if (_FormKey.currentState!.validate()) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Processing Data')));
              }
            },
            color: Colors.blue,
            textColor: Colors.white,
            child: Text('Sign In'),
          ),
        ],
      ),
    );
  }
}
