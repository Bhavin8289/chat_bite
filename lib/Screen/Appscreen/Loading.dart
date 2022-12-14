import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  TextEditingController fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: const [
                Image(
                  image: AssetImage('assets/Gif/Loading.gif'),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: TextField(
                controller: fullNameController,
                decoration: const InputDecoration(
                  hintText: 'Add Your Intress (Optional)',
                  // labelText: 'Add Your Intress',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text("Add"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
