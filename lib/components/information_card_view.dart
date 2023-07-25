import 'dart:math';
import 'package:demo_example/components/information_card_background.dart';
import 'package:demo_example/components/circle_view.dart';
import 'package:demo_example/utilities/colors.dart';
import 'package:flutter/material.dart';

class InformationCardView extends StatefulWidget {
  const InformationCardView({super.key});

  @override
  _InformationCardViewState createState() => _InformationCardViewState();
}

class _InformationCardViewState extends State<InformationCardView> {
  int imageNumber = 1;
  int randomNumber = 1;
  bool isShowingSheet = false;
  bool isButtonPressed = false;
  List<int> generatedNumbers = [];

  void randomImage() {
    if (generatedNumbers.length == 5) {
      generatedNumbers.clear();
    }

    int randomNumber;
    do {
      randomNumber = Random().nextInt(5) + 1;
    } while (generatedNumbers.contains(randomNumber));

    generatedNumbers.add(randomNumber);

    setState(() {
      imageNumber = randomNumber;
    });
  }

  List<String> animalDetails = [
    "Majestic and wise, the gentle elephant roams.",
    "Roar with the king of the savannah, the lion!",
    "Meet the adorable and bamboo-loving panda!",
    "Leap into adventure with the agile frog!",
    "Dive into the depths with colorful fish!",
  ];

  List<String> animals = [
    "Elephant",
    "Lion",
    "Panda",
    "Frog",
    "Fish",

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customLightGray,
      body: Center(
        child: SizedBox(
          width: 330,
          height: 570,
          child: Stack(
            children: [
              const InformationCardBackground(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  gradient: const LinearGradient(
                    colors: [
                      customDarkBlue,
                      customBlueLight,
                      customMediumBlue,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),

              // MARK: - HEADER

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          animals[imageNumber-1],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 52,
                            foreground: Paint()
                              ..shader = const LinearGradient(
                                colors: [
                                  customLightGray,
                                  Colors.white,
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ).createShader(const Rect.fromLTWH(0, 0, 1, 1)),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                     Padding(
                      padding: const EdgeInsets.only(bottom: 32.0),
                      child: Text(
                        animalDetails[imageNumber-1],
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // MARK: - MAIN CONTENT

              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  children: [
                    const Center(child: CircleView()),
                    Positioned.fill(
                      child: Image.asset(
                        "assets/image-$imageNumber.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),

              // MARK: - FOOTER


              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        randomImage();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        shadowColor: Colors.black.withOpacity(0.25),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        backgroundColor: Colors.white,
                      ),
                      child: const Text(
                        "Explore More",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
