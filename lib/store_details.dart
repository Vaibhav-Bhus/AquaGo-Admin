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
      appBar: AppBar(),
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            ListTile(
              title: const Text('Store Name'),
              trailing: Text(widget.model.name),
            ),
            ListTile(
              title: const Text('Mobile Number'),
              trailing: Text(widget.model.mob),
            ),
            ListTile(
              title: const Text('Uid'),
              trailing: Text(widget.model.uId),
            ),
            ListTile(
              title: const Text('Form Status'),
              trailing:
                  Text(widget.model.isFormFilled ? 'Filled' : 'not filled'),
            ),
          ],
        ),
      )),
    );
  }
}
