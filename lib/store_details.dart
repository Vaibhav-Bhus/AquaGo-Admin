// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:admin/text_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'error_dialog.dart';

class StoreDetails extends StatefulWidget {
  final model;
  const StoreDetails({super.key, required this.model});

  @override
  State<StoreDetails> createState() => _StoreDetailsState();
}

class _StoreDetailsState extends State<StoreDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF576CD6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 1,
        centerTitle: true,
        title: Text(
          widget.model.sellerName,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'Mobile Number',
                    style: titleStyle,
                  ),
                  trailing: Text(widget.model.phone, style: titleStyle),
                ),
                const Divider(
                  height: 5,
                  color: Colors.white,
                ),
                ListTile(
                  title: const Text('Uid', style: titleStyle),
                  trailing: Text(widget.model.sellerUID, style: titleStyle),
                ),
                const Divider(
                  height: 5,
                  color: Colors.white,
                ),
                ListTile(
                  title: const Text(
                    'Form Status',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  trailing: Text(
                    widget.model.isFormFilled ? 'Filled' : 'Not Filled',
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
                const Divider(
                  height: 5,
                  color: Colors.white,
                ),
                ListTile(
                  title: const Text(
                    'Rates Status',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  trailing: Text(
                    widget.model.isRatesFilled == 'true'
                        ? 'Filled'
                        : 'Not Filled',
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
                const Divider(
                  height: 5,
                  color: Colors.white,
                ),
                ListTile(
                  title: const Text(
                    'Water Type',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  trailing: Text(
                    widget.model.waterType,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
                const Divider(
                  height: 5,
                  color: Colors.white,
                ),
                ListTile(
                  title: const Text(
                    'Created Time',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  trailing: Text(
                    widget.model.userCreated ?? '0',
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
                const Divider(
                  height: 5,
                  color: Colors.white,
                ),
                ListTile(
                  title: const Text(
                    'Remaining Payment',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  trailing: Text(
                    widget.model.sellerMoney.toString(),
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
                const Divider(
                  height: 5,
                  color: Colors.white,
                ),
                widget.model.isFormFilled == true
                    ? ListTile(
                        title: const Text(
                          'Address',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        subtitle: Text(
                          widget.model.address,
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      )
                    : Container(),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () async {
                    try {
                      await FirebaseFirestore.instance
                          .collection("sellers")
                          .doc(widget.model.sellerUID)
                          .update({'sellerMoney': 0.0});
                    } catch (e) {
                      showDialog(
                          context: context,
                          builder: (c) {
                            return ErrorDialog(
                              message: "Something went wrong",
                            );
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
                      child: const Text("Payout",
                          style: TextStyle(fontSize: 18, color: Colors.white))),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }

  double? sellerMoney;
}
