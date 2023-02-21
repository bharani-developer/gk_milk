// import 'package:flutter/material.dart';
// ignore_for_file: non_constant_identifier_names

import 'dart:ui';

import 'package:gk_milk/models/banking_model.dart';
import 'package:gk_milk/models/billpay_model.dart';
import 'package:gk_milk/models/card_model.dart';
import 'package:gk_milk/models/recentpayees_model.dart';
import 'package:gk_milk/models/transaction_model.dart';
import 'package:gk_milk/models/walletuser_model.dart';
import 'package:gk_milk/utils/image.dart';
import 'package:nb_utils/nb_utils.dart';

// import 'package:gk_milk/utils/image.dart';
// import 'package:gk_milk/model/banking_model.dart';
import 'package:gk_milk/utils/colors.dart' as c;
// import 'package:gk_milk/model/app_model.dart';

// List<WAWalkThroughModel> waWalkThroughList() {
//   List<WAWalkThroughModel> list = [];
//   list.add(WAWalkThroughModel(
//       title: "Pick up",
//       description:
//           "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.",
//       image: walkthrougk1));
//   list.add(WAWalkThroughModel(
//       title: "Transport",
//       description:
//           "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.",
//       image: walkthrougk2));
//   list.add(WAWalkThroughModel(
//       title: "Dellivery",
//       description:
//           "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.",
//       image: walkthrougk3));

//   return list;
// }

List<BankingHomeModel> bankingHomeList1() {
  List<BankingHomeModel> list = [];
  var list1 = BankingHomeModel(
      title: "Default Account", color: c.balanceColor, bal: "+₹50 USD");
  list.add(list1);

  var list2 = BankingHomeModel(
      title: "Adam Johnson", color: c.primary, bal: "-₹20 USD");
  list.add(list2);

  return list;
}

List<BankingHomeModel2> bankingHomeList2() {
  List<BankingHomeModel2> list = [];

  var list1 = BankingHomeModel2(
      title: "Payment form Paypal",
      icon: ic_Paypal,
      color: c.greenLightColor,
      charge: "+₹50 USD");
  list.add(list1);

  var list2 = BankingHomeModel2(
      title: "Mastercard Charge",
      icon: ic_MasterCard,
      color: c.primary,
      charge: "+₹20 USD");
  list.add(list2);

  var list3 = BankingHomeModel2(
      title: "Shopping at WallMart",
      icon: ic_Wallet,
      color: c.primary,
      charge: "+₹90 USD");
  list.add(list3);

  return list;
}

List<String?> monthList = <String?>[
  "Jan",
  "Feb",
  "Mar",
  "April",
  "May",
  "June",
  "July",
  "Aug",
  "Sep",
  "Oct",
  "Nov",
  "Dec"
];
List<String?> districtList = <String?> [
    'Ariyalur',
    'Chengalpattu',
    'Chennai',
    'Coimbatore',
    'Cuddalore',
    'Dharmapuri',
    'Dindigul',
    'Erode',
    'Kallakurichi',
    'Kancheepuram',
    'Karur',
    'Krishnagiri',
    'Madurai',
    'Mayiladuthurai',
    'Nagapattinam',
    'Kanyakumari',
    'Namakkal',
    'Perambalur',
    'Pudukottai',
    'Ramanathapuram',
    'Ranipet',
    'Salem',
    'Sivagangai',
    'Tenkasi',
    'Thanjavur',
    'Theni',
    'Thiruvallur',
    'Thiruvarur',
    'Tuticorin',
    'Trichirappalli',
    'Thirunelveli',
    'Tirupathur',
    'Tiruppur',
    'Tiruvannamalai',
    'The Nilgiris',
    'Vellore',
    'Viluppuram',
    'Virudhunagar',
  ];
  List<String?> stateList = <String?> [
    'TamilNadu',

  ];
