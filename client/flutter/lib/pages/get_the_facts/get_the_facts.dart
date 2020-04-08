import 'package:WHOFlutter/components/arrow_button.dart';
import 'package:WHOFlutter/pages/get_the_facts/get_the_facts_carousel.dart';
import 'package:WHOFlutter/pages/get_the_facts/get_the_facts_pages.dart';
import 'package:flutter/material.dart';

class GetTheFacts extends StatelessWidget {
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: this.pageController,
          children: <Widget>[
            GetTheFactsPage(
              title: "Get the Facts",
              body: [
                Text(
                  "It’s more important than ever to get the facts. Pick a topic and learn the truth about the coronavirus.",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                Expanded(child: Container(height: 25)),
                ArrowButton(
                  onPressed: () => goToPage(1),
                  color: Color.fromRGBO(51, 102, 204, 1),
                  title: "Transmission",
                  borderRadius: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                Container(height: 16),
                ArrowButton(
                  onPressed: () => goToPage(2),
                  color: Color.fromRGBO(51, 102, 204, 1),
                  title: "Prevention",
                  borderRadius: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                Container(height: 16),
                ArrowButton(
                  onPressed: () => goToPage(3),
                  color: Color.fromRGBO(51, 102, 204, 1),
                  title: "Detection",
                  borderRadius: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                Container(height: 16),
                ArrowButton(
                  onPressed: () => goToPage(4),
                  color: Color.fromRGBO(51, 102, 204, 1),
                  title: "Risk Groups",
                  borderRadius: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                Container(height: 16),
                ArrowButton(
                  onPressed: () => goToPage(5),
                  color: Color.fromRGBO(51, 102, 204, 1),
                  title: "Treatments",
                  borderRadius: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                Container(height: 16),
              ],
            ),
            GetTheFactsPage(title: "Facts on Transmission", body: [
              CarouselView(carouselItems: [
                CarouselItem(
                  color: Color.fromRGBO(51, 102, 204, 1),
                  message:
                      "Pneumonia vaccines <b pink>do not</b> protect against the new coronavirus",
                  showLearnMore: true,
                ),
                CarouselItem(
                  color: Color.fromRGBO(80, 133, 240, 1),
                  message:
                      "Pneumonia vaccines <b pink>do not</b> protect against the new coronavirus",
                  showLearnMore: true,
                ),
                CarouselItem(
                  color: Color.fromRGBO(51, 102, 204, 1),
                  message:
                      "Pneumonia vaccines <b pink>do not</b> protect against the new coronavirus",
                  showLearnMore: true,
                ),
                CarouselItem(
                  color: Color.fromRGBO(80, 133, 240, 1),
                  message:
                      "Pneumonia vaccines <b pink>do not</b> protect against the new coronavirus",
                  showLearnMore: true,
                ),
              ])
            ])
          ],
        ),
      )),
    );
  }

  Future<void> goToPage(int index) => this.pageController.animateToPage(index,
      duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
}
