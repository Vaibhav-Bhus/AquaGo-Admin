import 'package:admin/custom_toast.dart';
import 'package:admin/loader.dart';
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
  bool _loading = false;
  void signUp(String email, String password) async {
    userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await FirebaseFirestore.instance
        .collection("sellers")
        .doc(userCredential!.user!.uid)
        .set({
      "isFormFilled": false,
      "sellerEmail": emailController.text.trim(),
      'sellerUID': userCredential!.user!.uid,
      "phone": mobController.text.trim(),
      "sellerName": nameController.text.trim(),
      "password": passwordController.text.trim(),
    });
    _loading = false;
    print('abc');
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
                  setState(() {
                    _loading = true;
                  });
                  try {
                    signUp(emailController.text.trim(),
                        passwordController.text.trim());
                    customToast('New Store Added');
                  } catch (e) {
                    customToast('Something went Wrong....');
                    _loading = false;
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
                  child: _loading == false
                      ? const Text("SignUp",
                          style: TextStyle(fontSize: 18, color: Colors.white))
                      : buttonLoader,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
