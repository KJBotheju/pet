import 'dart:io';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../widgets/constant.dart';
import './chart.dart';
import './transaction_list.dart';
import './new_transaction.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class page7 extends StatefulWidget {
  @override
  State<page7> createState() => _page7State();
}

class _page7State extends State<page7> {
  final List<Transaction> _userTransaction = [];

  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _userTransaction.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  Future<void> _addNewTransaction(
      String txTitle, double txAmount, DateTime chosenDate) async {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: chosenDate,
      id: DateTime.now().toString(),
    );

    // Convert the transaction data to a JSON format
    final jsonData = {
      'title': newTx.title,
      'amount': newTx.amount,
      'date': newTx.date.toIso8601String(),
    };

    final response = await http.post(
      Uri.parse(
          'https://petcare-e6024-default-rtdb.asia-southeast1.firebasedatabase.app/time/user.json'), // Append ".json" here
      body: json.encode(jsonData),
    );

    if (response.statusCode == 200) {
      // Successfully added to Firebase
      setState(() {
        _userTransaction.add(newTx);
      });
    } else {
      // Handle the error, e.g., display an error message and debug information
      print('Failed to add transaction to Firebase');
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
    }
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransaction.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    final appBar = AppBar(
      backgroundColor: kPrimaryColor,
      foregroundColor: Colors.black,
      title: Text('Time Spend'),
    );
    final txListWidget = Container(
      height: (mediaQuery.size.height -
              appBar.preferredSize.height -
              mediaQuery.padding.top) *
          0.7,
      child: TransactionList(_userTransaction, _deleteTransaction),
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('show chart'),
                  Switch.adaptive(
                    value: _showChart,
                    onChanged: (val) {
                      setState(() {
                        _showChart = val;
                      });
                    },
                  ),
                ],
              ),
            if (!isLandscape)
              Container(
                height: (mediaQuery.size.height -
                        appBar.preferredSize.height -
                        mediaQuery.padding.top) *
                    0.3,
                child: chart(_recentTransactions),
              ),
            if (!isLandscape) txListWidget,
            if (isLandscape)
              _showChart
                  ? Container(
                      height: (mediaQuery.size.height -
                              appBar.preferredSize.height -
                              mediaQuery.padding.top) *
                          0.7,
                      child: chart(_recentTransactions),
                    )
                  : txListWidget
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Platform.isIOS
          ? Container()
          : FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => _startAddNewTransaction(context),
            ),
    );
  }
}
