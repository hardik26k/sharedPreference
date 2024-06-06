import 'package:flutter/material.dart';
import 'package:shared_pref_demo/components/app_bar.dart';
import 'package:appwrite/appwrite.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final intController = TextEditingController();
    final priceController = TextEditingController();
    var status = "HEllo";

    void updateStatus(doc) {
      setState(() {
        status = doc;
      });
    }

    Future<void> handleDatabase(invData) async {
      final client = Client()
          .setEndpoint('https://cloud.appwrite.io/v1')
          .setProject('665e9f85000057d6c3fb');

      final databases = Databases(client);

      try {
        final document = databases.createDocument(
          databaseId: '665ea0e20009786b9ce2',
          collectionId: '665ea546003dfd974433',
          documentId: ID.unique(),
          data: invData,
        );
        updateStatus(document.toString());
      } on AppwriteException catch (e) {
        updateStatus(e.toString());
      }
    }

    Future<void> addInventory() async {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Add Inventory"),
          content: Column(
            children: [
              TextField(
                controller: textController,
                decoration: const InputDecoration(
                  helperText: "Item Name",
                ),
              ),
              TextField(
                controller: intController,
                decoration: const InputDecoration(
                  helperText: "Item Quantity",
                ),
              ),
              TextField(
                controller: priceController,
                decoration: const InputDecoration(
                  helperText: "Item Price",
                ),
              ),
            ],
          ),
          actions: [
            MaterialButton(
              onPressed: () {
                handleDatabase({
                  "item_name": textController.text,
                  "item_quantity": int.parse(intController.text),
                  "item_price": double.parse(priceController.text)
                });
                textController.clear();
                intController.clear();
                priceController.clear();
                Navigator.pop(context);
              },
              child: const Text("Create"),
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: const AppBarCustom(),
      drawer: const Drawer(),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1),
          ),
          child: Text(status),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addInventory();
        },
        elevation: 0,
        child: const Icon(Icons.add),
      ),
    );
  }
}
