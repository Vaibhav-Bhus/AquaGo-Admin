import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddNewStore extends StatefulWidget {
  const AddNewStore({super.key});

  @override
  State<AddNewStore> createState() => _AddNewStoreState();
}

class _AddNewStoreState extends State<AddNewStore> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserCredential? userCredential;
  void signUp(String email, String password) async {
    userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await FirebaseFirestore.instance
        .collection("Stores")
        .doc(userCredential!.user!.uid)
        .set({
      "isFormFilled": false,
      'uId': userCredential!.user!.uid,
      "mob": mobController.text.trim(),
      "name": nameController.text.trim(),
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                width: 320,
                height: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    gradient: const LinearGradient(
                        colors: [Color(0xFFE8ECFD), Color(0xFF8898E3)])),
                child: TextFormField(
                  controller: nameController,
                  textDirection: TextDirection.ltr,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "  Store Name",
                    fillColor: Colors.transparent,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                width: 320,
                height: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    gradient: const LinearGradient(
                        colors: [Color(0xFFE8ECFD), Color(0xFF8898E3)])),
                child: TextFormField(
                  controller: mobController,
                  textDirection: TextDirection.ltr,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "  Mobile Number",
                    fillColor: Colors.transparent,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                width: 320,
                height: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    gradient: const LinearGradient(
                        colors: [Color(0xFFE8ECFD), Color(0xFF8898E3)])),
                child: TextFormField(
                  controller: emailController,
                  textDirection: TextDirection.ltr,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "  Email",
                    fillColor: Colors.transparent,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                width: 320,
                height: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    gradient: const LinearGradient(
                        colors: [Color(0xFFE8ECFD), Color(0xFF8898E3)])),
                child: TextFormField(
                  controller: passwordController,
                  textDirection: TextDirection.ltr,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "  Password",
                    fillColor: Colors.transparent,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  try {
                    signUp(emailController.text.trim(),
                        passwordController.text.trim());
                    //print('hereeeeeeeeeeeeeeeeee');

                    //print('thereeeeeee');
                  } catch (e) {
                    //print(e.toString());
                  }
                },
                child: Container(
                  width: 170,
                  height: 48,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      gradient: const LinearGradient(
                          colors: [
                            Color(0xFF283855),
                            Color(0xFF2E3F68),
                            Color(0xFF3B5197)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter)),
                  child: const Text("SignUp",
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
