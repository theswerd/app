import 'package:flutter/material.dart';

class GetTheFactsPageHeader extends StatelessWidget {
  const GetTheFactsPageHeader({
    @required this.title
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(delegate: GetTheFactsHeaderDelegate(this.title), pinned: true,);
  }
}

class GetTheFactsHeaderDelegate extends SliverPersistentHeaderDelegate {
  GetTheFactsHeaderDelegate(this.title);
  final double maxSize = 220;
  final String title;
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints){
          return Padding(
            padding: const EdgeInsets.only(left:8.0,bottom: 8),
            child: Wrap(
              children: <Widget>[
                IconButton(icon:Icon(Icons.menu), onPressed: (){},),
                Text(this.title, style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(51, 102, 204, 1),
                  fontSize: 71 * constraints.maxHeight/this.maxSize
                ),),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  double get maxExtent => this.maxSize;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate _) => true;
}
