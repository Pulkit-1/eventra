import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Eventera'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
                width: 250,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue.shade400, // background
                      onPrimary: Colors.white,
                      elevation: 5,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10))) // foreground
                      ),
                  onPressed: () {},
                  child: Text('Add Club Admin'),
                ),
              ),
              SizedBox(
                height: 160,
              ),
              SizedBox(
                width: 250,
                height: 80,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue.shade400, // background
                      onPrimary: Colors.white,
                      elevation: 5,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))
                      // foreground
                      ),
                  onPressed: () {},
                  child: Text('Add Admin'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
