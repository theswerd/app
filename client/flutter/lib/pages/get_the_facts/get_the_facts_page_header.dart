import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetTheFactsPageHeader extends StatelessWidget {
  const GetTheFactsPageHeader({@required this.title, this.maxLines = 3});

  final String title;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => showCupertinoModalPopup(
              context: context, builder: (c) => CupertinoActionSheet(
                title: Text("Menu options"),
                cancelButton: CupertinoActionSheetAction(
                  child: Text("Cancel"),
                  onPressed: ()=>Navigator.pop(context)
                ),
                actions: <Widget>[
                  CupertinoActionSheetAction(onPressed: (){
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }, child: Text("Home")),
                  CupertinoActionSheetAction(onPressed: (){
                    
                  }, child: Text("Home"))
                ],
              )),
        ),
        AutoSizeText(
          this.title,
          wrapWords: true,

          maxLines: this.maxLines,
          maxFontSize: 80,
          minFontSize: 50,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(51, 102, 204, 1),
          ),
        ),
      ],
    );
  }
}
