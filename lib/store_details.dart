// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

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
        title: Text(
          widget.model.sellerName,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white),
        ),
      ),
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                title: const Text(
                  'Mobile Number',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                trailing: Text(
                  widget.model.phone,
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
                  'Uid',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                trailing: Text(
                  widget.model.sellerUID,
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
              widget.model.isFormFilled == true?ListTile(
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
              ):Container(),
            ],
          ),
        ),
      )),
    );
  }
}
