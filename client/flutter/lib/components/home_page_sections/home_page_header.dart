import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:who_app/api/content/schema/index_content.dart';
import 'package:who_app/api/linking.dart';
import 'package:who_app/components/themed_text.dart';
import 'package:who_app/constants.dart';
import 'package:who_app/generated/l10n.dart';

class HomePageHeader extends StatelessWidget {
  final IndexPromoType headerType;
  final String title;
  final String subtitle;
  final String buttonText;
  final RouteLink link;

  const HomePageHeader({
    @required this.headerType,
    @required this.title,
    @required this.subtitle,
    @required this.buttonText,
    @required this.link,
  });

  String get svgAssetName {
    switch (this.headerType) {
      // case IndexPromoType.CheckYourSymptoms:
      //   return "assets/svg/home_page_header/check_your_symptoms.svg";
      // case IndexPromoType.ProtectYourself:
      //   return "assets/svg/home_page_header/protect_yourself.svg";
      default:
        return null;
    }
  }

  Color backgroundColor(BuildContext context) {
    switch (this.headerType) {
      case IndexPromoType.CheckYourSymptoms:
        return AppTheme(context).primaryDarkColor;
      case IndexPromoType.ProtectYourself:
        return Color(0xff4ACA8C);
      default:
        return AppTheme(context).primaryDarkColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: HeaderClipper(),
      child: Container(
        padding: EdgeInsets.all(24),
        color: isLight(context)
            ? this.backgroundColor
            : CupertinoColors.darkBackgroundGray,
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 48,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      color: CupertinoColors.white,
                      width: 48,
                      margin: EdgeInsets.only(right: 8),
                    ),
                    Flexible(
                      child: AutoSizeText(
                        S.of(context).commonWorldHealthOrganization,
                        maxLines: 2,
                        maxFontSize: 18,
                        style: TextStyle(
                          color: CupertinoColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 14,
                      ),
                      color: Color.fromARGB(127, 250, 232, 169),
                      width: 1,
                    ),
                    Text(
                      "COVID-19 Response",
                      style: TextStyle(
                        color: Color(0xffFAE8A9),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 32,
              ),
              ThemedText(
                this.title,
                variant: TypographyVariant.title,
                style: TextStyle(
                  color: CupertinoColors.white,
                ),
                textAlign: TextAlign.left,
              ),
              ThemedText(
                this.subtitle,
                variant: TypographyVariant.body,
                style: TextStyle(
                  color: CupertinoColors.white,
                ),
              ),
              Container(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  this.svgAssetName != null
                      ? SvgPicture.asset(this.svgAssetName)
                      : Container(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    child: CupertinoButton(
                      borderRadius: BorderRadius.circular(50),
                      padding: EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 8,
                      ),
                      color: isLight(context)
                          ? CupertinoColors.white
                          : CupertinoColors.systemGrey4,
                      child: ThemedText(
                        this.buttonText,
                        variant: TypographyVariant.button,
                        style: TextStyle(color: AppTheme(context).primaryColor),
                      ),
                      onPressed: () {
                        return this.link.open(context);
                      },
                    ),
                  ),
                ],
              ),
              if (this.svgAssetName == null)
                Container(
                  height: 40,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height);
    path.arcToPoint(Offset(size.width, size.height - 20),
        radius: Radius.elliptical(size.width, 240));
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> path) {
    return false;
  }
}
