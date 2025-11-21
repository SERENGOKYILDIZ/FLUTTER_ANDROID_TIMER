import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  late Timer zamanlayici;
  int kalanSure = 10;

  @override
  Widget build(BuildContext context) {

    Future<void> timerCallBack(Timer timer) async {
      setState(() {
        if(kalanSure<1)
          {
            kalanSure = 10;
            zamanlayici.cancel();
            print("Zamanlayici bitti!!!");
          }
        else
          {
            kalanSure--;
          }
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text("Flutter Timer"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Kalan Süre: $kalanSure sn", style: TextStyle(fontSize: 30),),
            ElevatedButton(
              onPressed: (){
                print("Zamanlayici basladi!!!");
                zamanlayici = Timer.periodic(Duration(seconds: 1), timerCallBack);
                },
              child: Text("Başla"),
              ),
            ]
        ),
      ),
    );
  }
}
