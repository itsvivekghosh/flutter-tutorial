import 'package:flutter/material.dart';

void main() {
  return runApp(MaterialApp(
    home: QuoteList(),
  ));
}

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<String> quotes = ["hello vivek", "scdsc", "cscdsc", "cscsdc"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text("Awesome Quotes".toUpperCase()),
        centerTitle: true,
        titleSpacing: 1.0,
        backgroundColor: Colors.grey[850],
      ),
      body: Column(children: quotes.map((quote) => Text(quote)).toList()),
    );
  }
}
