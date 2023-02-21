import 'package:flutter/material.dart';

class TransactionModel {
  String? image;
  Color? color;
  String? title;
  String? name;
  String? time;
  String? balance;

  TransactionModel(
      {this.image, this.color, this.title, this.name, this.time, this.balance});
}