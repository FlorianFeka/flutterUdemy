import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              // onChanged: (val) {
              // this.titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              // onChanged: (val) {
              // this.amountInput = val;
              // },
            ),
            FlatButton(
              child: Text('Add transaction'),
              textColor: Colors.purple,
              onPressed: () {
                double amount = double.parse(this.amountController.text);
                addTx(this.titleController.text, amount);
              },
            )
          ],
        ),
      ),
    );
  }
}
