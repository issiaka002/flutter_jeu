import 'package:flutter/material.dart';
import 'package:jeu_sanoussi/pages/page6.dart';



class Page5 extends StatefulWidget {
  const Page5({super.key});

  @override
  State<Page5> createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  //
  bool notif = false;
  bool estGagnant = false;
  String title = 'Mon niveau 5';
  String image = 'assets/images/or.png';
  String bulbImage = 'assets/images/lightoff.png';
  int button1Value = 0;
  int button2Value = 0;

  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jeu : porte logique')
      ),
      body: Stack(
        children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 150,),
                GestureDetector(
                onTap: () {
                  
                },
                child: Image.asset(
                  (button1Value == 1 || button2Value == 1) && !(button1Value == 1 && button2Value == 1)
                      ? 'assets/images/light.png'
                      : 'assets/images/lightoff.png',
                  width: 160,
                  height: 160,
                ),
              ),
              SizedBox(height: 50,),
              Image.asset(
                'assets/images/xor.png',
                width: 270,
                height: 190,
              ),
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
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                    ),
                    child: Text('$button1Value'),
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
              visible: notif,
              child: Container(
                padding: const EdgeInsets.all(16),
                color: estGagnant ? const Color.fromARGB(255, 3, 205, 9) : const Color.fromARGB(255, 229, 18, 3),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  estGagnant ? 'Vous avez gagné...!!!' : 'Perdu...!!!',
                  style: const TextStyle(fontSize: 20, color: Color.fromARGB(255, 236, 234, 234), fontWeight: FontWeight.bold),
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
                        builder: (context) => const Page6(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 94, 6, 166),
                    side: const BorderSide(width: 1, color: Colors.transparent),
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
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: const Text(
                      "=>",
                      style: TextStyle(color: Color.fromARGB(255, 245, 239, 239), fontSize: 22),
                    ),
                  ),
                ),
          ),
        ],
      )
    );
  }


  void win() {
    if ((button1Value == 1 || button2Value == 1) && !(button1Value == 1 && button2Value == 1)) {
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