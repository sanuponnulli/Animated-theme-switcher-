import 'dart:math' as math;

import 'package:animatedlogin/main.dart';
import 'package:animatedlogin/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

Color kblack = Colors.black;
const Color kwhite = Colors.white;
const Color kfire = Color.fromARGB(255, 255, 87, 15);

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controller2;

  @override
  void initState() {
    // TODO: implement initState

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _controller2 = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _controller2.forward();
    _controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _controller.dispose();
    super.dispose();
  }

  InputDecoration buildInputDecoration(String hintText) {
    Brightness brightness = Theme.of(context).brightness;
    Color borderColor =
        brightness == Brightness.dark ? Colors.white : Colors.grey;
    Color hintColor =
        brightness == Brightness.dark ? Colors.white : Colors.grey;
    Color fillColor = brightness == Brightness.dark
        ? const Color.fromARGB(255, 5, 9, 59)
        : Colors.white12;

    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(
        color: Colors.white60,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      filled: true,
      fillColor: fillColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          AnimatedSwitcher(
            duration: const Duration(seconds: 1),
            child: Theme.of(context).brightness == Brightness.dark
                ? IconButton(
                    onPressed: () {
                      _controller.forward();
                      _controller2.forward();
                      final value =
                          Theme.of(context).brightness == Brightness.light;
                      setState(() {
                        // Change the brightness based on the switch value
                        MyApp.of(context)!.changeTheme(
                            value ? ThemeMode.dark : ThemeMode.light);
                      });
                    },
                    icon: Transform.rotate(
                      angle: math.pi / -5,
                      child: const Icon(
                        Icons.nightlight_round_outlined,
                        color: kfire,
                      ),
                    ))
                : IconButton(
                    onPressed: () {
                      _controller.reverse();
                      _controller2.reverse();
                      final value =
                          Theme.of(context).brightness == Brightness.light;
                      setState(() {
                        // Change the brightness based on the switch value
                        MyApp.of(context)!.changeTheme(
                            value ? ThemeMode.dark : ThemeMode.light);
                      });
                    },
                    icon: const Icon(
                      Icons.light_mode,
                      color: kfire,
                    )),
          ),
        ],
      ),
      body: Stack(
        children: [
          const GradientBackground(),
          Animate(
              controller: _controller,
              effects: Theme.of(context).brightness == Brightness.light
                  ? [
                      // FadeEffect(begin: 1, end: 1.0),
                      const SlideEffect(
                          curve: Curves.easeInOut,
                          begin: Offset(0, 0),
                          end: Offset(.9, 0),
                          duration: Duration(seconds: 1)),
                      const SlideEffect(
                          curve: Curves.easeInCirc,
                          begin: Offset(0, 0),
                          end: Offset(0, .9),
                          duration: Duration(seconds: 1))
                    ]
                  : [
                      // FadeEffect(begin: 1, end: 1.0),
                      const SlideEffect(
                          curve: Curves.easeInOut,
                          begin: Offset(0, 0),
                          end: Offset(-.9, 0),
                          duration: Duration(seconds: 1)),
                      const SlideEffect(
                          curve: Curves.easeInCirc,
                          begin: Offset(0, 0),
                          end: Offset(0, .9),
                          duration: Duration(seconds: 1))
                    ],
              child: Align(
                alignment: Alignment.topCenter,
                child:

                    ///moon container
                    CrescentMoonContainer(
                  color: Colors.grey[300]!,
                ),

                ///
              )),
          StarWidget(controller: _controller),
          SizedBox(
            height: 150,
            width: double.maxFinite,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: const Icon(
                    Icons.star,
                    color: Color.fromARGB(255, 255, 255, 255),
                    size: 15,
                  ).animate(controller: _controller2).scaleXY(
                        begin: 1.0,
                        end: 0.1,
                      ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: const Icon(
                    Icons.star,
                    color: Color.fromARGB(255, 255, 255, 255),
                    size: 15,
                  ).animate(controller: _controller2).scaleXY(
                        begin: 1.0,
                        end: 0.1,
                      ),
                ),
                Align(
                  alignment: const Alignment(-.34, 2),
                  child: const Icon(
                    Icons.star,
                    color: Color.fromARGB(255, 255, 255, 255),
                    size: 15,
                  ).animate(controller: _controller2).scaleXY(
                        begin: 1.0,
                        end: 0.1,
                      ),
                ),
              ],
            ),
          ),
          CloudWidget(controller2: _controller2),
          Visibility(
            visible: true,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18.0),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Sign',
                                style: TextStyle(
                                  // fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: kfire,
                                ),
                              ),
                              TextSpan(
                                text: 'Up',
                                style: TextStyle(
                                  // fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? kwhite
                                      : Colors.black,
                                ),
                              )
                            ],
                            style: const TextStyle(
                              fontSize: 33,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextField(
                    decoration: buildInputDecoration("Username"),
                  ).animate().fadeIn(
                        begin: 0.0,
                      ),
                  const SizedBox(height: 16.0),
                  TextField(
                    decoration: buildInputDecoration("Email"),
                  ).animate().fadeIn(
                        begin: 0.0,
                      ),
                  const SizedBox(height: 16.0),
                  TextField(
                    decoration: buildInputDecoration("Password"),
                    obscureText: true,
                  ).animate().fadeIn(
                        begin: 0.0,
                      ),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(kfire)),
                      onPressed: () {
                        // Perform signup logic here
                      },
                      child: const Text('Sign Up'),
                    ),
                  )
                      .animate()
                      .fadeIn(
                        begin: 0.0,
                      )
                      .slideY(
                        begin: 0.5,
                        duration: const Duration(seconds: 1),
                      ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
