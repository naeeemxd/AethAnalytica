import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: DisplayPage(),
  ));
}

class DisplayPage extends StatefulWidget {
  const DisplayPage({Key? key}) : super(key: key);

  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  String _name = '';
  String _designation = '';
  String _mobile = '';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('name') ?? '';
      _designation = prefs.getString('designation') ?? '';
      _mobile = prefs.getString('mobile') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Padding(
          padding: const EdgeInsets.only(right: 45.0),
          child: const Text('User Information', style: TextStyle(fontWeight: FontWeight.bold),),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Name: $_name'),
              const SizedBox(height: 16),
              Text('Designation: $_designation'),
              const SizedBox(height: 16),
              Text('Mobile Number: $_mobile'),
            ],
          ),
        ),
      ),
    );
  }
}
