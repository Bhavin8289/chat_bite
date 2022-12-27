import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  TextEditingController fullNameController = TextEditingController();

  Future<UserCredential> signInAnon() async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInAnonymously();

    log("Signed In $userCredential");

    return userCredential;
  }

  void SignOut() {
    firebaseAuth.signOut();
    log('Signout');
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
                image: AssetImage('assets/Gif/Loading.gif'),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: fullNameController,
                  decoration: InputDecoration(
                    hintText: 'Add Your Intrest',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
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
                    child: const Text("Start Chatting"),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
