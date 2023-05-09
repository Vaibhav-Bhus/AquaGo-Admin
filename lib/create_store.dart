// ignore_for_file: use_build_context_synchronously

import 'package:admin/custom_toast.dart';
import 'package:admin/error_dialog.dart';
import 'package:admin/loader.dart';
import 'package:admin/store_list.dart';
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
  TextEditingController waterType = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserCredential? userCredential;
  bool _loading = false;

  bool validateEmail(String email) {
    if (email.isEmpty) {
      return false;
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      return false;
    }

    return true;
  }

  Future<void> signUp(String email, String password) async {
    if (nameController.text.trim().isEmpty) {
      showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(
              message: "Please enter store name",
            );
          });
      setState(() {
        _loading = false;
      });
    } else if (waterType.text.trim().isEmpty) {
      showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(
              message: "Please enter water type",
            );
          });
      setState(() {
        _loading = false;
      });
    } else if (mobController.text.trim().length < 10 ||
        mobController.text.trim().length > 10) {
      showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(
              message: "Mobile number should be 10 digit",
            );
          });
      setState(() {
        _loading = false;
      });
    } else if ((email.isNotEmpty && !validateEmail(email)) || email.isEmpty) {
      showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(
              message: "Please enter valid email id",
            );
          });
      setState(() {
        _loading = false;
      });
    } else if (password.trim().length < 6) {
      showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(
              message: "Password should be minimum 6 characters",
            );
          });
      setState(() {
        _loading = false;
      });
    } else {
      try {
        userCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        await FirebaseFirestore.instance
            .collection("sellers")
            .doc(userCredential!.user!.uid)
            .set({
          "isRatesFilled": 'false',
          "isFormFilled": false,
          "sellerEmail": emailController.text.trim(),
          'sellerUID': userCredential!.user!.uid,
          "phone": mobController.text.trim(),
          "sellerName": nameController.text.trim(),
          "password": passwordController.text.trim(),
          "waterType": waterType.text.trim(),
          "userCreated":DateTime.now().toString(),
        });
        showDialog(
            context: context,
            builder: (c) {
              return ErrorDialog(
                message: "New store added.",
              );
            });
        setState(() {
          _loading = false;
        });
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => StoreList()),
            (Route<dynamic> route) => false);
      } catch (e) {
        showDialog(
            context: context,
            builder: (c) {
              return ErrorDialog(
                message: "Something went wrong",
              );
            });
      }
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF576CD6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 1,
        centerTitle: true,
        title: const Text(
          "Add New Store",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 20, 8, 10),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    width: double.infinity,
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
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    width: double.infinity,
                    height: 48,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        gradient: const LinearGradient(
                            colors: [Color(0xFFE8ECFD), Color(0xFF8898E3)])),
                    child: TextFormField(
                      controller: waterType,
                      textDirection: TextDirection.ltr,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "  Water Type",
                        fillColor: Colors.transparent,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    width: double.infinity,
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
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    width: double.infinity,
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
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    width: double.infinity,
                    height: 48,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        gradient: const LinearGradient(
                            colors: [Color(0xFFE8ECFD), Color(0xFF8898E3)])),
                    child: TextFormField(
                      controller: passwordController,
                      // maxLength: 10,
                      obscuringCharacter: '*',
                      // expands: true,
                      // maxLengthEnforcement: ,
                      enabled: true,
                      textDirection: TextDirection.ltr,
                      obscureText: true,
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
                        await signUp(emailController.text.trim(),
                            passwordController.text.trim());
                      } catch (e) {
                        showDialog(
                            context: context,
                            builder: (c) {
                              return ErrorDialog(
                                message: "Something went wrong",
                              );
                            });
                        setState(() {
                          _loading = false;
                        });
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
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white))
                          : buttonLoader,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
