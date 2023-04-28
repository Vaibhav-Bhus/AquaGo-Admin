import 'package:admin/create_store.dart';
import 'package:admin/store_details.dart';
import 'package:admin/store_modedl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StoreList extends StatefulWidget {
  const StoreList({super.key});

  @override
  State<StoreList> createState() => _StoreListState();
}

class _StoreListState extends State<StoreList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddNewStore()));
              },
              child: Container(
                width: double.infinity,
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
                child: const Text("Add New Store",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ),
          ListTile(
            title: Text('Store Name'),
            trailing: Text('Mobile Number'),
          ),
          StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('Stores').snapshots(),
              builder: (context, snapshot) {
                return !snapshot.hasData
                    ? const Padding(padding: EdgeInsets.all(8))
                    : Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: ((context, index) {
                              StoreModel model = StoreModel.fromJson(
                                snapshot.data!.docs[index].data()!
                                    as Map<String, dynamic>,
                              );
                              return Card(
                                elevation: 2,
                                child: ListTile(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              StoreDetails(model: model))),
                                  title: Text(model.name.toString()),
                                  trailing: Text(model.mob.toString()),
                                ),
                              );
                            })));
              })
        ],
      )),
    );
  }
}
