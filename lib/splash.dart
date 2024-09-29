import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:ui_hut/main_page.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.only(left: 10, top: 0),
          child: Image.asset(
            'assets/images/logo.png',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/images/splash1.png',
              width: 472,
              height: 378,
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
            Container(
              width: 300,
              margin: const EdgeInsets.only(top: 45),
              child: Text(
                'Find a Perfact Job Match',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w600,
                )),
              ),
            ),
            Container(
                width: 240,
                margin: const EdgeInsets.only(top: 5),
                child: Text(
                  'Finding your dream job is more easire and faster with JobHub',
                  textAlign: TextAlign.center,
                  textWidthBasis: TextWidthBasis.longestLine,
                  maxLines: 2,
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  )),
                )),
            Container(
              margin: const EdgeInsets.only(top: 40),
              width: 261,
              height: 54,
              child: ElevatedButton.icon(
                icon: Text(
                  'Let’s Get Started',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 16, height: 1.3, fontWeight: FontWeight.w400),
                  ),
                ),
                label: const Icon(Icons.arrow_forward),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Mainpage()));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(76, 166, 168, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
