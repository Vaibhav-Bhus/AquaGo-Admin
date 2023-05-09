// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:admin/text_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class StoreDetails extends StatefulWidget {
  final model;
  const StoreDetails({super.key, required this.model});

  @override
  State<StoreDetails> createState() => _StoreDetailsState();
}

class _StoreDetailsState extends State<StoreDetails> {
  var jar, bottle;
  getDetails() async {
    try {
      await FirebaseFirestore.instance
          .collection('sellers')
          .doc(widget.model.sellerUID)
          .collection('JarQuantity')
          .doc('JarQuantity')
          .get()
          .then((value) {
        print(value.data()!);
        setState(() {
          bottle = value.data()!['bottle'];
          jar = value.data()!['jar'];
          print(bottle);
          print(jar);
        });
      });
    } catch (e) {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetails();
  }

  Future<void> _showMyDialog(String id) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('UID'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(id),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Center(
                child: Text("Ok"),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF576CD6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 1,
        centerTitle: true,
        title: Text(widget.model.sellerName, style: appBarTextStyle),
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
                    style: contentStyle,
                  ),
                  trailing: Text(widget.model.phone, style: contentStyle),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: const Divider(
                    height: 5,
                    color: Colors.white,
                  ),
                ),
                ListTile(
                  onTap: () => _showMyDialog(widget.model.sellerUID),
                  title: const Text(
                    'Uid',
                    style: contentStyle,
                  ),
                  trailing: Container(
                    alignment: Alignment.centerRight,
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: Text(
                      widget.model.sellerUID,
                      style: contentStyle,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: const Divider(
                    height: 5,
                    color: Colors.white,
                  ),
                ),
                ListTile(
                  title: const Text('Form Status', style: contentStyle),
                  trailing: Text(
                      widget.model.isFormFilled ? 'Filled' : 'Not Filled',
                      style: contentStyle),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: const Divider(
                    height: 5,
                    color: Colors.white,
                  ),
                ),
                ListTile(
                  title: const Text('Rates Status', style: contentStyle),
                  trailing: Text(
                      widget.model.isRatesFilled == 'true'
                          ? 'Filled'
                          : 'Not Filled',
                      style: contentStyle),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: const Divider(
                    height: 5,
                    color: Colors.white,
                  ),
                ),
                ListTile(
                  title: const Text('Water Type', style: contentStyle),
                  trailing: Text(widget.model.waterType, style: contentStyle),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: const Divider(
                    height: 5,
                    color: Colors.white,
                  ),
                ),
                ListTile(
                  title: const Text('Created Time', style: contentStyle),
                  trailing: Text(widget.model.userCreated ?? '0',
                      style: contentStyle),
                ),
                widget.model.isRatesFilled == 'true'
                    ? Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: const Divider(
                          height: 5,
                          color: Colors.white,
                        ),
                      )
                    : Container(),
                widget.model.isRatesFilled == 'true'
                    ? ListTile(
                        title: const Text('Jar Quantity', style: contentStyle),
                        trailing: Text(jar.toString(), style: contentStyle),
                      )
                    : Container(),
                widget.model.isRatesFilled == 'true'
                    ? Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: const Divider(
                          height: 5,
                          color: Colors.white,
                        ),
                      )
                    : Container(),
                widget.model.isRatesFilled == 'true'
                    ? ListTile(
                        title:
                            const Text('Bottle Quantity', style: contentStyle),
                        trailing: Text(bottle.toString(), style: contentStyle),
                      )
                    : Container(),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: const Divider(
                    height: 5,
                    color: Colors.white,
                  ),
                ),
                widget.model.isFormFilled == true
                    ? ListTile(
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: const Text('Address', style: contentStyle),
                        ),
                        subtitle:
                            Text(widget.model.address, style: contentStyle),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
