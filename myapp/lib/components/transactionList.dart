import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList({required this.transactions});
  ListView _buildListView() {
    return ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: (index) % 2 == 0 ? Colors.green : Colors.teal,
            elevation: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(padding: EdgeInsets.all(10)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                      'Content: ${transactions[index].content}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                    Text('Price: ${transactions[index].amount}',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    Padding(padding: EdgeInsets.only(bottom: 10)),
                  ],
                ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellow)),
                      child: Text('Price: ${transactions[index].amount}',
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                    Padding(padding: EdgeInsets.only(right: 10))
                  ],
                ))
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(height: 500, child: _buildListView());
  }
}
