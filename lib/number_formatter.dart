import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class NumberFormatter{

  String getMoneyIDRWithoutSymbol(double amount) {
    String _stringAmount;
    FlutterMoneyFormatter fmf = new FlutterMoneyFormatter(
      amount: amount,
      settings: MoneyFormatterSettings(
        symbol: '',
        thousandSeparator: '.',
        symbolAndNumberSeparator: ' ',
        fractionDigits: 0,
      ),
    );

    MoneyFormatterOutput fo = fmf.output;

    _stringAmount = fo.symbolOnLeft;
    //_stringAmount = fo.withoutFractionDigits;

    return _stringAmount;
  }
}