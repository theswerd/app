import 'package:WHOFlutter/pages/get_the_facts/get_the_facts_page_header.dart';
import 'package:flutter/material.dart';

class GetTheFactsPage extends StatelessWidget {
  final String title;
  final Widget body;
  const GetTheFactsPage({
    @required this.title,
    @required this.body
  });
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        GetTheFactsPageHeader(title: this.title),
        this.body
      ],
    );
  }
}
