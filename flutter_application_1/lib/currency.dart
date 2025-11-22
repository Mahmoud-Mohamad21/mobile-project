import 'package:flutter/material.dart';

class Currency {
  String currency;
  double rate;

  Currency(this.currency, this.rate);

  @override
  String toString() {
    return '$currency | rate: $rate';
  }
}

List<Currency> currencies = [
  Currency('USD', 1.0),
  Currency('EUR', 0.93),
  Currency('GBP', 0.79),
  Currency('JPY', 150.20),
  Currency('AED', 3.67),
];

class MyDropdownMenuWidget extends StatefulWidget {
  const MyDropdownMenuWidget({required this.updateCurrency, super.key});
  final Function(Currency) updateCurrency;

  @override
  State<MyDropdownMenuWidget> createState() => _MyDropdownMenuWidgetState();
}

class _MyDropdownMenuWidgetState extends State<MyDropdownMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      width: 600.0,
      initialSelection: currencies[0],
      onSelected: (currency) {
        setState(() {
          widget.updateCurrency(currency as Currency);
        });
      },
      dropdownMenuEntries: currencies.map<DropdownMenuEntry<Currency>>((
        Currency currency,
      ) {
        return DropdownMenuEntry(value: currency, label: currency.toString());
      }).toList(),
    );
  }
}
