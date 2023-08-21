import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:torch_light/torch_light.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FlashScreen extends StatefulWidget {
  const FlashScreen({super.key});

  @override
  State<FlashScreen> createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> {
  bool isAvail = false;
  Color iconColor = Colors.red;
  bool isFlash = false;
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero, () async {
      bool isMobileHaveFlash = await TorchLight.isTorchAvailable();
      setState(() {
        isAvail = isMobileHaveFlash;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 228, 229, 235),
        appBar: AppBar(
          toolbarHeight: 100,
          title: Center(
            child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "Flash",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    TextSpan(
                      text: "light\n",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                        color: Colors.black45,
                      ),
                    ),
                    TextSpan(
                      text: "lighting up your life",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          color: Colors.black26,
                          letterSpacing: 1),
                    )
                  ],
                )),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          child: Column(children: [
            Expanded(
                flex: 8,
                child: Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Icon(
                        Icons.power_settings_new_rounded,
                        color: iconColor,
                        size: 100,
                      ),
                    ),
                    Container(
                      child: Center(
                        child: RotatedBox(
                          quarterTurns: 0,
                          child: SlidingSwitch(
                            value: false,
                            height: MediaQuery.of(context).size.height * .30,
                            onChanged: (bool value) {
                              print(value);
                            },
                            animationDuration:
                                const Duration(milliseconds: 100),
                            onTap: () {
                              try {
                                if (isAvail) {
                                  if (isFlash == false) {
                                    TorchLight.enableTorch();
                                    iconColor = Colors.green;
                                    isFlash = true;
                                    setState(() {});
                                  } else {
                                    TorchLight.disableTorch();
                                    iconColor = Colors.red;
                                    isFlash = false;
                                    setState(() {});
                                  }
                                } else {
                                  Fluttertoast.showToast(
                                      msg: "Torch is not available",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                }
                              } catch (e) {
                                print(e);
                              }
                            },
                            onDoubleTap: () {
                              try {
                                if (isAvail) {
                                  if (isFlash == false) {
                                    TorchLight.enableTorch();
                                    isFlash = true;
                                    iconColor = Colors.green;
                                    setState(() {});
                                  } else {
                                    TorchLight.disableTorch();
                                    isFlash = false;
                                    iconColor = Colors.red;
                                    setState(() {});
                                  }
                                } else {
                                  Fluttertoast.showToast(
                                      msg: "Torch is not available",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                }
                              } catch (e) {
                                print(e);
                              }
                            },
                            onSwipe: () {
                              try {
                                if (isAvail) {
                                  if (isFlash == false) {
                                    TorchLight.enableTorch();
                                    isFlash = true;
                                    iconColor = Colors.green;
                                    setState(() {});
                                  } else {
                                    TorchLight.disableTorch();
                                    isFlash = false;
                                    iconColor = Colors.red;
                                    setState(() {});
                                  }
                                } else {
                                  Fluttertoast.showToast(
                                      msg: "Torch is not available",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                }
                              } catch (e) {
                                print(e);
                              }
                            },
                            textOff: "OFF",
                            textOn: "ON",
                            colorOn: Colors.green,
                            colorOff: Colors.red,
                            background: Colors.black12,
                            buttonColor: const Color(0xfff7f5f7),
                            inactiveColor: const Color(0xff636f7b),
                          ),
                        ),
                      ),
                    ),
                  ],
                ))),
            Expanded(
              flex: 1,
              child: Container(
                child: Center(
                  child: RichText(
                      text: const TextSpan(children: [
                    TextSpan(
                        text: "Develop by Jeetu\n",
                        style: TextStyle(
                          letterSpacing: 2,
                          color: Colors.black26,
                        )),
                  ])),
                ),
              ),
            )
          ]),
        ));
  }
}
