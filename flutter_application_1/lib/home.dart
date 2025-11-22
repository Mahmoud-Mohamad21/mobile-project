import 'package:flutter/material.dart';
import 'currency.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Currency fromCurrency = currencies.first;
  Currency toCurrency = currencies.first;

  final TextEditingController amountController = TextEditingController();

  double result = 0.0;

  void updateFromCurrency(Currency currency) {
    setState(() {
      fromCurrency = currency;
    });
  }

  void updateToCurrency(Currency currency) {
    setState(() {
      toCurrency = currency;
    });
  }

  void convert() {
    double amount = double.tryParse(amountController.text) ?? 0;

    if (amount <= 0) {
      setState(() {
        result = 0.0;
      });
      return;
    }

    double total = amount / fromCurrency.rate;
    double finalResult = total * toCurrency.rate;

    setState(() {
      result = finalResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text(
          "Currency Converter Application",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Enter Amount need to convert",
                style: TextStyle(fontSize: 22),
              ),

              SizedBox(
                width: 600.0,
                height: 50.0,
                child: TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "Enter amount",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              const SizedBox(height: 30),
              const Text("From Currency", style: TextStyle(fontSize: 22)),
              const SizedBox(height: 30),
              MyDropdownMenuWidget(updateCurrency: updateFromCurrency),
              const SizedBox(height: 30),
              const Text("To Currency", style: TextStyle(fontSize: 22)),
              const SizedBox(height: 30),
              MyDropdownMenuWidget(updateCurrency: updateToCurrency),
              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: convert,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                ),
                child: const Text(
                  "Convert",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),

              const SizedBox(height: 30),

              Text(
                "Result: $result ${toCurrency.currency}",
                style: const TextStyle(fontSize: 25),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