List<String?> waYearList = <String?>[
  "1991",
  "1992",
  "1993",
  "1994",
  "1995",
  "1996",
  "1997",
  "1998",
  "1999",
  "2000",
  "2001",
  "2002",
  "2003",
  "2004",
  "2005",
  "2006",
  "2007",
  "2008",
  "2009",
  "2010",
  "2011",
  "2012",
  "2013",
  "2014",
  "2015",
  "2016",
  "2017",
  "2018",
  "2019",
  "2020",
  "2021",
  "2022",
      "2023"
];
List<String?> waOrgList = <String?>[
  "All",
  "Water",
  "Gas",
  "Electricity",
  "Internet",
  "Education",
  "Landline"
];
List<String?> amountList = ["1", "3", "5", "10"];
List<String?> overViewList = ["All", "Weekly", "Yearly", "Daily", "Monthly"];

List<CardModel> CardList() {
  List<CardModel> cardList = [];
  cardList.add(CardModel(
      balance: '₹40.00',
      period: 'Weekly',
      cardNumber: '123 985 7654327',
      date: '03/23',
      color: const Color(0xFF6C56F9)));
  cardList.add(CardModel(
      balance: '₹1120.00',
      period: 'Monthly',
      cardNumber: '985 123 7654327',
      date: '25/23',
      color: const Color(0xFFFF7426)));
  cardList.add(CardModel(
      balance: '13,440.00',
      period: 'Yearly',
      cardNumber: '765 123 9854327',
      date: '03/25',
      color: const Color(0xFF26C884)));
  return cardList;
}

List<TransactionModel> TransactionList() {
  List<TransactionModel> transactionList = [];
  transactionList.add(TransactionModel(
    color: const Color(0xFFFF7426),
    title: 'Send Money to',
    image: 'assets/icons/wa_bill_pay.png',
    balance: '-₹200,00',
    name: 'James',
    time: 'Today 5:30 PM',
  ));
  transactionList.add(TransactionModel(
    color: const Color(0xFFFF7426),
    title: 'Send Money to',
    image: 'assets/icons/wa_bill_pay.png',
    balance: '-₹540,00',
    name: 'James',
    time: 'Today 5:30 PM',
  ));
  transactionList.add(TransactionModel(
    color: const Color(0xFFFF7426),
    title: 'Send Money to',
    image: 'assets/icons/wa_bill_pay.png',
    balance: '-₹3500,00',
    name: 'James',
    time: 'Today 5:30 PM',
  ));
  transactionList.add(TransactionModel(
    color: const Color(0xFFFF7426),
    title: 'Send Money to',
    image: 'assets/icons/wa_bill_pay.png',
    balance: '-₹220,00',
    name: 'James',
    time: 'Today 5:30 PM',
  ));
  transactionList.add(TransactionModel(
    color: const Color(0xFF26C884),
    title: 'Refund',
    image: 'assets/icons/wa_voucher.png',
    balance: '+₹525,00',
    name: 'Success',
    time: 'Today 6:30 PM',
  ));
  return transactionList;
}

