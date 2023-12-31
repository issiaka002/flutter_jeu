import 'package:flutter/material.dart';
import 'package:jeu_sanoussi/pages/page3.dart';


class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  //..
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
        title: Text('Jeu : porte logique'),
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
                  ((button1Value == 1 && button2Value == 1) ||
                  (button1Value == 0 && button2Value == 0))
                      ? 'assets/images/light.png'
                      : 'assets/images/lightoff.png',
                  width: 160,
                  height: 160,

                ),
              ),
              const SizedBox(height: 22),
              Image.asset(
                'assets/images/or.png',
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
                  const SizedBox(width: 22),
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
                      primary: (button2Value == 1) ? Colors.grey : null,
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
                color: estGagnant ? const Color.fromARGB(255, 3, 194, 10) : const Color.fromARGB(255, 155, 12, 2),
                

                child: Text(
                  estGagnant ? 'Vous avez gagné !!!' : 'Perdu...!!!',
                  style: const TextStyle(fontSize: 20, color: Color.fromARGB(255, 247, 244, 244), fontWeight: FontWeight.bold),
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
                    builder: (context) => const Page3(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 133, 1, 156),
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
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  // FONCTIONS

  void win() {
  if ((button1Value == 1 && button2Value == 1) ||
      (button1Value == 0 && button2Value == 0)) {
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