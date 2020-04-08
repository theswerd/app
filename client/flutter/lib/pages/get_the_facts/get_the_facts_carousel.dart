import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:page_view_indicator/page_view_indicator.dart';

class CarouselView extends StatelessWidget {
  final List<CarouselItem> carouselItems;

  CarouselView({@required this.carouselItems});

  final pageIndexNotifier = ValueNotifier<int>(0);
  final pageController = PageController(viewportFraction: .8);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height-300,
          alignment: Alignment.bottomCenter,
          child: PageView(
            controller: this.pageController,
            onPageChanged: (index) => pageIndexNotifier.value = index,
            children: this.carouselItems,
            pageSnapping: true,
          ),
        ),
        PageViewIndicator(
          pageIndexNotifier: this.pageIndexNotifier,
          length: this.carouselItems.length,
          normalBuilder: (animationController, index) => Circle(
            size: 8.0,
            color: Colors.grey,
          ),
          highlightedBuilder: (animationController, index) => ScaleTransition(
            scale: CurvedAnimation(
              parent: animationController,
              curve: Curves.ease,
            ),
            child: Circle(
              size: 12.0,
              color: Color.fromRGBO(51, 102, 204, 1),
            ),
          ),
        )
      ],
    );
  }
}

class CarouselItem extends StatefulWidget {
  final String message;
  final Color color;
  final bool showLearnMore;

  CarouselItem(
      {@required this.message,
      @required this.color,
      this.showLearnMore = true});

  @override
  _CarouselItemState createState() => _CarouselItemState();
}

class _CarouselItemState extends State<CarouselItem> {
  double expansionTileHeight;

  @override
  void initState() {
    super.initState();
    expansionTileHeight = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
                  child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              onPressed: () {},
              padding: EdgeInsets.all(24),
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              color: this.widget.color,
              child: Column(
                children: <Widget>[
                  Html(
                    data: this.widget.message,
                    defaultTextStyle: TextStyle(fontSize: 35),
                    customTextStyle: (node, textStyle) {
                      if (node.attributes.containsKey("pink")) {
                        return textStyle.copyWith(
                            color: Color.fromRGBO(236, 150, 170, 1));
                      } else {
                        return textStyle.copyWith(color: Colors.white);
                      }
                    },
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FlatButton(
                      padding: EdgeInsets.all(25),
                      color: Colors.white.withOpacity(.2),
                      child: Text("Learn more", textScaleFactor: 1.5),
                      shape: StadiumBorder(),
                      onPressed: () {
                        setState(() {
                          this.expansionTileHeight = 150;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            
          ),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          height: this.expansionTileHeight,
          child: Column(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.close),
                onPressed: (){
                  setState(() {
                    this.expansionTileHeight = 0;
                  });
                },
              ),
              Text("Full description adflsgalfgjbadfk\ngbadkfjgbakfghjbafkgjhabdfk\ngjafbgkajfdhbgakdjhbg asgaksj\nhbaksfjghbafkdgjhbdkfgjhbadfkgjhbakdfhjgb")
            ],
          ),
        )
      ],
    );
  }
}
