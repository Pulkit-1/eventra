import 'package:eventra/Screens/structure.dart';

import 'package:eventra/Database/firebase.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
            create: (context) => context.read<AuthenticationService>().authStateChanges,
            initialData: null
            )
      ],
      child:MaterialApp( theme: ThemeData.light().copyWith(
          primaryColor: Colors.teal,
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: Colors.teal)),
      home: Nav(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    if(firebaseUser != null)
      {
        FirebaseFirestore store = FirebaseFirestore.instance;
        store.collection("Users").doc(firebaseUser.uid).get();
        return Text("Signed IN");
      }
    return Text("Not Signed IN");
    // return Container();
  }
}
