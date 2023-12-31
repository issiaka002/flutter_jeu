import 'package:flutter/material.dart';
import 'page2.dart';

class Page11 extends StatefulWidget {
  const Page11({Key? key}) : super(key: key);

  @override
  _Page11State createState() => _Page11State();
}

class _Page11State extends State<Page11> {
  bool showNotification = false;
  bool isWinner = false;
  String title = 'Mon niveau 1';
  String image = 'assets/images/and.png';
  String bulbImage = 'assets/images/lightoff.png';
  int button1Value = 0;
  int button2Value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                    showNotification = false;
                    isWinner = false;
                  });
                },
                child: Image.asset(
                  showNotification && isWinner
                      ? 'assets/images/lighton.png'
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
                    onPressed: (!showNotification)
                        ? () {
                            setState(() {
                              button1Value = (button1Value == 1) ? 0 : 1;
                              checkWin();
                            });
                          }
                        : () {},
                    style: ElevatedButton.styleFrom(
                      primary: (button1Value == 1) ? Colors.grey : null,
                      side: const BorderSide(width: 1, color: Colors.transparent),
                    ),
                    child: Text('$button1Value'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: (!showNotification)
                        ? () {
                            setState(() {
                              button2Value = (button2Value == 1) ? 0 : 1;
                              checkWin();
                            });
                          }
                        : () {},
                    style: ElevatedButton.styleFrom(
                      primary: (button2Value == 1) ? Colors.grey : null,
                    ),
                    child: Text('$button2Value'),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 20,
            child: Visibility(
              visible: showNotification,
              child: Container(
                padding: const EdgeInsets.all(16),
                color: isWinner ? Colors.green : Colors.red,
                width: MediaQuery.of(context).size.width,
                child: Text(
                  isWinner ? 'Félicitations !' : 'Dommage...',
                  style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
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
                backgroundColor: const Color(0xFFCC0CED),
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

  void checkWin() {
    if (button1Value == 1 && button2Value == 1) {
      setState(() {
        showNotification = true;
        isWinner = true;
      });
    } else if (isWinner) {
      setState(() {
        showNotification = true;
        isWinner = false;
      });
    }
  }
}