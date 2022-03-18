import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text('Date de naissance'),
          ElevatedButton(
            onPressed: () async {
              DateTime? _newDate = await showDatePicker(
                context: context,
                initialDate: _dateTime,
                firstDate: DateTime(1800),
                lastDate: DateTime(30000),
              );
              if (_newDate != null) {
                setState(() {
                  _dateTime = _newDate;
                });
              }
            },
            child: const Text('Get date'),
          ),
          Text(
              'Tu as ${DateTime.now().year - _dateTime.year} ans \n et \n ${DateTime.now().day - _dateTime.day} jour(s), ${DateTime.now().second - _dateTime.second} seconde(s)'),
        ]),
      ),
    );
  }
}
