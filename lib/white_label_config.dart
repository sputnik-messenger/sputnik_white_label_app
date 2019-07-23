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


import 'package:flutter/widgets.dart';
import 'package:sputnik_ui/theme/sputnik_theme.dart';

abstract class WhiteLabelConfig {
  String get packageName;

  String get title;

  String get userAgent;

  String get defaultDeviceName;

  WidgetBuilder get loginScreenArtwork;

  WidgetBuilder get loginScreenBackground;

  SputnikThemeData get sputnikThemeData;

  String get mediaFileDirectoryName;

  WidgetBuilder get timelineBackground;
}
