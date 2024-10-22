import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final String titel;
  final double amount;
  final DateTime date;

  Transaction(
      {@required this.id,
      @required this.titel,
      @required this.amount,
      @required this.date});
}
