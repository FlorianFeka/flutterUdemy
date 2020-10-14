import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteFuntion;

  TransactionList(this.transactions, this.deleteFuntion);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: transactions.isEmpty
          ? LayoutBuilder(
              builder: (ctx, constraints) {
                return Column(
                  children: <Widget>[
                    Text(
                      'No Transaction added yet!',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: constraints.maxHeight * 0.8,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                );
              },
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                Transaction currentTx = transactions[index];
                return Card(
                  elevation: 6,
                  margin: EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 8,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child:
                              Text('\$${currentTx.amount.toStringAsFixed(2)}'),
                        ),
                      ),
                    ),
                    title: Text(
                      currentTx.titel,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(DateFormat.yMMMd().format(currentTx.date)),
                    trailing: MediaQuery.of(context).size.width > 460
                        ? FlatButton.icon(
                            onPressed: () => deleteFuntion(currentTx.id),
                            icon: Icon(Icons.delete),
                            textColor: Theme.of(context).errorColor,
                            label: Text('Delete'),
                          )
                        : IconButton(
                            icon: Icon(Icons.delete),
                            color: Theme.of(context).errorColor,
                            onPressed: () => deleteFuntion(currentTx.id),
                          ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
