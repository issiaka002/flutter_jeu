import 'package:flutter/material.dart';
import 'package:jeu_sanoussi/pages/page7.dart';


class Page6 extends StatefulWidget {
  const Page6({Key? key}) : super(key: key);

  @override
  State<Page6> createState() => _Page6State();
}

class _Page6State extends State<Page6> {
  //..
  int button1Value = 0;
  int button2Value = 0;
  int button3Value = 0;
  String title = 'Mon niveau 6';
  String image = 'assets/images/and.png';
  String bulbImage = 'assets/images/lightoff.png';
  bool notif = false;
  bool estGagnant = false;
  int choixSelectionne = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Mon niveau 6',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
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
                  height: 120,

                ),
                ),

                const SizedBox(height: 18,),
                Image.asset(
                  'assets/images/xnor.png',
                  width: 200,
                  height: 230,
                ),
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          button1Value = (button1Value == 1) 
                          ? 0 : 1;
                          win();
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            return (button1Value == 1) 
                            ? Color.fromARGB(255, 141, 109, 109) 
                            : null;
                          },
                        ),
                      ),
                      child: Text('A:$button1Value'),
                    ),
                    const SizedBox(width: 18),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          button2Value = (button2Value == 1) 
                          ? 0 : 1;
                          win();
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            return (button2Value == 1) 
                            ? Color.fromARGB(255, 156, 130, 130) 
                            : null;
                          },
                        ),
                      ),
                      child: Text('B:$button2Value'),
                    ),
                    const SizedBox(width: 18),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          button3Value = (button3Value == 1) 
                          ? 0 : 1;
                          win();
                        });
                      },
                      style: ButtonStyle(

                        backgroundColor: MaterialStateProperty.resolveWith<Color?>(

                          (Set<MaterialState> states) {
                            return (button3Value == 1) 
                            ? Color.fromARGB(255, 132, 120, 120) 
                            : null;
                          },
                        ),
                      ),
                      child: Text('C:$button3Value'),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text(
                      'Choix de combinaisons :',
                      style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 7, 7, 7), fontWeight: FontWeight.w100),
                    ),
                    SizedBox(width: 7),
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    choice(7),
                    const SizedBox(width: 21),
                    choice(1),
                    const SizedBox(width: 21),
                    choice(3),
                  ],
                ),
                const SizedBox(height: 45),
                Positioned(
                  bottom: 60,
                  right: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Page7(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 3, 156, 100),
                      side: const BorderSide(width: 1, color: Colors.transparent),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      width: 36,
                      height: 50,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: const Text(
                        "=>",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),


          Positioned(
            top: 18,
            child: Visibility(
              visible: notif,
              child: Container(
                padding: const EdgeInsets.all(16),
                color: estGagnant ? const Color.fromARGB(255, 3, 216, 10) : const Color.fromARGB(255, 156, 12, 2),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  estGagnant ? 'Vous avez gagné...!!!' : 'Game over ...!!!',
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget choice(int NbrChoix) {
    return GestureDetector(
      onTap: () {
        setState(() {
          choixSelectionne = NbrChoix;
          win();
        });
      },
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: (choixSelectionne == NbrChoix) 
          ? Color.fromARGB(255, 2, 164, 2) 
          : Color.fromARGB(255, 144, 130, 130),
        ),
        child: Center(
          child: Text(
            '$NbrChoix',
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }

  void win() {
    if (estGagnant = (choixSelectionne == 1)) {
      setState(() {
        notif = true;
      });
    } else if (estGagnant = (choixSelectionne == 7)) {
      setState(() {
        notif = true;
        estGagnant = false;
      });
    } else if (estGagnant = (choixSelectionne == 3)) {
      setState(() {
        notif = true;
        estGagnant = false;
      });
    }
  }
}
