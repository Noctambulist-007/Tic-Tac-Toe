import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'HomePage.dart';
import 'package:avatar_glow/avatar_glow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartGame(),
    );
  }
}

class StartGame extends StatefulWidget {
  const StartGame({Key? key}) : super(key: key);

  @override
  StartGameState createState() => StartGameState();
}

class StartGameState extends State<StartGame>
    with SingleTickerProviderStateMixin {
  static var myNewFont = GoogleFonts.pressStart2p(
      textStyle: const TextStyle(color: Colors.black, letterSpacing: 3));
  static var myNewFontWhite = GoogleFonts.pressStart2p(
      textStyle: const TextStyle(color: Colors.white, letterSpacing: 3));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 120.0),
                  child: Text(
                    "TIC TAC TOE",
                    style: myNewFontWhite.copyWith(fontSize: 30),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: AvatarGlow(
                    duration: const Duration(seconds: 2),
                    glowColor: Colors.white,
                    repeat: true,
                    startDelay: const Duration(seconds: 1),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          style: BorderStyle.none,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[900],
                        radius: 80.0,
                        child: Container(
                          child: Image.asset(
                            'lib/images/tic_tac_toe.png',

                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: Text(
                    "HEAPIPHY",
                    style: myNewFontWhite.copyWith(fontSize: 20),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(child: const HomePage(),
                        type: PageTransitionType.bottomToTop),
                  );
                },
                child: Padding(
                  padding:
                  const EdgeInsets.only(left: 40, right: 40, bottom: 60),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      color: Colors.white,
                      child: Center(
                        child: Text(
                          'PLAY GAME',
                          style: myNewFont,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
