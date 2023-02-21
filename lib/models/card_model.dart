import 'package:flutter/material.dart';

class CardModel {
  String? image;
  String? balance;
  String? period;
  String? cardNumber;
  String? date;
  Color? color;

  CardModel(
      {this.image,
      this.balance,
      this.period,
      this.cardNumber,
      this.date,
      this.color});
}
