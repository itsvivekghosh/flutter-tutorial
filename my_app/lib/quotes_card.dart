import 'package:flutter/material.dart';
import 'package:my_app/quotes.dart';

class QuoteCard extends StatelessWidget {
  QuoteCard({this.quote, this.delete});

  final Quote quote;
  final Function delete;

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
            SizedBox(height: 8.0),
            FlatButton.icon(
              onPressed: delete,
              label: Text("Delete Quote"),
              icon: Icon(Icons.delete),
            )
          ],
        ),
      ),
    );
  }
}
