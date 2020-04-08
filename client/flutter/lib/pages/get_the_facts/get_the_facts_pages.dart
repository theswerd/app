import 'package:WHOFlutter/pages/get_the_facts/get_the_facts_page_header.dart';
import 'package:flutter/material.dart';

class GetTheFactsPage extends StatelessWidget {
  final String title;
  final List<Widget> body;
  final int titleMaxLines;
  const GetTheFactsPage({
    @required this.title,
    @required this.body,
    this.titleMaxLines
  });
  @override
  Widget build(BuildContext context) {
    return Material(
          child: SafeArea(
                      child: Column(
        children: <Widget>[
            GetTheFactsPageHeader(title: this.title, maxLines: this.titleMaxLines,),
            
            ...this.body
        ],
      ),
          ),
    );
  }
}