List<RecentPayeesModel> RecentPayeesList() {
  List<RecentPayeesModel> list = [];
  list.add(RecentPayeesModel(
      image:
          'https://www.vrsiddhartha.ac.in/me/wp-content/uploads/learn-press-profile/4/172522ec1028ab781d9dfd17eaca4427.jpg',
      name: 'John',
      number: '123456789'));
  list.add(RecentPayeesModel(
      image:
          'https://royalrajtravels.com/image/1613583503main-qimg-6291c3a117fc230c82785148baef7eed.jpg',
      name: 'Rose',
      number: '78571237'));
  list.add(RecentPayeesModel(
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5yt4pfdz3-lacajgUY5xuRuciElEaMZa9luc29Vgx2oVLDQceaFmxgcUXRzU-IfTZcWA&usqp=CAU',
      name: 'Willam',
      number: '456123522'));
  list.add(RecentPayeesModel(
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5yt4pfdz3-lacajgUY5xuRuciElEaMZa9luc29Vgx2oVLDQceaFmxgcUXRzU-IfTZcWA&usqp=CAU',
      name: 'Willam',
      number: '5568553522'));
  list.add(RecentPayeesModel(
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5yt4pfdz3-lacajgUY5xuRuciElEaMZa9luc29Vgx2oVLDQceaFmxgcUXRzU-IfTZcWA&usqp=CAU',
      name: 'Willam',
      number: '852123522'));
  list.add(RecentPayeesModel(
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIuNPlLLXKdjlBivtZzQxsq-hW9E6YbooFXqDqST7AfuSHGcN45DIDTi5qeLOQHNrNR9g&usqp=CAU',
      name: 'Rose',
      number: '4561222222'));
  list.add(RecentPayeesModel(
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSw9jzCKDNeX4QbAQOAABXMML3djP3ZVEv1-rpbKgfyNCshsC-zhB3Ta2JXdMxvvSOFszg&usqp=CAU',
      name: 'Bella',
      number: '98561233'));
  return list;
}

List<BillPayModel> selectBillList() {
  List<BillPayModel> list = [];
  list.add(BillPayModel(
      title: 'CityBank',
      image: 'assets/images/walletApp/wa_city_bank_image.png'));
  list.add(BillPayModel(
      title: 'Bank of America',
      image: 'assets/images/walletApp/wa_bank_of_america.png'));
  list.add(BillPayModel(
      title: 'Yes Bank', image: 'assets/images/walletApp/wa_yes_bank.png'));
  return list;
}

List<CardModel> wasendViaCardList() {
  List<CardModel> list = [];
  list.add(CardModel(
      balance: '₹12,00,000',
      cardNumber: '123 985 7654327',
      date: '03/23',
      color: const Color(0xFF6C56F9),
      image: 'assets/icons/wa_card.png'));
  list.add(CardModel(
      balance: '₹12,23,000',
      cardNumber: '985 123 7654327',
      date: '25/23',
      color: const Color(0xFFFF7426),
      image: 'assets/icons/wa_card.png'));
  list.add(CardModel(
      balance: '₹23,00,000',
      cardNumber: '765 123 9854327',
      date: '03/25',
      color: const Color(0xFF26C884),
      image: 'assets/icons/wa_card.png'));
  return list;
}

