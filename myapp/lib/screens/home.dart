import 'package:flutter/material.dart';
import 'package:myapp/components/transaction.dart';
import 'package:myapp/components/transactionList.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Transaction _transaction = Transaction(content: '', amount: 0.0);
  List<Transaction> _transactions = <Transaction>[];
  final contentController = TextEditingController();
  final amountController = TextEditingController();

  void showSnackBar(text) {
    final snackBar = SnackBar(
      content: Text(text),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _insertTransection() {
    if (_transaction.content.isNotEmpty && _transaction.amount != 0.0) {
      setState(() {
        _transactions.add(_transaction);
        _transaction = Transaction(content: '', amount: 0.0);
        contentController.text = '';
        amountController.text = '';
      });
      showSnackBar('Add success');
    } else {
      showSnackBar('Content or amount is empty');
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextField(
            controller: contentController,
            onChanged: (text) {
              this.setState(() {
                _transaction.content = text;
              });
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(15))),
              labelText: 'Content',
            ),
          ),
          Padding(padding: new EdgeInsets.all(10.0)),
          TextField(
            controller: amountController,
            onChanged: (text) {
              this.setState(() {
                _transaction.amount = double.tryParse(text) ?? 0;
              });
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(15))),
              labelText: 'Amount',
            ),
          ),
          // ignore: deprecated_member_use
          FlatButton(
              child: Text('Submit'),
              color: Colors.amber,
              textColor: Colors.white,
              onPressed: () {
                _insertTransection();
              }),
          ClipRRect(
            child: Center(
              child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/loading.gif',
                  image:
                      'https://cmcdistribution.com.vn/wp-content/uploads/2020/04/load-test-la-gi.jpg'),
            ),
          ),
          TransactionList(transactions: _transactions)
        ],
      ),
    );
  }
}
