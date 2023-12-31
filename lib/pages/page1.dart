import 'package:flutter/material.dart';
import 'page2.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  //..
  bool notif = false;
  bool estGagnant = false;
  String title = 'Mon niveau 1';
  String image = 'assets/images/and.png';
  String bulbImage = 'assets/images/lightoff.png';
  int button1Value = 0;
  int button2Value = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text('Jeu porte logique'),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[
              const SizedBox(height: 160),
              GestureDetector(

                onTap: () {
                  setState(() {
                    button1Value = 0;
                    button2Value = 0;
                    notif = false;
                    estGagnant = false;
                  });
                },

                child: Image.asset(
                  notif && estGagnant
                      ? 'assets/images/light.png'
                      : 'assets/images/lightoff.png',
                  width: 160,
                  height: 160,
                ),

              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/and.png',
                width: 320,
                height: 200,
              ),
              const SizedBox(height: 23),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: (!notif)
                        ? () {
                            setState(() {
                              button1Value = (button1Value == 1) ? 0 : 1;
                              win();
                            });
                          }
                        : () {},
                    style: ElevatedButton.styleFrom(
                      primary: (button1Value == 1) ? Colors.grey : null,
                      side: const BorderSide(width: 1, color: Colors.transparent),
                    ),
                    child: Text('A:$button1Value'),
                  ),
                  const SizedBox(width: 20),

                  ElevatedButton(
                    onPressed: (!notif)
                        ? () {
                            setState(() {
                              button2Value = (button2Value == 1) ? 0 : 1;
                              win();
                            });
                          }
                        : () {},
                    style: ElevatedButton.styleFrom(
                      primary: (button2Value == 1) ? const Color.fromARGB(255, 93, 91, 91) : null,
                    ),
                    child: Text('B:$button2Value'),
                  ),
                ],
              ),
            ],
          ),

          Positioned(
            top: 20,
            child: Visibility(
              visible: notif,
              child: Container(
                padding: const EdgeInsets.all(16),
                color: estGagnant ? const Color.fromARGB(255, 2, 236, 10) : const Color.fromARGB(255, 83, 6, 1),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  estGagnant ? 'Vous avez gagné...!!!' : 'Dommage...!!!',
                  style: const TextStyle(fontSize: 20, color: Color.fromARGB(255, 221, 220, 220), fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 80,
            right: 75,
            
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Page2(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 143, 1, 168),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
              ),
              child: Container(
                alignment: Alignment.center,
                width: 40,
                height: 60,
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: const Text(
                  "=>",
                  style: TextStyle(color: Color.fromARGB(255, 237, 234, 234), fontSize: 22),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void win() {
    if (button1Value == 1 && button2Value == 1) {
      setState(() {
        notif = true;
        estGagnant = true;
      });
    } else if (estGagnant) {
      setState(() {
        notif = true;
        estGagnant = false;
      });
    }
  }
}