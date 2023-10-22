import 'package:flutter/material.dart';
import 'package:postme/constants/assets_constants.dart';
import 'package:postme/theme/pallete.dart';
import 'package:svg_flutter/svg_flutter.dart';

class UIConstants {
  static AppBar appbar() {
    return AppBar(
      title: SvgPicture.asset(
        AssetsConstants.twitterLogo,
        color: Pallete.blueColor,
        height: 30,
      ),
      centerTitle: true,
    );
  }
}
