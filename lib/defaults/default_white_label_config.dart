//  Copyright (C) 2019 Mohammed El Batya
//
//  This file is part of sputnik_ui.
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
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:sputnik_ui/sticker/sticker_pack.dart';
import 'package:sputnik_ui/theme/sputnik_theme.dart';
import 'package:sputnik_ui/config/global_config_data.dart';

import 'default_whitelabel_theme_data.dart';

class DefaultConfig implements GlobalConfigData {
  @override
  SputnikThemeData get sputnikThemeData => DefaultWhiteLabelThemeData();

  @override
  WidgetBuilder get loginScreenBackground => (BuildContext context) => Container();

  @override
  String get title => 'WhitelabelSputnikMessenger';

  @override
  String get userAgent => 'WhitelabelSputnikMessenger/dev';

  @override
  WidgetBuilder get loginScreenArtwork => (BuildContext context) => AspectRatio(aspectRatio: 1, child: Placeholder());

  @override
  String get defaultDeviceName => 'Phone #1';

  @override
  String get packageName => 'com.example.whitelabel';

  @override
  String get mediaFileDirectoryName => 'whitelabel_app';

  @override
  get timelineBackground => (BuildContext context) => Container();

  @override
  WidgetBuilder getLoadingImageIndicator({String path}) => (_) => CircularProgressIndicator();

  @override
  List<StickerPack> get stickerPacks => [];
}
