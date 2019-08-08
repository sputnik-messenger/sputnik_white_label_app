//  Copyright (C) 2019 Mohammed El Batya
//
//  This file is part of sputnik_white_label_app.
//
//  sputnik_white_label_app is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.

import 'package:flutter/material.dart';
import 'package:sputnik_ui/theme/sputnik_theme.dart';

class DefaultWhiteLabelThemeData implements SputnikThemeData {
  final ThemeData materialThemeData;
  final Color myMessageBubbleColor;
  final Color successColor;
  final Color warnColor;
  final Color errorColor;
  final MaterialAccentColor accentPalette;
  final MaterialColor primaryPalette;

  DefaultWhiteLabelThemeData._({
    this.myMessageBubbleColor,
    this.materialThemeData,
    this.successColor,
    this.warnColor,
    this.errorColor,
    this.accentPalette,
    this.primaryPalette,
  });

  factory DefaultWhiteLabelThemeData() {
    return DefaultWhiteLabelThemeData._(
      materialThemeData: ThemeData(
        primaryColor: Colors.grey,
        accentColor: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.grey[300]
      ),
      myMessageBubbleColor: Colors.blue,
      successColor: Colors.green,
      warnColor: Colors.orange,
      errorColor: Colors.red,
    );
  }

}
