import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NoUserFound extends StatefulWidget {
  const NoUserFound({super.key});

  @override
  State<NoUserFound> createState() => _NoUserFoundState();
}

class _NoUserFoundState extends State<NoUserFound> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential> signInAnon() async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInAnonymously();

    log("Signed In $userCredential");
    return userCredential;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 150,
              ),
              const Image(
                image: AssetImage('assets/Gif/NouserFound.gif'),
              ),
              const SizedBox(
                height: 50,
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "No Match Found !!",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Please Try To Search Again ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  signInAnon();
                },
                child: const Text("Search Again"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