List<WalletUserModel> WalletUserList() {
  List<WalletUserModel> list = [];
  list.add(WalletUserModel(
      image:
          "https://www.vrsiddhartha.ac.in/me/wp-content/uploads/learn-press-profile/4/172522ec1028ab781d9dfd17eaca4427.jpg"));
  list.add(WalletUserModel(
      image:
          "https://royalrajtravels.com/image/1613583503main-qimg-6291c3a117fc230c82785148baef7eed.jpg"));
  list.add(WalletUserModel(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5yt4pfdz3-lacajgUY5xuRuciElEaMZa9luc29Vgx2oVLDQceaFmxgcUXRzU-IfTZcWA&usqp=CAU"));
  list.add(WalletUserModel(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXs_iIewEiaZ3tXb6n6VgaUIONS0B0HjwsqcvA3-EnnaNm0BwX216u2dZl2QTHnP7VOIU&usqp=CAU"));
  list.add(WalletUserModel(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTH7wtiaB5F3B2oaF5699EJCNEtPnjD57ERWKTMjN0h-gpRxrFQ1u68HzFFT3eYJFFNLr4&usqp=CAU"));
  list.add(WalletUserModel(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTH7wtiaB5F3B2oaF5699EJCNEtPnjD57ERWKTMjN0h-gpRxrFQ1u68HzFFT3eYJFFNLr4&usqp=CAU"));
  list.add(WalletUserModel(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTH7wtiaB5F3B2oaF5699EJCNEtPnjD57ERWKTMjN0h-gpRxrFQ1u68HzFFT3eYJFFNLr4&usqp=CAU"));
  list.add(WalletUserModel(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTH7wtiaB5F3B2oaF5699EJCNEtPnjD57ERWKTMjN0h-gpRxrFQ1u68HzFFT3eYJFFNLr4&usqp=CAU"));
  list.add(WalletUserModel(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTH7wtiaB5F3B2oaF5699EJCNEtPnjD57ERWKTMjN0h-gpRxrFQ1u68HzFFT3eYJFFNLr4&usqp=CAU"));
  list.add(WalletUserModel(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTH7wtiaB5F3B2oaF5699EJCNEtPnjD57ERWKTMjN0h-gpRxrFQ1u68HzFFT3eYJFFNLr4&usqp=CAU"));
  return list;
}

// List<WAVoucherModel> waVouchersList() {
//   List<WAVoucherModel> list = [];
//   list.add(WAVoucherModel(
//       image: 'assets/images/walletApp/wa_zara.png',
//       title: 'ZARA Fashion',
//       discountText: '10% Off',
//       expireTime: 'Expires on 15 June',
//       pointsText: 'For 1500 points'));
//   list.add(WAVoucherModel(
//       image: 'assets/images/walletApp/wa_macdonals.jpeg',
//       title: 'Mcdonald\'s',
//       discountText: '5% Off',
//       expireTime: 'Expires on 20 June',
//       pointsText: 'For 600 points'));
//   list.add(WAVoucherModel(
//       image: 'assets/images/walletApp/wa_macdonals.jpeg',
//       title: 'Mcdonald\'s',
//       discountText: '5% Off',
//       expireTime: 'Expires on 20 June',
//       pointsText: 'For 600 points'));
//   list.add(WAVoucherModel(
//       image: 'assets/images/walletApp/wa_zara.png',
//       title: 'ZARA Fashion',
//       discountText: '10% Off',
//       expireTime: 'Expires on 15 June',
//       pointsText: 'For 1500 points'));
//   list.add(WAVoucherModel(
//       image: 'assets/images/walletApp/wa_zara.png',
//       title: 'ZARA Fashion',
//       discountText: '10% Off',
//       expireTime: 'Expires on 15 June',
//       pointsText: 'For 1500 points'));
//   list.add(WAVoucherModel(
//       image: 'assets/images/walletApp/wa_macdonals.jpeg',
//       title: 'Mcdonald\'s',
//       discountText: '5% Off',
//       expireTime: 'Expires on 20 June',
//       pointsText: 'For 600 points'));
//   list.add(WAVoucherModel(
//       image: 'assets/images/walletApp/wa_macdonals.jpeg',
//       title: 'Mcdonald\'s',
//       discountText: '5% Off',
//       expireTime: 'Expires on 20 June',
//       pointsText: 'For 600 points'));
//   list.add(WAVoucherModel(
//       image: 'assets/images/walletApp/wa_zara.png',
//       title: 'ZARA Fashion',
//       discountText: '10% Off',
//       expireTime: 'Expires on 15 June',
//       pointsText: 'For 1500 points'));
//   return list;
// }

List<LanguageDataModel> languageList() {
  return [
    LanguageDataModel(
        id: 1,
        name: 'English',
        languageCode: 'en',
        fullLanguageCode: 'en-US',
        flag: 'assets/images/flag/ic_us.png'),
    LanguageDataModel(
        id: 2,
        name: 'Hindi',
        languageCode: 'hi',
        fullLanguageCode: 'hi-IN',
        flag: 'assets/images/flag/ic_hi.png'),
    LanguageDataModel(
        id: 3,
        name: 'Arabic',
        languageCode: 'ar',
        fullLanguageCode: 'ar-AR',
        flag: 'assets/images/flag/ic_ar.png'),
    LanguageDataModel(
        id: 4,
        name: 'French',
        languageCode: 'fr',
        fullLanguageCode: 'fr-FR',
        flag: 'assets/images/flag/ic_fr.png'),
  ];
}
