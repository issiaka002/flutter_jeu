import 'package:flutter/material.dart';
import 'page3.dart';

class Page22 extends StatefulWidget {
  const Page22({super.key});

  @override
  _Page22State createState() => _Page22State();
}

class _Page22State extends State<Page22> {
  //
  bool notif = false;
  bool estGagnant = false;
  String title = 'Second niveau';
  String image = 'assets/images/or.png';
  String bulbImage = 'assets/images/lightoff.png';
  int button1Value = 0;
  int button2Value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jeu : porte logique'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Image.asset(
            image,
            width: 200,
            height: 200,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Page3()),
              );
            },
            child: const Text('Suivant'),
          ),
        ],
      ),
    );
  }
}