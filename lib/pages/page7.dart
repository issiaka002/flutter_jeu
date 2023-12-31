import 'package:flutter/material.dart';


class Page7 extends StatefulWidget {
  const Page7({super.key});

  @override
  _Page7State createState() => _Page7State();
}

class _Page7State extends State<Page7> {
   //..
  bool notif = false;
  bool estGagnant = false;
  String title = 'FIN';
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
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Page2()),
              // );
            },
            child: const Text('?'),
          ),
        ],
      ),
    );
  }
}