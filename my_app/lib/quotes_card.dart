import 'package:flutter/material.dart';
import "quotes.dart";

class QuoteCard extends StatelessWidget {
  const QuoteCard({
    Key key,
    @required this.quote,
  }) : super(key: key);

  final dynamic quote;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(quote.text,
                style: TextStyle(fontSize: 18.0, color: Colors.grey[600])),
            SizedBox(height: 6.0),
            Text(
              quote.author,
              style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
