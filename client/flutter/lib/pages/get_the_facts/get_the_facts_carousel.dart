import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:page_view_indicator/page_view_indicator.dart';

class CarouselView extends StatelessWidget {
  final List<CarouselItem> carouselItems;

  CarouselView({@required this.carouselItems});

  final pageIndexNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 400,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.all(15),
          child: PageView(
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

class CarouselItem extends StatelessWidget {
  final String message;
  final Color color;
  final bool showLearnMore;
  const CarouselItem(
      {@required this.message,
      @required this.color,
      this.showLearnMore = true});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FlatButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: this.color,
        child: Stack(
          children: <Widget>[
            Html(
              data: this.message,
              defaultTextStyle: TextStyle(fontSize: 32),
              customTextStyle: (node, textStyle) {
                if (node.attributes.containsKey("pink")) {
                  return textStyle.copyWith(
                      color: Color.fromRGBO(236, 150, 170, 1));
                } else {
                  return textStyle.copyWith(color: Colors.white);
                }
              },
            ),
            if (this.showLearnMore)
              Positioned(
                bottom: 10,
                right: 0,
                child: FlatButton(
                  color: Colors.white.withOpacity(.2),
                  child: Text("Learn more"),
                  shape: StadiumBorder(),
                  onPressed: () {},
                ),
              )
          ],
        ),
      ),
    );
  }
}
