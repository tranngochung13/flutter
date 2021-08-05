import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:getx/api/database.dart';
import 'package:getx/api/transaction.dart';
import 'package:getx/components/rounded_button.dart';
import 'package:getx/components/rounded_input_field.dart';

class AddTodo extends StatefulWidget {
  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final titleController = TextEditingController();

  final descriptionController = TextEditingController();

  List<Transaction> _transactions = <Transaction>[];

  Transaction _transaction = Transaction(title: '', description: '');

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RoundedInputField(
              onChanged: (value) {
                this.setState(() {
                  _transaction.title = value;
                });
              },
              controller: titleController,
              hintText: 'Title',
              icon: Icons.title,
            ),
            RoundedInputField(
              onChanged: (value) {
                this.setState(() {
                  _transaction.description = value;
                });
              },
              controller: descriptionController,
              hintText: 'Description',
              icon: Icons.description,
            ),
            RoundedButton(
              text: "Submit",
              press: () {
                _transactions.add(_transaction);
                Database.addItem(
                  title: _transaction.title,
                  description: _transaction.description,
                );
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(_transaction.title),
                    );
                  },
                );
                // Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
