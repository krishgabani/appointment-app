import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pinput/pinput.dart';
import 'package:proj/screens/registration_screen/name.dart';

import 'background.dart';

class OTPScreen extends StatefulWidget {
  String? phoneNumber;

  OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final _scaffoldkey = GlobalKey<ScaffoldState>();
  String? _verificationCode;
  int? _resendToken;
  String? _pinEnteredByUser;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  int secondsRemaining = 30;
  bool enableResend = false;
  Timer? timer;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      widget.phoneNumber = ModalRoute.of(context)!.settings.arguments as String;
      verifiyphone();

      timer = Timer.periodic(const Duration(seconds: 1), (_) {
        if (secondsRemaining != 0) {
          setState(() {
            secondsRemaining--;
          });
        } else {
          setState(() {
            enableResend = true;
          });
        }
      });
    });
    print(secondsRemaining);
    super.initState();
  }

  final defaultPinTheme = PinTheme(
    width: 50,
    height: 50,
    textStyle: const TextStyle(
        fontSize: 20,
        // color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(10),
    ),
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return widget.phoneNumber == null
        ? const Scaffold(body: Center(child: CircularProgressIndicator()))
        : Scaffold(
            // backgroundColor: Colors.white,
            key: _scaffoldkey,
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              leading: const BackButton(
                  // color: Colors.black,
                  ),
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            resizeToAvoidBottomInset: false,
            body: Background(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: size.height * 0.1),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: const Text(
                        "OTP Verification",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2661FA),
                            fontSize: 30),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 40),
                      child: Center(
                        child: Text.rich(
                          textAlign: TextAlign.center,
                          TextSpan(
                              text: 'Please type the OTP sent to your phone ',
                              style: const TextStyle(fontSize: 18),
                              children: [
                                TextSpan(
                                  text: '\n+91 ${widget.phoneNumber}',
                                  style: const TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 18,
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 30.0, left: 30, right: 30, bottom: 1),
                      child: Pinput(
                          length: 6,
                          errorTextStyle: const TextStyle(
                              fontSize: 25.0, color: Colors.white),
                          focusNode: _pinPutFocusNode,
                          controller: _pinPutController,
                          submittedPinTheme: defaultPinTheme,
                          focusedPinTheme: defaultPinTheme,
                          followingPinTheme: defaultPinTheme,
                          pinAnimationType: PinAnimationType.fade,
                          onCompleted: (pin) async {
                            _pinEnteredByUser = pin;
                          }),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: GestureDetector(
                        onTap: () => {},
                        child: TextButton(
                          onPressed: enableResend ? _resendCode : null,
                          child: Text('Resend OTP ($secondsRemaining)'),
                        ),
                      ),
                    ),
                    // SizedBox(height: size.height * 0.05),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),
                      child: RaisedButton(
                        onPressed: verifyUser,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0)),
                        textColor: Colors.white,
                        padding: const EdgeInsets.all(0),
                        child: Container(
                          alignment: Alignment.center,
                          height: 50.0,
                          width: size.width * 0.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80.0),
                              gradient: const LinearGradient(colors: [
                                Color.fromARGB(255, 255, 136, 34),
                                Color.fromARGB(255, 255, 177, 41)
                              ])),
                          padding: const EdgeInsets.all(0),
                          child: const Text(
                            "VERIFY",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
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

  void verifiyphone() async {
    print('phoneNumber -');
    print(widget.phoneNumber);
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91${widget.phoneNumber}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) async {
          if (value.user != null) {
            print('User Logged In.');
          }
        });
      },
      verificationFailed: (FirebaseAuthException error) {
        print("error.message");
        print(error.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          _verificationCode = verificationId;
          _resendToken = resendToken;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          _verificationCode = verificationId;
        });
      },
      timeout: const Duration(seconds: 60),
      forceResendingToken: _resendToken,
    );
  }

  void verifyUser() async {
    try {
      await FirebaseAuth.instance
          .signInWithCredential(
        PhoneAuthProvider.credential(
          verificationId: _verificationCode ?? "",
          smsCode: _pinEnteredByUser ?? '',
        ),
      )
          .then((value) {
        if (value.user != null) {
          User userData = FirebaseAuth.instance.currentUser!;
          if (userData.displayName != null) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                'tab-screen', (Route<dynamic> route) => false);
          } else {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: ((context) => const Name())),
                (route) => false);
          }
        }
      });
    } catch (error) {
      print("INVALID-OTP");
      FocusScope.of(context).unfocus();
      _scaffoldkey.currentState?.showSnackBar(const SnackBar(
        content: Text('Invalid OTP!'),
      ));
    }
  }

  void _resendCode() {
    verifiyphone();
    if (mounted) {
      setState(() {
        secondsRemaining = 30;
        enableResend = false;
      });
    }
  }

  @override
  dispose() {
    timer!.cancel();
    super.dispose();
  }
}
